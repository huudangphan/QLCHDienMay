using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy.DonHangXuat
{
    public partial class fTaoDonHangOffline : UserControl
    {
        public fTaoDonHangOffline()
        {
            InitializeComponent();
            LoadData();
        }
        public void LoadData()
        {
            txtmakh.Text = GlobalData.makh;
            txttenkh.Text = GlobalData.tenkh;
            txtsdt.Text = GlobalData.sdt;
            txtdiachi.Text = GlobalData.diachi;
            txtdiachi.Enabled = txtmakh.Enabled = txtsdt.Enabled = txttenkh.Enabled = false;
            dataGridView1.DataSource = GlobalData.listMasp;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.Columns[0].HeaderText = "Mã Sản phẩm";
            dataGridView1.Columns[1].HeaderText = "Tên sản phẩm";
            dataGridView1.Columns[2].HeaderText = "Giá bán";
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {

        }
    }
}
