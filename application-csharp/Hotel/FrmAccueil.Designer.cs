namespace Hotel
{
    partial class FrmAccueil
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.mnuPrincipal = new System.Windows.Forms.MenuStrip();
            this.mnuFichier = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuQuitter = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuGestionHotel = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuInformationsHotel = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuChambres = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuReservations = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuGestionClients = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuVisualiserClient = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFicheClient = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuPrincipal.SuspendLayout();
            this.SuspendLayout();
            //
            // mnuPrincipal
            //
            this.mnuPrincipal.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.mnuPrincipal.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuFichier,
            this.mnuGestionHotel,
            this.mnuGestionClients});
            this.mnuPrincipal.Location = new System.Drawing.Point(0, 0);
            this.mnuPrincipal.Name = "mnuPrincipal";
            this.mnuPrincipal.Padding = new System.Windows.Forms.Padding(5, 2, 0, 2);
            this.mnuPrincipal.Size = new System.Drawing.Size(667, 28);
            this.mnuPrincipal.TabIndex = 0;
            this.mnuPrincipal.Text = "mnuPrincipal";
            //
            // mnuFichier
            //
            this.mnuFichier.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuQuitter});
            this.mnuFichier.Name = "mnuFichier";
            this.mnuFichier.Size = new System.Drawing.Size(66, 24);
            this.mnuFichier.Text = "Fichier";
            //
            // mnuQuitter
            //
            this.mnuQuitter.Name = "mnuQuitter";
            this.mnuQuitter.Size = new System.Drawing.Size(138, 26);
            this.mnuQuitter.Text = "Quitter";
            this.mnuQuitter.Click += new System.EventHandler(this.mnuQuitter_Click);
            //
            // mnuGestionHotel
            //
            this.mnuGestionHotel.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuInformationsHotel,
            this.mnuChambres,
            this.mnuReservations});
            this.mnuGestionHotel.Name = "mnuGestionHotel";
            this.mnuGestionHotel.Size = new System.Drawing.Size(139, 24);
            this.mnuGestionHotel.Text = "Gestion de l\'hôtel";
            //
            // mnuInformationsHotel
            //
            this.mnuInformationsHotel.Name = "mnuInformationsHotel";
            this.mnuInformationsHotel.Size = new System.Drawing.Size(252, 26);
            this.mnuInformationsHotel.Text = "Informations de l\'hôtel";
            this.mnuInformationsHotel.Click += new System.EventHandler(this.mnuInformationsHotel_Click);
            //
            // mnuChambres
            //
            this.mnuChambres.Name = "mnuChambres";
            this.mnuChambres.Size = new System.Drawing.Size(252, 26);
            this.mnuChambres.Text = "Gestion des chambres";
            this.mnuChambres.Click += new System.EventHandler(this.mnuChambres_Click);
            //
            // mnuReservations
            //
            this.mnuReservations.Name = "mnuReservations";
            this.mnuReservations.Size = new System.Drawing.Size(252, 26);
            this.mnuReservations.Text = "Réservations de l\'hôtel";
            this.mnuReservations.Click += new System.EventHandler(this.mnuReservations_Click);
            //
            // mnuGestionClients
            //
            this.mnuGestionClients.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuVisualiserClient,
            this.mnuFicheClient});
            this.mnuGestionClients.Name = "mnuGestionClients";
            this.mnuGestionClients.Size = new System.Drawing.Size(146, 24);
            this.mnuGestionClients.Text = "Gestion des clients";
            //
            // mnuVisualiserClient
            //
            this.mnuVisualiserClient.Name = "mnuVisualiserClient";
            this.mnuVisualiserClient.Size = new System.Drawing.Size(258, 26);
            this.mnuVisualiserClient.Text = "Visualiser un client";
            this.mnuVisualiserClient.Click += new System.EventHandler(this.mnuVisualiserClient_Click);
            //
            // mnuFicheClient
            //
            this.mnuFicheClient.Name = "mnuFicheClient";
            this.mnuFicheClient.Size = new System.Drawing.Size(258, 26);
            this.mnuFicheClient.Text = "Créer / modifier un client";
            this.mnuFicheClient.Click += new System.EventHandler(this.mnuFicheClient_Click);
            //
            // FrmAccueil
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(667, 334);
            this.Controls.Add(this.mnuPrincipal);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.mnuPrincipal;
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "FrmAccueil";
            this.Text = "Brit Hotel";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.FrmAccueil_FormClosed);
            this.Load += new System.EventHandler(this.FrmAccueil_Load);
            this.mnuPrincipal.ResumeLayout(false);
            this.mnuPrincipal.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip mnuPrincipal;
        private System.Windows.Forms.ToolStripMenuItem mnuFichier;
        private System.Windows.Forms.ToolStripMenuItem mnuQuitter;
        private System.Windows.Forms.ToolStripMenuItem mnuGestionHotel;
        private System.Windows.Forms.ToolStripMenuItem mnuInformationsHotel;
        private System.Windows.Forms.ToolStripMenuItem mnuChambres;
        private System.Windows.Forms.ToolStripMenuItem mnuReservations;
        private System.Windows.Forms.ToolStripMenuItem mnuGestionClients;
        private System.Windows.Forms.ToolStripMenuItem mnuVisualiserClient;
        private System.Windows.Forms.ToolStripMenuItem mnuFicheClient;
    }
}
