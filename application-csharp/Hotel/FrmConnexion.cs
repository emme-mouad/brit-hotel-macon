using Isopoh.Cryptography.Argon2;
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
    public partial class FrmConnexion : Form
    {
        Bdd maBdd;

        public FrmConnexion()
        {
            InitializeComponent();
            //Appliquer la charte graphique et afficher le logo Brit Hotel
            Charte.Appliquer(this);
            picLogo.Image = Properties.Resources.logo;
        }

        private void FrmConnexion_Load(object sender, EventArgs e)
        {
            //Créer la connexion à la base de données
            maBdd = new Bdd();
        }

        private void btnConnexion_Click(object sender, EventArgs e)
        {
            int identifiant;
            hotel leHotel;
            bool valide;

            //Effacer le message d'erreur précédent
            lblMessage.Text = "";

            //Vérifier que l'identifiant saisi est bien un nombre
            if (!int.TryParse(txtIdentifiant.Text.Trim(), out identifiant))
            {
                lblMessage.Text = "Veuillez saisir le numéro de l'hôtel (chiffres uniquement).";
                txtIdentifiant.Focus();
                return;
            }
            //Vérifier que le mot de passe a été saisi
            if (txtMdp.Text == "")
            {
                lblMessage.Text = "Veuillez saisir le mot de passe.";
                txtMdp.Focus();
                return;
            }

            try
            {
                //Récupérer l'hôtel correspondant à l'identifiant saisi
                leHotel = maBdd.hotels.Where(param => param.id == identifiant).FirstOrDefault();

                //Comparer l'empreinte hash de la base avec la saisie en clair
                valide = false;
                if (leHotel != null && leHotel.motpasse != null)
                {
                    valide = Argon2.Verify(leHotel.motpasse, txtMdp.Text);
                }

                if (valide == true)
                {
                    //Mémoriser l'hôtel connecté pour tous les autres formulaires
                    Varglob.monHotel = leHotel;
                    //Ouvrir l'écran d'accueil et masquer le formulaire de connexion
                    FrmAccueil accueil = new FrmAccueil();
                    accueil.Show();
                    this.Hide();
                }
                else
                {
                    //Message volontairement commun pour ne pas indiquer lequel des deux est faux
                    lblMessage.Text = "Identifiant ou mot de passe incorrect.";
                    txtMdp.Clear();
                    txtMdp.Focus();
                }
            }
            catch (Exception exception)
            {
                //Erreur imprévue (serveur SQL inaccessible, ...) : l'application ne s'arrête pas
                Console.WriteLine(exception.Message);
                lblMessage.Text = "Connexion à la base de données impossible.";
            }
        }
    }
}
