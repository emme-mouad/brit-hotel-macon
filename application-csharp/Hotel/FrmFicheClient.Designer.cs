namespace Hotel
{
    partial class FrmFicheClient
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

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            this.lblTitre = new System.Windows.Forms.Label();
            this.lblId = new System.Windows.Forms.Label();
            this.txtId = new System.Windows.Forms.TextBox();
            this.btnRechercher = new System.Windows.Forms.Button();
            this.lblNom = new System.Windows.Forms.Label();
            this.txtNom = new System.Windows.Forms.TextBox();
            this.lblMail = new System.Windows.Forms.Label();
            this.txtMail = new System.Windows.Forms.TextBox();
            this.lblMotPasse = new System.Windows.Forms.Label();
            this.txtMotPasse = new System.Windows.Forms.TextBox();
            this.lblAideMotPasse = new System.Windows.Forms.Label();
            this.btnCreer = new System.Windows.Forms.Button();
            this.btnModifier = new System.Windows.Forms.Button();
            this.lblMessage = new System.Windows.Forms.Label();
            this.SuspendLayout();
            //
            // lblTitre
            //
            this.lblTitre.AutoSize = true;
            this.lblTitre.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitre.Location = new System.Drawing.Point(20, 15);
            this.lblTitre.Name = "lblTitre";
            this.lblTitre.Size = new System.Drawing.Size(105, 20);
            this.lblTitre.TabIndex = 0;
            this.lblTitre.Text = "Fiche client";
            //
            // lblId
            //
            this.lblId.AutoSize = true;
            this.lblId.Location = new System.Drawing.Point(20, 55);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(73, 13);
            this.lblId.TabIndex = 1;
            this.lblId.Text = "N° du client :";
            //
            // txtId
            //
            this.txtId.Location = new System.Drawing.Point(120, 52);
            this.txtId.MaxLength = 9;
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(80, 20);
            this.txtId.TabIndex = 2;
            this.txtId.TextChanged += new System.EventHandler(this.txtId_TextChanged);
            this.txtId.Enter += new System.EventHandler(this.txtId_Enter);
            this.txtId.Leave += new System.EventHandler(this.txtId_Leave);
            //
            // btnRechercher
            //
            this.btnRechercher.Location = new System.Drawing.Point(210, 50);
            this.btnRechercher.Name = "btnRechercher";
            this.btnRechercher.Size = new System.Drawing.Size(110, 23);
            this.btnRechercher.TabIndex = 3;
            this.btnRechercher.Text = "Rechercher";
            this.btnRechercher.UseVisualStyleBackColor = true;
            this.btnRechercher.Click += new System.EventHandler(this.btnRechercher_Click);
            //
            // lblNom
            //
            this.lblNom.AutoSize = true;
            this.lblNom.Location = new System.Drawing.Point(20, 95);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(35, 13);
            this.lblNom.TabIndex = 4;
            this.lblNom.Text = "Nom :";
            //
            // txtNom
            //
            this.txtNom.Location = new System.Drawing.Point(120, 92);
            this.txtNom.MaxLength = 30;
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(200, 20);
            this.txtNom.TabIndex = 5;
            //
            // lblMail
            //
            this.lblMail.AutoSize = true;
            this.lblMail.Location = new System.Drawing.Point(20, 123);
            this.lblMail.Name = "lblMail";
            this.lblMail.Size = new System.Drawing.Size(32, 13);
            this.lblMail.TabIndex = 6;
            this.lblMail.Text = "Mail :";
            //
            // txtMail
            //
            this.txtMail.Location = new System.Drawing.Point(120, 120);
            this.txtMail.MaxLength = 50;
            this.txtMail.Name = "txtMail";
            this.txtMail.Size = new System.Drawing.Size(200, 20);
            this.txtMail.TabIndex = 7;
            //
            // lblMotPasse
            //
            this.lblMotPasse.AutoSize = true;
            this.lblMotPasse.Location = new System.Drawing.Point(20, 151);
            this.lblMotPasse.Name = "lblMotPasse";
            this.lblMotPasse.Size = new System.Drawing.Size(77, 13);
            this.lblMotPasse.TabIndex = 8;
            this.lblMotPasse.Text = "Mot de passe :";
            //
            // txtMotPasse
            //
            this.txtMotPasse.Location = new System.Drawing.Point(120, 148);
            this.txtMotPasse.Name = "txtMotPasse";
            this.txtMotPasse.Size = new System.Drawing.Size(200, 20);
            this.txtMotPasse.TabIndex = 9;
            this.txtMotPasse.UseSystemPasswordChar = true;
            //
            // lblAideMotPasse
            //
            this.lblAideMotPasse.AutoSize = true;
            this.lblAideMotPasse.ForeColor = System.Drawing.Color.Gray;
            this.lblAideMotPasse.Location = new System.Drawing.Point(120, 171);
            this.lblAideMotPasse.Name = "lblAideMotPasse";
            this.lblAideMotPasse.Size = new System.Drawing.Size(150, 13);
            this.lblAideMotPasse.TabIndex = 10;
            this.lblAideMotPasse.Text = "8 caractères minimum";
            //
            // btnCreer
            //
            this.btnCreer.Location = new System.Drawing.Point(120, 195);
            this.btnCreer.Name = "btnCreer";
            this.btnCreer.Size = new System.Drawing.Size(95, 28);
            this.btnCreer.TabIndex = 11;
            this.btnCreer.Text = "Créer le client";
            this.btnCreer.UseVisualStyleBackColor = true;
            this.btnCreer.Click += new System.EventHandler(this.btnCreer_Click);
            //
            // btnModifier
            //
            this.btnModifier.Enabled = false;
            this.btnModifier.Location = new System.Drawing.Point(225, 195);
            this.btnModifier.Name = "btnModifier";
            this.btnModifier.Size = new System.Drawing.Size(95, 28);
            this.btnModifier.TabIndex = 12;
            this.btnModifier.Text = "Modifier";
            this.btnModifier.UseVisualStyleBackColor = true;
            this.btnModifier.Click += new System.EventHandler(this.btnModifier_Click);
            //
            // lblMessage
            //
            this.lblMessage.AutoSize = true;
            this.lblMessage.ForeColor = System.Drawing.Color.Red;
            this.lblMessage.Location = new System.Drawing.Point(20, 238);
            this.lblMessage.MaximumSize = new System.Drawing.Size(350, 0);
            this.lblMessage.Name = "lblMessage";
            this.lblMessage.Size = new System.Drawing.Size(0, 13);
            this.lblMessage.TabIndex = 13;
            //
            // FrmFicheClient
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(390, 280);
            this.Controls.Add(this.lblMessage);
            this.Controls.Add(this.btnModifier);
            this.Controls.Add(this.btnCreer);
            this.Controls.Add(this.lblAideMotPasse);
            this.Controls.Add(this.txtMotPasse);
            this.Controls.Add(this.lblMotPasse);
            this.Controls.Add(this.txtMail);
            this.Controls.Add(this.lblMail);
            this.Controls.Add(this.txtNom);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.btnRechercher);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.lblTitre);
            this.Name = "FrmFicheClient";
            this.Text = "Fiche client";
            this.Load += new System.EventHandler(this.FrmFicheClient_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitre;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.Button btnRechercher;
        private System.Windows.Forms.Label lblNom;
        private System.Windows.Forms.TextBox txtNom;
        private System.Windows.Forms.Label lblMail;
        private System.Windows.Forms.TextBox txtMail;
        private System.Windows.Forms.Label lblMotPasse;
        private System.Windows.Forms.TextBox txtMotPasse;
        private System.Windows.Forms.Label lblAideMotPasse;
        private System.Windows.Forms.Button btnCreer;
        private System.Windows.Forms.Button btnModifier;
        private System.Windows.Forms.Label lblMessage;
    }
}
