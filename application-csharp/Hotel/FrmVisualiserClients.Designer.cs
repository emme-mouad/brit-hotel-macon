namespace Hotel
{
    partial class FrmVisualiserClients
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
            this.lblTitre = new System.Windows.Forms.Label();
            this.lblIdClient = new System.Windows.Forms.Label();
            this.txtIdClient = new System.Windows.Forms.TextBox();
            this.btnRechercher = new System.Windows.Forms.Button();
            this.lblMessage = new System.Windows.Forms.Label();
            this.lblNom = new System.Windows.Forms.Label();
            this.lblMail = new System.Windows.Forms.Label();
            this.lblReservations = new System.Windows.Forms.Label();
            this.grdReservations = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.grdReservations)).BeginInit();
            this.SuspendLayout();
            //
            // lblTitre
            //
            this.lblTitre.AutoSize = true;
            this.lblTitre.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitre.Location = new System.Drawing.Point(20, 15);
            this.lblTitre.Name = "lblTitre";
            this.lblTitre.Size = new System.Drawing.Size(170, 20);
            this.lblTitre.TabIndex = 0;
            this.lblTitre.Text = "Visualiser un client";
            //
            // lblIdClient
            //
            this.lblIdClient.AutoSize = true;
            this.lblIdClient.Location = new System.Drawing.Point(20, 55);
            this.lblIdClient.Name = "lblIdClient";
            this.lblIdClient.Size = new System.Drawing.Size(73, 13);
            this.lblIdClient.TabIndex = 1;
            this.lblIdClient.Text = "N° du client :";
            //
            // txtIdClient
            //
            this.txtIdClient.Location = new System.Drawing.Point(100, 52);
            this.txtIdClient.MaxLength = 9;
            this.txtIdClient.Name = "txtIdClient";
            this.txtIdClient.Size = new System.Drawing.Size(100, 20);
            this.txtIdClient.TabIndex = 2;
            //
            // btnRechercher
            //
            this.btnRechercher.Location = new System.Drawing.Point(210, 50);
            this.btnRechercher.Name = "btnRechercher";
            this.btnRechercher.Size = new System.Drawing.Size(90, 23);
            this.btnRechercher.TabIndex = 3;
            this.btnRechercher.Text = "Rechercher";
            this.btnRechercher.UseVisualStyleBackColor = true;
            this.btnRechercher.Click += new System.EventHandler(this.btnRechercher_Click);
            //
            // lblMessage
            //
            this.lblMessage.AutoSize = true;
            this.lblMessage.ForeColor = System.Drawing.Color.Red;
            this.lblMessage.Location = new System.Drawing.Point(315, 55);
            this.lblMessage.Name = "lblMessage";
            this.lblMessage.Size = new System.Drawing.Size(0, 13);
            this.lblMessage.TabIndex = 4;
            //
            // lblNom
            //
            this.lblNom.AutoSize = true;
            this.lblNom.Location = new System.Drawing.Point(20, 90);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(35, 13);
            this.lblNom.TabIndex = 5;
            this.lblNom.Text = "Nom :";
            //
            // lblMail
            //
            this.lblMail.AutoSize = true;
            this.lblMail.Location = new System.Drawing.Point(20, 112);
            this.lblMail.Name = "lblMail";
            this.lblMail.Size = new System.Drawing.Size(32, 13);
            this.lblMail.TabIndex = 6;
            this.lblMail.Text = "Mail :";
            //
            // lblReservations
            //
            this.lblReservations.AutoSize = true;
            this.lblReservations.Location = new System.Drawing.Point(20, 142);
            this.lblReservations.Name = "lblReservations";
            this.lblReservations.Size = new System.Drawing.Size(121, 13);
            this.lblReservations.TabIndex = 7;
            this.lblReservations.Text = "Réservations du client :";
            //
            // grdReservations
            //
            this.grdReservations.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdReservations.Location = new System.Drawing.Point(20, 160);
            this.grdReservations.Name = "grdReservations";
            this.grdReservations.Size = new System.Drawing.Size(560, 220);
            this.grdReservations.TabIndex = 8;
            //
            // FrmVisualiserClients
            //
            this.AcceptButton = this.btnRechercher;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 400);
            this.Controls.Add(this.grdReservations);
            this.Controls.Add(this.lblReservations);
            this.Controls.Add(this.lblMail);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.lblMessage);
            this.Controls.Add(this.btnRechercher);
            this.Controls.Add(this.txtIdClient);
            this.Controls.Add(this.lblIdClient);
            this.Controls.Add(this.lblTitre);
            this.Name = "FrmVisualiserClients";
            this.Text = "Visualiser un client";
            this.Load += new System.EventHandler(this.FrmVisualiserClients_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grdReservations)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitre;
        private System.Windows.Forms.Label lblIdClient;
        private System.Windows.Forms.TextBox txtIdClient;
        private System.Windows.Forms.Button btnRechercher;
        private System.Windows.Forms.Label lblMessage;
        private System.Windows.Forms.Label lblNom;
        private System.Windows.Forms.Label lblMail;
        private System.Windows.Forms.Label lblReservations;
        private System.Windows.Forms.DataGridView grdReservations;
    }
}
