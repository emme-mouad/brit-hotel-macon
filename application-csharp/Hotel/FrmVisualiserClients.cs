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
    public partial class FrmVisualiserClients : Form
    {
        Bdd maBdd;
        client leClient;

        public FrmVisualiserClients()
        {
            InitializeComponent();
            Charte.Appliquer(this);
        }

        private void FrmVisualiserClients_Load(object sender, EventArgs e)
        {
            //Paramétrer la mise en forme du datagridview des réservations
            grdReservations.RowHeadersVisible = false;
            grdReservations.AllowUserToAddRows = false;
            grdReservations.AllowUserToDeleteRows = false;
            grdReservations.Columns.Add("colHotel", "Hôtel");
            grdReservations.Columns.Add("colDateDebut", "Date début");
            grdReservations.Columns.Add("colDateFin", "Date fin");
            grdReservations.Columns.Add("colChambres", "N° chambres");
            //Afficher les dates sans l'heure
            grdReservations.Columns["colDateDebut"].DefaultCellStyle.Format = "dd/MM/yyyy";
            grdReservations.Columns["colDateFin"].DefaultCellStyle.Format = "dd/MM/yyyy";
            //Colonnes ajustées à la largeur du datagridview, lecture seule
            grdReservations.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            grdReservations.ReadOnly = true;
            grdReservations.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        private void btnRechercher_Click(object sender, EventArgs e)
        {
            int idClient;

            //Réinitialiser l'affichage du client précédent
            lblMessage.Text = "";
            lblNom.Text = "Nom :";
            lblMail.Text = "Mail :";
            grdReservations.Rows.Clear();

            //Récupérer la saisie utilisateur et vérifier que c'est bien un nombre
            if (!int.TryParse(txtIdClient.Text.Trim(), out idClient))
            {
                lblMessage.Text = "Veuillez saisir un n° de client (chiffres uniquement).";
                txtIdClient.Focus();
                return;
            }

            try
            {
                //Nouvelle connexion à chaque recherche pour relire les données à jour
                //(la fiche du client a pu être modifiée dans une autre fenêtre)
                maBdd = new Bdd();
                //Instancier le client correspondant à l'id saisi
                leClient = maBdd.clients.Where(param => param.id == idClient).FirstOrDefault();

                if (leClient != null)
                {
                    //Afficher le nom et le mail du client
                    lblNom.Text = "Nom : " + leClient.nom;
                    lblMail.Text = "Mail : " + (leClient.mail ?? "");

                    //Parcourir les réservations du client, de la plus ancienne à la plus récente
                    foreach (reservation uneReservation in leClient.reservations.OrderBy(param => param.datedebut))
                    {
                        //Concaténer les numéros des chambres de la réservation
                        string strchambre = "";
                        foreach (chambre uneChambre in uneReservation.chambres)
                        {
                            strchambre = strchambre + uneChambre.numero.ToString() + " ";
                        }

                        grdReservations.Rows.Add(uneReservation.hotel.nom, uneReservation.datedebut,
                                                 uneReservation.datefin, strchambre);
                    }

                    //Prévenir si le client n'a encore aucune réservation
                    if (leClient.reservations.Count == 0)
                    {
                        lblMessage.Text = "Ce client n'a aucune réservation.";
                    }
                }
                else
                {
                    lblMessage.Text = "Aucun client trouvé avec le n° " + idClient + ".";
                    txtIdClient.SelectAll();
                    txtIdClient.Focus();
                }
            }
            catch (Exception exception)
            {
                //Erreur imprévue lors de l'accès à la base : l'application ne s'arrête pas
                Console.WriteLine(exception.Message);
                lblMessage.Text = "Erreur lors de la recherche du client.";
            }
        }
    }
}
