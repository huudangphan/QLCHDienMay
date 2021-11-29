using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy
{
    public partial class fDanhSachSanPham : UserControl
    {
        
        public fDanhSachSanPham()
        {
            InitializeComponent();
            LoadData();
            GlobalData.listMasp = new List<SanPham>();
        }
        public void LoadData()
        {
            string query = "select MaSanPham,TenSanPham,DonGia From SanPham";
            DataTable dt = DataProvider.ExecuteQuery(query);
            dataGridView1.DataSource = dt;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.Columns[0].HeaderText = "Mã Sản phẩm";            
            dataGridView1.Columns[1].HeaderText = "Tên sản phẩm";
            dataGridView1.Columns[2].HeaderText = "Giá bán";
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            DataTable dt = (DataTable)dataGridView1.DataSource;
            if (dt.Rows.Count > 0)
            {

                txtmasp.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
                txttensp.Text = dataGridView1.Rows[index].Cells[1].Value.ToString();
                txtgiaban.Text = dataGridView1.Rows[index].Cells[2].Value.ToString();
                

            }
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            string masp = txtmasp.Text;
            
            GlobalData.listMasp.Add(new SanPham() { masp = masp, tensp = txttensp.Text, giaban = Convert.ToDouble(txtgiaban.Text) });            
            MessageBox.Show("Chọn sản phẩm thành công!","Thông báo", MessageBoxButtons.OK);
        }
    }
}
