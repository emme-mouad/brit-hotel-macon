namespace Hotel
{
    partial class FrmReservations
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

        private void InitializeComponent()
        {
            this.lblTitre = new System.Windows.Forms.Label();
            this.lblDebut = new System.Windows.Forms.Label();
            this.dtpDebut = new System.Windows.Forms.DateTimePicker();
            this.lblFin = new System.Windows.Forms.Label();
            this.dtpFin = new System.Windows.Forms.DateTimePicker();
            this.btnToutes = new System.Windows.Forms.Button();
            this.lblFiltre = new System.Windows.Forms.Label();
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
            this.lblTitre.Size = new System.Drawing.Size(226, 20);
            this.lblTitre.TabIndex = 0;
            this.lblTitre.Text = "Réservations de l\'hôtel";
            //
            // lblDebut
            //
            this.lblDebut.AutoSize = true;
            this.lblDebut.Location = new System.Drawing.Point(20, 58);
            this.lblDebut.Name = "lblDebut";
            this.lblDebut.Size = new System.Drawing.Size(81, 13);
            this.lblDebut.TabIndex = 1;
            this.lblDebut.Text = "Date de début :";
            //
            // dtpDebut
            //
            this.dtpDebut.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDebut.Location = new System.Drawing.Point(107, 55);
            this.dtpDebut.Name = "dtpDebut";
            this.dtpDebut.Size = new System.Drawing.Size(110, 20);
            this.dtpDebut.TabIndex = 2;
            this.dtpDebut.ValueChanged += new System.EventHandler(this.dtpDebut_ValueChanged);
            //
            // lblFin
            //
            this.lblFin.AutoSize = true;
            this.lblFin.Location = new System.Drawing.Point(240, 58);
            this.lblFin.Name = "lblFin";
            this.lblFin.Size = new System.Drawing.Size(65, 13);
            this.lblFin.TabIndex = 3;
            this.lblFin.Text = "Date de fin :";
            //
            // dtpFin
            //
            this.dtpFin.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFin.Location = new System.Drawing.Point(311, 55);
            this.dtpFin.Name = "dtpFin";
            this.dtpFin.Size = new System.Drawing.Size(110, 20);
            this.dtpFin.TabIndex = 4;
            this.dtpFin.ValueChanged += new System.EventHandler(this.dtpFin_ValueChanged);
            //
            // btnToutes
            //
            this.btnToutes.Location = new System.Drawing.Point(445, 53);
            this.btnToutes.Name = "btnToutes";
            this.btnToutes.Size = new System.Drawing.Size(160, 25);
            this.btnToutes.TabIndex = 5;
            this.btnToutes.Text = "Toutes les réservations";
            this.btnToutes.UseVisualStyleBackColor = true;
            this.btnToutes.Click += new System.EventHandler(this.btnToutes_Click);
            //
            // lblFiltre
            //
            this.lblFiltre.AutoSize = true;
            this.lblFiltre.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFiltre.Location = new System.Drawing.Point(20, 92);
            this.lblFiltre.Name = "lblFiltre";
            this.lblFiltre.Size = new System.Drawing.Size(0, 13);
            this.lblFiltre.TabIndex = 6;
            //
            // grdReservations
            //
            this.grdReservations.AllowUserToAddRows = false;
            this.grdReservations.AllowUserToDeleteRows = false;
            this.grdReservations.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdReservations.Location = new System.Drawing.Point(20, 112);
            this.grdReservations.Name = "grdReservations";
            this.grdReservations.ReadOnly = true;
            this.grdReservations.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.grdReservations.Size = new System.Drawing.Size(720, 290);
            this.grdReservations.TabIndex = 7;
            //
            // FrmReservations
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(760, 420);
            this.Controls.Add(this.grdReservations);
            this.Controls.Add(this.lblFiltre);
            this.Controls.Add(this.btnToutes);
            this.Controls.Add(this.dtpFin);
            this.Controls.Add(this.lblFin);
            this.Controls.Add(this.dtpDebut);
            this.Controls.Add(this.lblDebut);
            this.Controls.Add(this.lblTitre);
            this.Name = "FrmReservations";
            this.Text = "Réservations de l\'hôtel";
            this.Load += new System.EventHandler(this.FrmReservations_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grdReservations)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        private System.Windows.Forms.Label lblTitre;
        private System.Windows.Forms.Label lblDebut;
        private System.Windows.Forms.DateTimePicker dtpDebut;
        private System.Windows.Forms.Label lblFin;
        private System.Windows.Forms.DateTimePicker dtpFin;
        private System.Windows.Forms.Button btnToutes;
        private System.Windows.Forms.Label lblFiltre;
        private System.Windows.Forms.DataGridView grdReservations;
    }
}
