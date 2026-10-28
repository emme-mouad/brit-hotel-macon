using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using System.Data.Entity;

namespace Hotel
{
    public partial class FrmReservations : Form
    {
        Bdd maBdd;
        List<reservation> lesReservations;

        public FrmReservations()
        {
            InitializeComponent();
            Charte.Appliquer(this);
        }

        private void FrmReservations_Load(object sender, EventArgs e)
        {
            //Paramétrer la mise en forme du datagridview (5 colonnes)
            grdReservations.RowHeadersVisible = false;
            grdReservations.ColumnCount = 5;
            grdReservations.Columns[0].HeaderText = "N°";
            grdReservations.Columns[1].HeaderText = "Date début";
            grdReservations.Columns[2].HeaderText = "Date fin";
            grdReservations.Columns[3].HeaderText = "Client";
            grdReservations.Columns[4].HeaderText = "N° chambres";
            grdReservations.Columns[0].Width = 50;
            grdReservations.Columns[1].Width = 100;
            grdReservations.Columns[2].Width = 100;
            grdReservations.Columns[3].Width = 220;
            grdReservations.Columns[4].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            //Afficher les dates sans l'heure
            grdReservations.Columns[1].DefaultCellStyle.Format = "dd/MM/yyyy";
            grdReservations.Columns[2].DefaultCellStyle.Format = "dd/MM/yyyy";

            //Au départ, afficher toutes les réservations de l'hôtel
            afficherToutes();
        }

        private void afficherToutes()
        {
            int idHotel = Varglob.monHotel.id;

            try
            {
                //Nouvelle connexion à chaque affichage pour relire les données à jour
                //(un client a pu être modifié dans une autre fenêtre)
                maBdd = new Bdd();
                //Récupérer toutes les réservations de monHotel avec leur client et leurs chambres
                lesReservations = maBdd.reservations.Include(param => param.client)
                                                    .Include(param => param.chambres)
                                                    .Where(param => param.hotel_id == idHotel)
                                                    .OrderBy(param => param.datedebut)
                                                    .ToList();
                afficherReservations("Toutes les réservations de l'hôtel");
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.Message);
                lblFiltre.Text = "Impossible de charger les réservations.";
            }
        }

        private void afficherReservations(string titre)
        {
            //Parcourir lesReservations pour les afficher dans le datagridview
            grdReservations.Rows.Clear();
            foreach (reservation uneReservation in lesReservations)
            {
                //Concaténer les numéros des chambres de la réservation en cours
                string strchambre = "";
                foreach (chambre uneChambre in uneReservation.chambres)
                {
                    strchambre = strchambre + uneChambre.numero.ToString() + " ";
                }

                grdReservations.Rows.Add(uneReservation.id, uneReservation.datedebut, uneReservation.datefin,
                                         uneReservation.client.nom ?? "", strchambre);
            }
            //Rappeler à l'utilisateur ce qui est affiché
            lblFiltre.Text = titre + " : " + lesReservations.Count + " réservation(s)";
        }

        private void dtpDebut_ValueChanged(object sender, EventArgs e)
        {
            int idHotel = Varglob.monHotel.id;
            //Récupérer la date choisie (sans l'heure)
            DateTime dateDebut = new DateTime(dtpDebut.Value.Year, dtpDebut.Value.Month, dtpDebut.Value.Day, 0, 0, 0);

            try
            {
                //Instancier les réservations de monHotel dont la date de début est égale à celle choisie
                maBdd = new Bdd();
                lesReservations = maBdd.reservations.Include(param => param.client)
                                                    .Include(param => param.chambres)
                                                    .Where(param => param.hotel_id == idHotel && param.datedebut == dateDebut)
                                                    .ToList();
                afficherReservations("Réservations commençant le " + dateDebut.ToShortDateString());
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.Message);
                lblFiltre.Text = "Impossible de filtrer les réservations.";
            }
        }

        private void dtpFin_ValueChanged(object sender, EventArgs e)
        {
            int idHotel = Varglob.monHotel.id;
            //Récupérer la date choisie (sans l'heure)
            DateTime dateFin = new DateTime(dtpFin.Value.Year, dtpFin.Value.Month, dtpFin.Value.Day, 0, 0, 0);

            try
            {
                //Instancier les réservations de monHotel dont la date de fin est égale à celle choisie
                maBdd = new Bdd();
                lesReservations = maBdd.reservations.Include(param => param.client)
                                                    .Include(param => param.chambres)
                                                    .Where(param => param.hotel_id == idHotel && param.datefin == dateFin)
                                                    .ToList();
                afficherReservations("Réservations se terminant le " + dateFin.ToShortDateString());
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.Message);
                lblFiltre.Text = "Impossible de filtrer les réservations.";
            }
        }

        private void btnToutes_Click(object sender, EventArgs e)
        {
            //Annuler le filtre et réafficher toutes les réservations
            afficherToutes();
        }
    }
}
