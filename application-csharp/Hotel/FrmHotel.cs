using Isopoh.Cryptography.Argon2;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;

namespace Hotel
{
    public partial class FrmHotel : Form
    {
        Bdd maBdd;
        List<equipement> lesEquipements;
        //Format français pour le prix, quelle que soit la langue de Windows
        CultureInfo culturePrix = new CultureInfo("fr-FR");
        //Bulle d'aide affichant le nom de l'équipement au survol de son logo
        ToolTip bulleEquipement = new ToolTip();

        public FrmHotel()
        {
            InitializeComponent();
            Charte.Appliquer(this);
        }

        private void FrmHotel_Load(object sender, EventArgs e)
        {
            int idHotel = Varglob.monHotel.id;

            //Créer la connexion à la base de données
            maBdd = new Bdd();

            try
            {
                //Ré-instancier monHotel avec maBdd pour afficher les données à jour et pouvoir les sauvegarder
                Varglob.monHotel = maBdd.hotels.Where(param => param.id == idHotel).FirstOrDefault();

                //Afficher les informations de monHotel dans les textbox
                txtNom.Text = Varglob.monHotel.nom;
                txtRue1.Text = Varglob.monHotel.rue1;
                txtRue2.Text = Varglob.monHotel.rue2;
                txtCP.Text = Varglob.monHotel.cp;
                txtVille.Text = Varglob.monHotel.ville;
                txtTel.Text = Varglob.monHotel.telephone;
                txtDesCourt.Text = Varglob.monHotel.descourt;
                txtDesLong.Text = Varglob.monHotel.deslong;
                if (Varglob.monHotel.prix != null)
                {
                    txtPrix.Text = Varglob.monHotel.prix.Value.ToString(culturePrix);
                }

                //Affichage de la liste de tous les équipements dans le listbox en sélection multiple
                lstEquipements.SelectionMode = SelectionMode.MultiSimple;
                lesEquipements = maBdd.equipements.OrderBy(param => param.libelle).ToList();
                lstEquipements.DataSource = lesEquipements;
                lstEquipements.DisplayMember = "libelle";
                lstEquipements.ValueMember = "id";

                //Cocher dans le listbox les équipements de monHotel
                for (int i = 0; i < lesEquipements.Count; i++)
                {
                    //Test si l'un des id équipements de mon hôtel est égal à l'id en cours de la liste d'affichage
                    Boolean coche = Varglob.monHotel.equipements.Any(param => param.id == lesEquipements[i].id);
                    lstEquipements.SetSelected(i, coche);
                }
                afficherLogos();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.Message);
                afficherMessage("Impossible de charger les informations de l'hôtel.", true);
                btnModifier.Enabled = false;
            }
        }

        private void lstEquipements_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Mettre à jour les logos à chaque équipement coché ou décoché
            afficherLogos();
        }

        private void afficherLogos()
        {
            //Retirer les logos affichés précédemment
            while (flpLogos.Controls.Count > 0)
            {
                flpLogos.Controls[0].Dispose();
            }
            //Afficher le logo fourni de chaque équipement sélectionné
            foreach (equipement unEquipement in lstEquipements.SelectedItems)
            {
                Image leLogo = Charte.LogoEquipement(unEquipement.logo);
                if (leLogo != null)
                {
                    PictureBox picLogo = new PictureBox();
                    picLogo.Image = leLogo;
                    picLogo.SizeMode = PictureBoxSizeMode.Zoom;
                    picLogo.Size = new Size(36, 36);
                    picLogo.Margin = new Padding(3);
                    bulleEquipement.SetToolTip(picLogo, unEquipement.libelle);
                    flpLogos.Controls.Add(picLogo);
                }
            }
        }

        private void btnModifier_Click(object sender, EventArgs e)
        {
            int idHotel = Varglob.monHotel.id;
            double prix = 0;
            string nouveauHash = null;

            //Vérifier les saisies avant toute modification de la base
            if (txtNom.Text.Trim() == "")
            {
                afficherMessage("Le nom de l'hôtel est obligatoire.", true);
                txtNom.Focus();
                return;
            }
            //Le prix est lu au format français : le point est accepté comme virgule (59.90 = 59,90)
            //et aucun séparateur de milliers n'est autorisé (sinon "59.90" serait lu 5990 sur un poste italien)
            string saisiePrix = txtPrix.Text.Trim().Replace(".", ",");
            if (saisiePrix != "" && (!double.TryParse(saisiePrix, NumberStyles.Float, culturePrix, out prix) || prix < 0))
            {
                afficherMessage("Le prix doit être un nombre positif (exemple : 60 ou 59,90).", true);
                txtPrix.Focus();
                return;
            }
            //Le mot de passe n'est modifié que si l'un des deux champs a été rempli
            if (txtMotPasse.Text != "" || txtConfirmation.Text != "")
            {
                if (txtMotPasse.Text != txtConfirmation.Text)
                {
                    afficherMessage("Les deux mots de passe saisis sont différents.", true);
                    txtConfirmation.Clear();
                    txtConfirmation.Focus();
                    return;
                }
                if (txtMotPasse.Text.Length < 8)
                {
                    afficherMessage("Le mot de passe doit contenir au moins 8 caractères.", true);
                    txtMotPasse.Focus();
                    return;
                }
                //Hacher le nouveau mot de passe avec Argon2 (jamais de mot de passe en clair dans la base)
                nouveauHash = Argon2.Hash(txtMotPasse.Text);
            }

            try
            {
                //Ré-instancier l'objet monHotel avec maBdd pour permettre la sauvegarde
                Varglob.monHotel = maBdd.hotels.Where(param => param.id == idHotel).FirstOrDefault();

                //Modifier les valeurs des propriétés de Varglob.monHotel avec les valeurs saisies
                Varglob.monHotel.nom = txtNom.Text.Trim();
                Varglob.monHotel.rue1 = txtRue1.Text.Trim();
                //Le complément d'adresse est facultatif : vide = null dans la base
                Varglob.monHotel.rue2 = txtRue2.Text.Trim();
                if (Varglob.monHotel.rue2 == "")
                {
                    Varglob.monHotel.rue2 = null;
                }
                Varglob.monHotel.cp = txtCP.Text.Trim();
                Varglob.monHotel.ville = txtVille.Text.Trim();
                Varglob.monHotel.telephone = txtTel.Text.Trim();
                Varglob.monHotel.descourt = txtDesCourt.Text;
                Varglob.monHotel.deslong = txtDesLong.Text;
                if (txtPrix.Text.Trim() == "")
                {
                    Varglob.monHotel.prix = null;
                }
                else
                {
                    Varglob.monHotel.prix = prix;
                }
                if (nouveauHash != null)
                {
                    Varglob.monHotel.motpasse = nouveauHash;
                }

                //Effacer toute la liste des équipements de monHotel
                Varglob.monHotel.equipements.Clear();
                //Parcourir toutes les lignes du listbox pour ajouter chaque équipement sélectionné
                for (int i = 0; i < lstEquipements.Items.Count; i++)
                {
                    if (lstEquipements.GetSelected(i))
                    {
                        //Find récupère l'équipement dans maBdd (même après une erreur et une nouvelle connexion)
                        equipement unEquipement = maBdd.equipements.Find(lesEquipements[i].id);
                        Varglob.monHotel.equipements.Add(unEquipement);
                    }
                }

                //Sauvegarder dans maBdd
                maBdd.SaveChanges();

                //Mettre à jour le titre de l'écran d'accueil si le nom a changé
                if (this.MdiParent != null)
                {
                    this.MdiParent.Text = "Brit Hotel - " + Varglob.monHotel.id + " " + Varglob.monHotel.nom;
                }
                txtMotPasse.Clear();
                txtConfirmation.Clear();
                if (nouveauHash != null)
                {
                    afficherMessage("Modifications et nouveau mot de passe enregistrés.", false);
                }
                else
                {
                    afficherMessage("Modifications enregistrées.", false);
                }
            }
            catch (Exception exception)
            {
                //Annuler les modifications non sauvegardées en repartant d'une connexion propre
                Console.WriteLine(exception.Message);
                maBdd = new Bdd();
                afficherMessage("Erreur : les modifications n'ont pas été enregistrées.", true);
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
