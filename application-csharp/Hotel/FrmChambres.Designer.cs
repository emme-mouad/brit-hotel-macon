namespace Hotel
{
    partial class FrmChambres
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
            this.grdChambres = new System.Windows.Forms.DataGridView();
            this.lblNouvelleChambre = new System.Windows.Forms.Label();
            this.txtChambre = new System.Windows.Forms.TextBox();
            this.btnAjouter = new System.Windows.Forms.Button();
            this.lblSelection = new System.Windows.Forms.Label();
            this.lblChambre = new System.Windows.Forms.Label();
            this.btnSupprimer = new System.Windows.Forms.Button();
            this.lblMessage = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.grdChambres)).BeginInit();
            this.SuspendLayout();
            //
            // lblTitre
            //
            this.lblTitre.AutoSize = true;
            this.lblTitre.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitre.Location = new System.Drawing.Point(20, 15);
            this.lblTitre.Name = "lblTitre";
            this.lblTitre.Size = new System.Drawing.Size(201, 20);
            this.lblTitre.TabIndex = 0;
            this.lblTitre.Text = "Chambres de l\'hôtel";
            //
            // grdChambres
            //
            this.grdChambres.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdChambres.Location = new System.Drawing.Point(20, 50);
            this.grdChambres.Name = "grdChambres";
            this.grdChambres.Size = new System.Drawing.Size(200, 360);
            this.grdChambres.TabIndex = 6;
            this.grdChambres.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdChambres_CellEnter);
            //
            // lblNouvelleChambre
            //
            this.lblNouvelleChambre.AutoSize = true;
            this.lblNouvelleChambre.Location = new System.Drawing.Point(245, 55);
            this.lblNouvelleChambre.Name = "lblNouvelleChambre";
            this.lblNouvelleChambre.Size = new System.Drawing.Size(141, 13);
            this.lblNouvelleChambre.TabIndex = 1;
            this.lblNouvelleChambre.Text = "N° de la nouvelle chambre :";
            //
            // txtChambre
            //
            this.txtChambre.Location = new System.Drawing.Point(245, 73);
            this.txtChambre.MaxLength = 10;
            this.txtChambre.Name = "txtChambre";
            this.txtChambre.Size = new System.Drawing.Size(120, 20);
            this.txtChambre.TabIndex = 2;
            //
            // btnAjouter
            //
            this.btnAjouter.Location = new System.Drawing.Point(375, 71);
            this.btnAjouter.Name = "btnAjouter";
            this.btnAjouter.Size = new System.Drawing.Size(90, 23);
            this.btnAjouter.TabIndex = 3;
            this.btnAjouter.Text = "Ajouter";
            this.btnAjouter.UseVisualStyleBackColor = true;
            this.btnAjouter.Click += new System.EventHandler(this.btnAjouter_Click);
            //
            // lblSelection
            //
            this.lblSelection.AutoSize = true;
            this.lblSelection.Location = new System.Drawing.Point(245, 130);
            this.lblSelection.Name = "lblSelection";
            this.lblSelection.Size = new System.Drawing.Size(118, 13);
            this.lblSelection.TabIndex = 4;
            this.lblSelection.Text = "Chambre sélectionnée :";
            //
            // lblChambre
            //
            this.lblChambre.AutoSize = true;
            this.lblChambre.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChambre.Location = new System.Drawing.Point(370, 130);
            this.lblChambre.Name = "lblChambre";
            this.lblChambre.Size = new System.Drawing.Size(46, 13);
            this.lblChambre.TabIndex = 5;
            this.lblChambre.Text = "aucune";
            //
            // btnSupprimer
            //
            this.btnSupprimer.Location = new System.Drawing.Point(245, 152);
            this.btnSupprimer.Name = "btnSupprimer";
            this.btnSupprimer.Size = new System.Drawing.Size(145, 23);
            this.btnSupprimer.TabIndex = 7;
            this.btnSupprimer.Text = "Supprimer la chambre";
            this.btnSupprimer.UseVisualStyleBackColor = true;
            this.btnSupprimer.Click += new System.EventHandler(this.btnSupprimer_Click);
            //
            // lblMessage
            //
            this.lblMessage.AutoSize = true;
            this.lblMessage.ForeColor = System.Drawing.Color.Red;
            this.lblMessage.Location = new System.Drawing.Point(245, 200);
            this.lblMessage.MaximumSize = new System.Drawing.Size(260, 0);
            this.lblMessage.Name = "lblMessage";
            this.lblMessage.Size = new System.Drawing.Size(0, 13);
            this.lblMessage.TabIndex = 8;
            //
            // FrmChambres
            //
            this.AcceptButton = this.btnAjouter;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(520, 430);
            this.Controls.Add(this.lblMessage);
            this.Controls.Add(this.btnSupprimer);
            this.Controls.Add(this.lblChambre);
            this.Controls.Add(this.lblSelection);
            this.Controls.Add(this.btnAjouter);
            this.Controls.Add(this.txtChambre);
            this.Controls.Add(this.lblNouvelleChambre);
            this.Controls.Add(this.grdChambres);
            this.Controls.Add(this.lblTitre);
            this.Name = "FrmChambres";
            this.Text = "Gestion des chambres";
            this.Load += new System.EventHandler(this.FrmChambres_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grdChambres)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitre;
        private System.Windows.Forms.DataGridView grdChambres;
        private System.Windows.Forms.Label lblNouvelleChambre;
        private System.Windows.Forms.TextBox txtChambre;
        private System.Windows.Forms.Button btnAjouter;
        private System.Windows.Forms.Label lblSelection;
        private System.Windows.Forms.Label lblChambre;
        private System.Windows.Forms.Button btnSupprimer;
        private System.Windows.Forms.Label lblMessage;
    }
}
