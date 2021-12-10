using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy.NhapHang
{
    public partial class fNhapThemHang : UserControl
    {
        string math = "";
        
        public fNhapThemHang()
        {
            InitializeComponent();
            LoadData();
            GlobalData.lstsp = new List<SanPham>();
            if (GlobalData.type == 2 )
            {
                
                chọnToolStripMenuItem.Enabled = false;
                
            }
            
           
            txtdongia.Enabled = txtmasp.Enabled = txtsl.Enabled = txttensp.Enabled = false;
        }
        public void LoadData()
        {
            string query = "select MaSanPham,TenSanPham,MaThuongHieu,DonGia from SanPham";
            DataTable dt = DataProvider.ExecuteQuery(query);
            dataGridView1.DataSource = dt;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.Columns[0].HeaderText = "Mã sản phẩm";
            dataGridView1.Columns[1].HeaderText = "Tên sản phẩm";
            dataGridView1.Columns[2].HeaderText = "Mã thương hiệu";
            dataGridView1.Columns[3].HeaderText = "Đơn giá";
            
        }
        public void LoadThuongHieu()
        {
            string query = "select MaThuongHieu,TenThuongHieu from ThuongHieu where MaThuongHieu='" + math + "'";
            DataTable dt = DataProvider.ExecuteQuery(query);
            BindingSource bds = new BindingSource();
            bds.DataSource = dt;
            cbth.DataSource = bds;
            cbth.DisplayMember = "TenThuongHieu";
            cbth.ValueMember = "MaThuongHieu";
        }
        public void LoadKho()
        {
            string query = "select MaSanPham, SoLuong from ChiTietKho where MaSanPham='" + txtmasp.Text + "'";
            DataTable dt = DataProvider.ExecuteQuery(query);
            dtgvkho.DataSource = dt;
            dtgvkho.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgvkho.Columns[0].HeaderText = "Mã sản phẩm";
            dtgvkho.Columns[1].HeaderText = "Số lượng tồn";
            

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            DataTable dt = (DataTable)dataGridView1.DataSource;
            if (dt.Rows.Count > 0)
            {
                txtmasp.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
                txttensp.Text= dataGridView1.Rows[index].Cells[1].Value.ToString();
                math= dataGridView1.Rows[index].Cells[2].Value.ToString();
                txtdongia.Text= dataGridView1.Rows[index].Cells[3].Value.ToString();
            }
            LoadThuongHieu();
            LoadKho();
        }

        private void thêmToolStripMenuItem_Click(object sender, EventArgs e)
        {
           
        }

        private void sửaToolStripMenuItem_Click(object sender, EventArgs e)
        {
           
        }

        private void xoáToolStripMenuItem_Click(object sender, EventArgs e)
        {
           
        }

        private void chọnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn chọn "+txttensp.Text, "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
            {
                GlobalData.lstsp.Add(new SanPham() { masp = txtmasp.Text, tensp = txttensp.Text, giaban = double.Parse(txtdongia.Text), soluong = Int32.Parse(numericUpDown1.Value.ToString()) });
            }
            
        }

        private void lưuToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }
    }
}
