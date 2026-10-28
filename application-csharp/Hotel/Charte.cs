using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace Hotel
{
    // Charte graphique commune à tous les écrans (couleurs du logo Brit Hotel)
    internal static class Charte
    {
        public static readonly Color Vert = Color.FromArgb(0, 132, 85);
        public static readonly Color Bleu = Color.FromArgb(0, 119, 197);

        public static void Appliquer(Form leFormulaire)
        {
            //Fond blanc et icône Brit Hotel sur toutes les fenêtres
            leFormulaire.BackColor = Color.White;
            leFormulaire.Icon = Properties.Resources.favicon;

            foreach (Control unControle in leFormulaire.Controls)
            {
                //Titre de l'écran dans le vert du logo
                if (unControle.Name == "lblTitre")
                {
                    unControle.ForeColor = Vert;
                }
                //Datagridview sur fond blanc comme le reste de l'écran
                if (unControle is DataGridView)
                {
                    ((DataGridView)unControle).BackgroundColor = Color.White;
                }
            }
        }

        public static Image LogoEquipement(string nomFichier)
        {
            //Le logo de la base ("wifi.png") correspond à la ressource du même nom ("wifi")
            if (string.IsNullOrEmpty(nomFichier))
            {
                return null;
            }
            string nomRessource = Path.GetFileNameWithoutExtension(nomFichier);
            return Properties.Resources.ResourceManager.GetObject(nomRessource) as Image;
        }
    }
}
