using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy.Kho
{
    public partial class fChiTietPhieuNhap : Form
    {
        public fChiTietPhieuNhap()
        {
            InitializeComponent();
            if (GlobalData.lstsp.Count > 0)
            {
                dataGridView1.DataSource = GlobalData.lstsp;
            }
        }

        private void simpleButton2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            int row = dataGridView1.Rows.Count;
            if (row > 0)
            {

            }
        }
    }
}
