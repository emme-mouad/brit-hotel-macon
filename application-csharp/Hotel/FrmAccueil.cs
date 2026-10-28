using System;
using System.Drawing;
using System.Windows.Forms;

namespace Hotel
{
    public partial class FrmAccueil : Form
    {
        //Logo affiché au centre de l'écran d'accueil (40 % de sa taille d'origine)
        Bitmap logoAccueil = new Bitmap(Properties.Resources.logo, 474, 165);

        public FrmAccueil()
        {
            InitializeComponent();
            Charte.Appliquer(this);
        }

        private void FrmAccueil_Load(object sender, EventArgs e)
        {
            //Afficher le nom de l'hôtel connecté dans la barre de titre
            this.Text = "Brit Hotel - " + Varglob.monHotel.id + " " + Varglob.monHotel.nom;

            //Fond de l'écran d'accueil (zone MDI) : blanc avec le logo Brit Hotel au centre
            foreach (Control unControle in this.Controls)
            {
                if (unControle is MdiClient)
                {
                    unControle.BackColor = Color.White;
                    unControle.Paint += new PaintEventHandler(fondAccueil_Paint);
                    unControle.Resize += new EventHandler(fondAccueil_Resize);
                }
            }
        }

        private void fondAccueil_Paint(object sender, PaintEventArgs e)
        {
            //La zone MDI répète l'image de fond en mosaïque : on dessine donc le logo une seule fois, au centre
            Control leFond = (Control)sender;
            int x = (leFond.ClientSize.Width - logoAccueil.Width) / 2;
            int y = (leFond.ClientSize.Height - logoAccueil.Height) / 2;
            e.Graphics.DrawImage(logoAccueil, x, y, logoAccueil.Width, logoAccueil.Height);
        }

        private void fondAccueil_Resize(object sender, EventArgs e)
        {
            //Redessiner pour garder le logo centré quand la fenêtre change de taille
            ((Control)sender).Invalidate();
        }

        private void ouvrirFormulaire(Form leFormulaire)
        {
            //Si ce formulaire est déjà ouvert, le remettre au premier plan au lieu d'en ouvrir un 2ème
            foreach (Form unFormulaire in this.MdiChildren)
            {
                if (unFormulaire.GetType() == leFormulaire.GetType())
                {
                    unFormulaire.Activate();
                    leFormulaire.Dispose();
                    return;
                }
            }
            //Sinon ouvrir le formulaire à l'intérieur de l'écran d'accueil
            leFormulaire.MdiParent = this;
            leFormulaire.Show();
        }

        private void mnuInformationsHotel_Click(object sender, EventArgs e)
        {
            //US2 : informations et équipements de l'hôtel
            ouvrirFormulaire(new FrmHotel());
        }

        private void mnuChambres_Click(object sender, EventArgs e)
        {
            //US3 : gestion des chambres
            ouvrirFormulaire(new FrmChambres());
        }

        private void mnuReservations_Click(object sender, EventArgs e)
        {
            //US4 : visualisation des réservations
            ouvrirFormulaire(new FrmReservations());
        }

        private void mnuVisualiserClient_Click(object sender, EventArgs e)
        {
            //US5 : visualisation d'un client et de ses réservations
            ouvrirFormulaire(new FrmVisualiserClients());
        }

        private void mnuFicheClient_Click(object sender, EventArgs e)
        {
            //US6 : création et modification d'une fiche client
            ouvrirFormulaire(new FrmFicheClient());
        }

        private void mnuQuitter_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void FrmAccueil_FormClosed(object sender, FormClosedEventArgs e)
        {
            //Le formulaire de connexion est seulement masqué : sans cette ligne l'application resterait ouverte
            Application.Exit();
        }
    }
}
