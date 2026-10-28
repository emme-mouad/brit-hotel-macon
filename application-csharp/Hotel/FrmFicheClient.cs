using Isopoh.Cryptography.Argon2;
using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace Hotel
{
    public partial class FrmFicheClient : Form
    {
        Bdd maBdd;
        client leClient;

        public FrmFicheClient()
        {
            InitializeComponent();
            Charte.Appliquer(this);
        }

        private void FrmFicheClient_Load(object sender, EventArgs e)
        {
            //Créer la connexion à la base de données
            maBdd = new Bdd();
        }

        // Rechercher un client existant grâce à son numéro
        private void btnRechercher_Click(object sender, EventArgs e)
        {
            int id;

            //Vérifier que le numéro saisi est bien un nombre
            if (!int.TryParse(txtId.Text.Trim(), out id))
            {
                afficherMessage("Veuillez saisir un n° de client (chiffres uniquement).", true);
                txtId.Focus();
                return;
            }

            try
            {
                leClient = maBdd.clients.Where(param => param.id == id).FirstOrDefault();

                if (leClient != null)
                {
                    //Afficher la fiche du client (le mot de passe haché n'est jamais affiché)
                    txtNom.Text = leClient.nom;
                    txtMail.Text = leClient.mail;
                    txtMotPasse.Clear();
                    lblAideMotPasse.Text = "Laisser vide pour garder le mot de passe actuel";
                    //La modification n'est possible qu'après avoir trouvé le client
                    btnModifier.Enabled = true;
                    afficherMessage("", false);
                    txtNom.Focus();
                }
                else
                {
                    viderFiche();
                    afficherMessage("Aucun client trouvé avec le n° " + id + ".", true);
                    txtId.SelectAll();
                    txtId.Focus();
                }
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.Message);
                afficherMessage("Erreur lors de la recherche du client.", true);
            }
        }

        // Créer une nouvelle fiche client
        private void btnCreer_Click(object sender, EventArgs e)
        {
            string nom = txtNom.Text.Trim();
            string mail = txtMail.Text.Trim();

            //Vérifier les saisies (le mot de passe est obligatoire pour une création)
            if (!saisieValide(nom, mail))
            {
                return;
            }
            if (txtMotPasse.Text.Length < 8)
            {
                afficherMessage("Le mot de passe doit contenir au moins 8 caractères.", true);
                txtMotPasse.Focus();
                return;
            }

            try
            {
                //Un même mail ne peut pas être utilisé par deux clients
                client autreClient = maBdd.clients.Where(param => param.mail == mail).FirstOrDefault();
                if (autreClient != null)
                {
                    afficherMessage("Ce mail est déjà utilisé par le client n°" + autreClient.id + ".", true);
                    txtMail.Focus();
                    return;
                }

                //Instancier le nouveau client avec son mot de passe haché par Argon2
                client nouveauClient = new client();
                nouveauClient.nom = nom;
                nouveauClient.mail = mail;
                nouveauClient.motpasse = Argon2.Hash(txtMotPasse.Text);

                //Ajouter le client dans la base de données
                maBdd.clients.Add(nouveauClient);
                maBdd.SaveChanges();

                //Afficher le numéro attribué : le client devient le client en cours (modifiable)
                txtId.Text = nouveauClient.id.ToString();
                leClient = nouveauClient;
                btnModifier.Enabled = true;
                txtMotPasse.Clear();
                lblAideMotPasse.Text = "Laisser vide pour garder le mot de passe actuel";
                afficherMessage("Client créé avec le n° " + nouveauClient.id + " (à communiquer au client).", false);
            }
            catch (Exception exception)
            {
                //Repartir d'une connexion propre pour ne pas renvoyer la création ratée
                Console.WriteLine(exception.Message);
                maBdd = new Bdd();
                afficherMessage("Erreur : le client n'a pas pu être créé.", true);
            }
        }

        // Modifier la fiche du client trouvé avec le bouton Rechercher
        private void btnModifier_Click(object sender, EventArgs e)
        {
            string nom = txtNom.Text.Trim();
            string mail = txtMail.Text.Trim();

            //Vérifier les saisies
            if (leClient == null)
            {
                afficherMessage("Recherchez d'abord le client à modifier.", true);
                return;
            }
            if (!saisieValide(nom, mail))
            {
                return;
            }
            //Le mot de passe n'est modifié que s'il a été saisi
            if (txtMotPasse.Text != "" && txtMotPasse.Text.Length < 8)
            {
                afficherMessage("Le mot de passe doit contenir au moins 8 caractères.", true);
                txtMotPasse.Focus();
                return;
            }

            try
            {
                //Le nouveau mail ne doit pas déjà appartenir à un autre client
                int idClient = leClient.id;
                client autreClient = maBdd.clients.Where(param => param.mail == mail && param.id != idClient).FirstOrDefault();
                if (autreClient != null)
                {
                    afficherMessage("Ce mail est déjà utilisé par le client n°" + autreClient.id + ".", true);
                    txtMail.Focus();
                    return;
                }

                //Modifier les propriétés du client puis sauvegarder
                leClient.nom = nom;
                leClient.mail = mail;
                if (txtMotPasse.Text != "")
                {
                    leClient.motpasse = Argon2.Hash(txtMotPasse.Text);
                }
                maBdd.SaveChanges();

                txtMotPasse.Clear();
                afficherMessage("Fiche du client n°" + leClient.id + " modifiée.", false);
            }
            catch (Exception exception)
            {
                //Annuler les modifications non sauvegardées : il faudra rechercher à nouveau le client
                Console.WriteLine(exception.Message);
                maBdd = new Bdd();
                leClient = null;
                btnModifier.Enabled = false;
                afficherMessage("Erreur : la fiche n'a pas été modifiée.", true);
            }
        }

        private void txtId_TextChanged(object sender, EventArgs e)
        {
            //Si le numéro change, la fiche affichée ne correspond plus : il faut rechercher à nouveau
            leClient = null;
            btnModifier.Enabled = false;
            lblAideMotPasse.Text = "8 caractères minimum";
        }

        private void txtId_Enter(object sender, EventArgs e)
        {
            //Dans la zone n° client, la touche Entrée lance la recherche
            this.AcceptButton = btnRechercher;
        }

        private void txtId_Leave(object sender, EventArgs e)
        {
            this.AcceptButton = null;
        }

        private bool saisieValide(string nom, string mail)
        {
            //Le nom est obligatoire
            if (nom == "")
            {
                afficherMessage("Le nom du client est obligatoire.", true);
                txtNom.Focus();
                return false;
            }
            //Le mail doit avoir la forme nom@domaine.ext
            int positionArobase = mail.IndexOf('@');
            if (positionArobase <= 0 || mail.LastIndexOf('.') < positionArobase + 2
                || mail.EndsWith(".") || mail.Contains(" "))
            {
                afficherMessage("Le mail saisi n'est pas valide (exemple : nom@gmail.com).", true);
                txtMail.Focus();
                return false;
            }
            return true;
        }

        private void viderFiche()
        {
            //Effacer la fiche affichée
            txtNom.Clear();
            txtMail.Clear();
            txtMotPasse.Clear();
        }

        private void afficherMessage(string texte, bool erreur)
        {
            //Message en rouge pour une erreur, en vert pour une opération réussie
            lblMessage.ForeColor = erreur ? Color.Red : Color.Green;
            lblMessage.Text = texte;
        }
    }
}
