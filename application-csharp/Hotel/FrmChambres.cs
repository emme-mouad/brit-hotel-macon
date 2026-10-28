using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hotel
{
    public partial class FrmChambres : Form
    {
        Bdd maBdd;
        List<chambre> lesChambres;
        chambre laChambre;

        public FrmChambres()
        {
            InitializeComponent();
            Charte.Appliquer(this);
        }

        private void FrmChambres_Load(object sender, EventArgs e)
        {
            //Créer la connexion à la base de données
            maBdd = new Bdd();

            //Paramétrer la mise en forme du datagridview (2 colonnes : id, numero)
            grdChambres.RowHeadersVisible = false;
            grdChambres.AllowUserToAddRows = false;
            grdChambres.AllowUserToDeleteRows = false;
            grdChambres.ColumnCount = 2;
            grdChambres.Columns[0].HeaderText = "Id";
            grdChambres.Columns[1].HeaderText = "N° chambre";
            grdChambres.Columns[0].Width = 60;
            grdChambres.Columns[1].Width = 117;
            //Le datagridview sera en lecture seule, une seule ligne sélectionnable à la fois
            grdChambres.ReadOnly = true;
            grdChambres.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            grdChambres.MultiSelect = false;

            //Afficher les chambres de l'hôtel connecté
            afficherChambres();
        }

        private void afficherChambres()
        {
            int idHotel = Varglob.monHotel.id;

            //Aucune chambre sélectionnée tant que l'utilisateur n'a pas cliqué dans la liste
            laChambre = null;
            lblChambre.Text = "aucune";

            try
            {
                //Récupérer uniquement les chambres de l'hôtel connecté
                lesChambres = maBdd.chambres.Where(param => param.hotel_id == idHotel)
                                            .OrderBy(param => param.id)
                                            .ToList();

                //Parcourir la liste lesChambres pour les afficher dans le datagridview
                grdChambres.Rows.Clear();
                foreach (chambre uneChambre in lesChambres)
                {
                    grdChambres.Rows.Add(uneChambre.id, uneChambre.numero);
                }
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.Message);
                afficherMessage("Impossible de charger les chambres.", true);
            }
        }

        private void btnAjouter_Click(object sender, EventArgs e)
        {
            string numero = txtChambre.Text.Trim();
            int idHotel = Varglob.monHotel.id;

            //Vérifier que le numéro de la nouvelle chambre a été saisi
            if (numero == "")
            {
                afficherMessage("Veuillez saisir le numéro de la nouvelle chambre.", true);
                txtChambre.Focus();
                return;
            }

            try
            {
                //Ré-instancier monHotel avec maBdd pour permettre la sauvegarde
                Varglob.monHotel = maBdd.hotels.Where(param => param.id == idHotel).FirstOrDefault();

                //Vérifier que le numéro n'existe pas déjà dans l'hôtel
                Boolean existe = Varglob.monHotel.chambres.Any(param => param.numero == numero);
                if (existe)
                {
                    afficherMessage("La chambre n°" + numero + " existe déjà dans votre hôtel.", true);
                }
                else
                {
                    //Instancier la nouvelle chambre et valoriser ses propriétés
                    laChambre = new chambre();
                    laChambre.numero = numero;
                    laChambre.hotel = Varglob.monHotel;
                    //Ajouter la chambre dans la base de données
                    maBdd.chambres.Add(laChambre);
                    maBdd.SaveChanges();

                    //Réafficher toutes les chambres et vider la zone de saisie
                    afficherChambres();
                    afficherMessage("La chambre n°" + numero + " a été ajoutée.", false);
                    txtChambre.Clear();
                }
            }
            catch (Exception exception)
            {
                //Repartir d'une connexion propre pour ne pas renvoyer l'ajout raté à la prochaine sauvegarde
                Console.WriteLine(exception.Message);
                maBdd = new Bdd();
                afficherMessage("Erreur : la chambre n'a pas pu être ajoutée.", true);
            }
            txtChambre.Focus();
        }

        private void grdChambres_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            //Instancier laChambre correspondant à la ligne sélectionnée
            if (e.RowIndex >= 0 && e.RowIndex < lesChambres.Count)
            {
                laChambre = lesChambres[e.RowIndex];
                //Afficher le numéro de la chambre sélectionnée
                lblChambre.Text = "n°" + laChambre.numero;
            }
        }

        private void btnSupprimer_Click(object sender, EventArgs e)
        {
            //Vérifier qu'une chambre a été sélectionnée dans la liste
            if (laChambre == null)
            {
                afficherMessage("Sélectionnez d'abord une chambre dans la liste.", true);
                return;
            }

            try
            {
                //Une chambre déjà réservée ne peut pas être supprimée
                int nbReservations = laChambre.reservations.Count;
                if (nbReservations > 0)
                {
                    afficherMessage("Suppression impossible : la chambre n°" + laChambre.numero
                                    + " figure dans " + nbReservations + " réservation(s).", true);
                    return;
                }

                //Demander confirmation car la suppression est définitive
                DialogResult reponse = MessageBox.Show(
                    "Supprimer définitivement la chambre n°" + laChambre.numero + " ?",
                    "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (reponse == DialogResult.Yes)
                {
                    string numero = laChambre.numero;
                    //Supprimer la chambre sélectionnée dans la base de données
                    maBdd.chambres.Remove(laChambre);
                    maBdd.SaveChanges();
                    //Réafficher les chambres
                    afficherChambres();
                    afficherMessage("La chambre n°" + numero + " a été supprimée.", false);
                }
            }
            catch (Exception exception)
            {
                //Repartir d'une connexion propre et réafficher l'état réel de la base
                Console.WriteLine(exception.Message);
                maBdd = new Bdd();
                afficherChambres();
                afficherMessage("Erreur : la chambre n'a pas pu être supprimée.", true);
            }
        }

        private void afficherMessage(string texte, bool erreur)
        {
            //Message en rouge pour une erreur, en vert pour une opération réussie
            lblMessage.ForeColor = erreur ? Color.Red : Color.Green;
            lblMessage.Text = texte;
        }
    }
}
