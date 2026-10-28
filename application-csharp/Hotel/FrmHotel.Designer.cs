namespace Hotel
{
    partial class FrmHotel
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Code généré par le Concepteur Windows Form

        private void InitializeComponent()
        {
            this.lblTitre = new System.Windows.Forms.Label();
            this.lblNom = new System.Windows.Forms.Label();
            this.txtNom = new System.Windows.Forms.TextBox();
            this.lblRue1 = new System.Windows.Forms.Label();
            this.txtRue1 = new System.Windows.Forms.TextBox();
            this.lblRue2 = new System.Windows.Forms.Label();
            this.txtRue2 = new System.Windows.Forms.TextBox();
            this.lblCP = new System.Windows.Forms.Label();
            this.txtCP = new System.Windows.Forms.TextBox();
            this.lblVille = new System.Windows.Forms.Label();
            this.txtVille = new System.Windows.Forms.TextBox();
            this.lblTel = new System.Windows.Forms.Label();
            this.txtTel = new System.Windows.Forms.TextBox();
            this.lblPrix = new System.Windows.Forms.Label();
            this.txtPrix = new System.Windows.Forms.TextBox();
            this.lblDesCourt = new System.Windows.Forms.Label();
            this.txtDesCourt = new System.Windows.Forms.TextBox();
            this.lblDesLong = new System.Windows.Forms.Label();
            this.txtDesLong = new System.Windows.Forms.TextBox();
            this.lblMotPasse = new System.Windows.Forms.Label();
            this.txtMotPasse = new System.Windows.Forms.TextBox();
            this.lblConfirmation = new System.Windows.Forms.Label();
            this.txtConfirmation = new System.Windows.Forms.TextBox();
            this.lblAideMotPasse = new System.Windows.Forms.Label();
            this.lblEquipements = new System.Windows.Forms.Label();
            this.lstEquipements = new System.Windows.Forms.ListBox();
            this.btnModifier = new System.Windows.Forms.Button();
            this.lblMessage = new System.Windows.Forms.Label();
            this.flpLogos = new System.Windows.Forms.FlowLayoutPanel();
            this.SuspendLayout();
            // lblTitre
            this.lblTitre.AutoSize = true;
            this.lblTitre.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitre.Location = new System.Drawing.Point(30, 15);
            this.lblTitre.Name = "lblTitre";
            this.lblTitre.Size = new System.Drawing.Size(219, 20);
            this.lblTitre.TabIndex = 0;
            this.lblTitre.Text = "Informations de l\'hôtel";
            // lblNom
            this.lblNom.AutoSize = true;
            this.lblNom.Location = new System.Drawing.Point(30, 53);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(35, 13);
            this.lblNom.TabIndex = 1;
            this.lblNom.Text = "Nom :";
            // txtNom
            this.txtNom.Location = new System.Drawing.Point(175, 50);
            this.txtNom.MaxLength = 50;
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(200, 20);
            this.txtNom.TabIndex = 2;
            // lblRue1
            this.lblRue1.AutoSize = true;
            this.lblRue1.Location = new System.Drawing.Point(30, 81);
            this.lblRue1.Name = "lblRue1";
            this.lblRue1.Size = new System.Drawing.Size(45, 13);
            this.lblRue1.TabIndex = 3;
            this.lblRue1.Text = "Adresse :";
            // txtRue1
            this.txtRue1.Location = new System.Drawing.Point(175, 78);
            this.txtRue1.MaxLength = 100;
            this.txtRue1.Name = "txtRue1";
            this.txtRue1.Size = new System.Drawing.Size(200, 20);
            this.txtRue1.TabIndex = 4;
            // lblRue2
            this.lblRue2.AutoSize = true;
            this.lblRue2.Location = new System.Drawing.Point(30, 109);
            this.lblRue2.Name = "lblRue2";
            this.lblRue2.Size = new System.Drawing.Size(118, 13);
            this.lblRue2.TabIndex = 5;
            this.lblRue2.Text = "Complément d\'adresse :";
            // txtRue2
            this.txtRue2.Location = new System.Drawing.Point(175, 106);
            this.txtRue2.MaxLength = 100;
            this.txtRue2.Name = "txtRue2";
            this.txtRue2.Size = new System.Drawing.Size(200, 20);
            this.txtRue2.TabIndex = 6;
            // lblCP
            this.lblCP.AutoSize = true;
            this.lblCP.Location = new System.Drawing.Point(30, 137);
            this.lblCP.Name = "lblCP";
            this.lblCP.Size = new System.Drawing.Size(70, 13);
            this.lblCP.TabIndex = 7;
            this.lblCP.Text = "Code postal :";
            // txtCP
            this.txtCP.Location = new System.Drawing.Point(175, 134);
            this.txtCP.MaxLength = 10;
            this.txtCP.Name = "txtCP";
            this.txtCP.Size = new System.Drawing.Size(80, 20);
            this.txtCP.TabIndex = 8;
            // lblVille
            this.lblVille.AutoSize = true;
            this.lblVille.Location = new System.Drawing.Point(30, 165);
            this.lblVille.Name = "lblVille";
            this.lblVille.Size = new System.Drawing.Size(32, 13);
            this.lblVille.TabIndex = 9;
            this.lblVille.Text = "Ville :";
            // txtVille
            this.txtVille.Location = new System.Drawing.Point(175, 162);
            this.txtVille.MaxLength = 50;
            this.txtVille.Name = "txtVille";
            this.txtVille.Size = new System.Drawing.Size(200, 20);
            this.txtVille.TabIndex = 10;
            // lblTel
            this.lblTel.AutoSize = true;
            this.lblTel.Location = new System.Drawing.Point(30, 193);
            this.lblTel.Name = "lblTel";
            this.lblTel.Size = new System.Drawing.Size(64, 13);
            this.lblTel.TabIndex = 11;
            this.lblTel.Text = "Téléphone :";
            // txtTel
            this.txtTel.Location = new System.Drawing.Point(175, 190);
            this.txtTel.MaxLength = 20;
            this.txtTel.Name = "txtTel";
            this.txtTel.Size = new System.Drawing.Size(150, 20);
            this.txtTel.TabIndex = 12;
            // lblPrix
            this.lblPrix.AutoSize = true;
            this.lblPrix.Location = new System.Drawing.Point(30, 221);
            this.lblPrix.Name = "lblPrix";
            this.lblPrix.Size = new System.Drawing.Size(93, 13);
            this.lblPrix.TabIndex = 13;
            this.lblPrix.Text = "Prix de la nuit (€) :";
            // txtPrix
            this.txtPrix.Location = new System.Drawing.Point(175, 218);
            this.txtPrix.MaxLength = 10;
            this.txtPrix.Name = "txtPrix";
            this.txtPrix.Size = new System.Drawing.Size(80, 20);
            this.txtPrix.TabIndex = 14;
            // lblDesCourt
            this.lblDesCourt.AutoSize = true;
            this.lblDesCourt.Location = new System.Drawing.Point(30, 249);
            this.lblDesCourt.Name = "lblDesCourt";
            this.lblDesCourt.Size = new System.Drawing.Size(98, 13);
            this.lblDesCourt.TabIndex = 15;
            this.lblDesCourt.Text = "Description courte :";
            // txtDesCourt
            this.txtDesCourt.Location = new System.Drawing.Point(175, 246);
            this.txtDesCourt.Multiline = true;
            this.txtDesCourt.Name = "txtDesCourt";
            this.txtDesCourt.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtDesCourt.Size = new System.Drawing.Size(200, 40);
            this.txtDesCourt.TabIndex = 16;
            // lblDesLong
            this.lblDesLong.AutoSize = true;
            this.lblDesLong.Location = new System.Drawing.Point(30, 297);
            this.lblDesLong.Name = "lblDesLong";
            this.lblDesLong.Size = new System.Drawing.Size(97, 13);
            this.lblDesLong.TabIndex = 17;
            this.lblDesLong.Text = "Description longue :";
            // txtDesLong
            this.txtDesLong.Location = new System.Drawing.Point(175, 294);
            this.txtDesLong.Multiline = true;
            this.txtDesLong.Name = "txtDesLong";
            this.txtDesLong.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtDesLong.Size = new System.Drawing.Size(200, 80);
            this.txtDesLong.TabIndex = 18;
            // lblMotPasse
            this.lblMotPasse.AutoSize = true;
            this.lblMotPasse.Location = new System.Drawing.Point(30, 389);
            this.lblMotPasse.Name = "lblMotPasse";
            this.lblMotPasse.Size = new System.Drawing.Size(122, 13);
            this.lblMotPasse.TabIndex = 19;
            this.lblMotPasse.Text = "Nouveau mot de passe :";
            // txtMotPasse
            this.txtMotPasse.Location = new System.Drawing.Point(175, 386);
            this.txtMotPasse.Name = "txtMotPasse";
            this.txtMotPasse.Size = new System.Drawing.Size(150, 20);
            this.txtMotPasse.TabIndex = 20;
            this.txtMotPasse.UseSystemPasswordChar = true;
            // lblConfirmation
            this.lblConfirmation.AutoSize = true;
            this.lblConfirmation.Location = new System.Drawing.Point(30, 417);
            this.lblConfirmation.Name = "lblConfirmation";
            this.lblConfirmation.Size = new System.Drawing.Size(138, 13);
            this.lblConfirmation.TabIndex = 21;
            this.lblConfirmation.Text = "Confirmer le mot de passe :";
            // txtConfirmation
            this.txtConfirmation.Location = new System.Drawing.Point(175, 414);
            this.txtConfirmation.Name = "txtConfirmation";
            this.txtConfirmation.Size = new System.Drawing.Size(150, 20);
            this.txtConfirmation.TabIndex = 22;
            this.txtConfirmation.UseSystemPasswordChar = true;
            // lblAideMotPasse
            this.lblAideMotPasse.AutoSize = true;
            this.lblAideMotPasse.ForeColor = System.Drawing.Color.Gray;
            this.lblAideMotPasse.Location = new System.Drawing.Point(175, 438);
            this.lblAideMotPasse.Name = "lblAideMotPasse";
            this.lblAideMotPasse.Size = new System.Drawing.Size(190, 13);
            this.lblAideMotPasse.TabIndex = 23;
            this.lblAideMotPasse.Text = "Laisser vide pour garder le mot de passe actuel";
            // lblEquipements
            this.lblEquipements.AutoSize = true;
            this.lblEquipements.Location = new System.Drawing.Point(410, 53);
            this.lblEquipements.Name = "lblEquipements";
            this.lblEquipements.Size = new System.Drawing.Size(177, 13);
            this.lblEquipements.TabIndex = 24;
            this.lblEquipements.Text = "Équipements (cliquer pour cocher) :";
            // lstEquipements
            this.lstEquipements.FormattingEnabled = true;
            this.lstEquipements.Location = new System.Drawing.Point(410, 72);
            this.lstEquipements.Name = "lstEquipements";
            this.lstEquipements.Size = new System.Drawing.Size(200, 186);
            this.lstEquipements.TabIndex = 25;
            this.lstEquipements.SelectedIndexChanged += new System.EventHandler(this.lstEquipements_SelectedIndexChanged);
            // flpLogos
            this.flpLogos.Location = new System.Drawing.Point(407, 264);
            this.flpLogos.Name = "flpLogos";
            this.flpLogos.Size = new System.Drawing.Size(215, 90);
            this.flpLogos.TabIndex = 28;
            // btnModifier
            this.btnModifier.Location = new System.Drawing.Point(410, 386);
            this.btnModifier.Name = "btnModifier";
            this.btnModifier.Size = new System.Drawing.Size(200, 30);
            this.btnModifier.TabIndex = 26;
            this.btnModifier.Text = "Enregistrer les modifications";
            this.btnModifier.UseVisualStyleBackColor = true;
            this.btnModifier.Click += new System.EventHandler(this.btnModifier_Click);
            // lblMessage
            this.lblMessage.AutoSize = true;
            this.lblMessage.ForeColor = System.Drawing.Color.Red;
            this.lblMessage.Location = new System.Drawing.Point(410, 424);
            this.lblMessage.MaximumSize = new System.Drawing.Size(210, 0);
            this.lblMessage.Name = "lblMessage";
            this.lblMessage.Size = new System.Drawing.Size(0, 13);
            this.lblMessage.TabIndex = 27;
            //
            // FrmHotel
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(640, 470);
            this.Controls.Add(this.flpLogos);
            this.Controls.Add(this.lblMessage);
            this.Controls.Add(this.btnModifier);
            this.Controls.Add(this.lstEquipements);
            this.Controls.Add(this.lblEquipements);
            this.Controls.Add(this.lblAideMotPasse);
            this.Controls.Add(this.txtConfirmation);
            this.Controls.Add(this.lblConfirmation);
            this.Controls.Add(this.txtMotPasse);
            this.Controls.Add(this.lblMotPasse);
            this.Controls.Add(this.txtDesLong);
            this.Controls.Add(this.lblDesLong);
            this.Controls.Add(this.txtDesCourt);
            this.Controls.Add(this.lblDesCourt);
            this.Controls.Add(this.txtPrix);
            this.Controls.Add(this.lblPrix);
            this.Controls.Add(this.txtTel);
            this.Controls.Add(this.lblTel);
            this.Controls.Add(this.txtVille);
            this.Controls.Add(this.lblVille);
            this.Controls.Add(this.txtCP);
            this.Controls.Add(this.lblCP);
            this.Controls.Add(this.txtRue2);
            this.Controls.Add(this.lblRue2);
            this.Controls.Add(this.txtRue1);
            this.Controls.Add(this.lblRue1);
            this.Controls.Add(this.txtNom);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.lblTitre);
            this.Name = "FrmHotel";
            this.Text = "Informations de l\'hôtel";
            this.Load += new System.EventHandler(this.FrmHotel_Load);
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.Label lblTitre;
        private System.Windows.Forms.Label lblNom;
        private System.Windows.Forms.TextBox txtNom;
        private System.Windows.Forms.Label lblRue1;
        private System.Windows.Forms.TextBox txtRue1;
        private System.Windows.Forms.Label lblRue2;
        private System.Windows.Forms.TextBox txtRue2;
        private System.Windows.Forms.Label lblCP;
        private System.Windows.Forms.TextBox txtCP;
        private System.Windows.Forms.Label lblVille;
        private System.Windows.Forms.TextBox txtVille;
        private System.Windows.Forms.Label lblTel;
        private System.Windows.Forms.TextBox txtTel;
        private System.Windows.Forms.Label lblPrix;
        private System.Windows.Forms.TextBox txtPrix;
        private System.Windows.Forms.Label lblDesCourt;
        private System.Windows.Forms.TextBox txtDesCourt;
        private System.Windows.Forms.Label lblDesLong;
        private System.Windows.Forms.TextBox txtDesLong;
        private System.Windows.Forms.Label lblMotPasse;
        private System.Windows.Forms.TextBox txtMotPasse;
        private System.Windows.Forms.Label lblConfirmation;
        private System.Windows.Forms.TextBox txtConfirmation;
        private System.Windows.Forms.Label lblAideMotPasse;
        private System.Windows.Forms.Label lblEquipements;
        private System.Windows.Forms.ListBox lstEquipements;
        private System.Windows.Forms.Button btnModifier;
        private System.Windows.Forms.Label lblMessage;
        private System.Windows.Forms.FlowLayoutPanel flpLogos;
    }
}
