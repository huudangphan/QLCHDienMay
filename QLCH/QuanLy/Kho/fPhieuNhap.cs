using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy.Kho
{
    public partial class fPhieuNhap : UserControl
    {
        string math = "";
        string filename = "";
        string flag = "";
        string image = "";
        public fPhieuNhap()
        {
            InitializeComponent();
            LoadData();
            txtdongia.Enabled = txtmasp.Enabled =  txttensp.Enabled = false;
            simpleButton1.Enabled = false;
            lưuToolStripMenuItem.Enabled = false;
            GlobalData.lstsp = new List<SanPham>();
            chiTiếtToolStripMenuItem.Enabled = false;
            cbnhacc.Enabled = false;
            simpleButton2.Enabled = false;
        }
        public void LoadData()
        {
            string query = "select MaSanPham,TenSanPham,MaThuongHieu,DonGia,AnhMinhHoa from SanPham";
            DataTable dt = DataProvider.ExecuteQuery(query);
            dataGridView1.DataSource = dt;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.Columns[0].HeaderText = "Mã sản phẩm";
            dataGridView1.Columns[1].HeaderText = "Tên sản phẩm";
            dataGridView1.Columns[2].HeaderText = "Mã thương hiệu";
            dataGridView1.Columns[3].HeaderText = "Đơn giá";
            dataGridView1.Columns[4].HeaderText = "Ảnh Minh Hoạ";
            
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
        public void LoadNhaCungCap()
        {
            string query = "select MaNCC,TenNCC from NhaCungCap";
            DataTable dt = DataProvider.ExecuteQuery(query);
            BindingSource bds = new BindingSource();
            bds.DataSource = dt;
            cbnhacc.DataSource = bds;
            cbnhacc.DisplayMember = "TenNCC";
            cbnhacc.ValueMember = "MaNCC";
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
        public void LoadAnh(string link)
        {
            try
            {
                string path = @"D:\CSDLPT\QLCH\QuanLy\Resources\" + link+".jpg";
                pictureBox1.Image = Image.FromFile(path);
                pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            }
            catch (Exception ex)
            {
                string error = ex.Message.ToString();
                MessageBox.Show("Xảy ra lỗi khi load ảnh");
            }
           
        }
        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                string link_image = "";
                int index = dataGridView1.CurrentCell.RowIndex;
                DataTable dt = (DataTable)dataGridView1.DataSource;
                if (dt.Rows.Count > 0)
                {
                    txtmasp.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
                    txttensp.Text = dataGridView1.Rows[index].Cells[1].Value.ToString();
                    math = dataGridView1.Rows[index].Cells[2].Value.ToString();
                    txtdongia.Text = dataGridView1.Rows[index].Cells[3].Value.ToString();
                    link_image = dataGridView1.Rows[index].Cells[4].Value.ToString();
                    //txtsl.Text = dtgvkho.Rows[0].Cells[1].Value.ToString();
                }
                LoadThuongHieu();
                LoadKho();
                LoadAnh(link_image);
            }
            catch (Exception)
            {

                
            }
            
        }

        private void lưuToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog opnfd = new OpenFileDialog();
                opnfd.Filter = "Image Files (*.jpg;*.jpeg;.*.gif;)|*.jpg;*.jpeg;.*.gif";
                if (opnfd.ShowDialog() == DialogResult.OK)
                {
                    filename = opnfd.FileName;
                    pictureBox1.Image = new Bitmap(opnfd.FileName);
                    image = format(filename.ToString());
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
            
        }
        public string format(string filename)
        {
            string name = "";
            int index = filename.LastIndexOf(@"\");

            for (int i = index + 1; i < filename.Length; i++)
            {
                name += filename[i];
            }
            return format2(name);
        }
        public string format2(string filename)
        {
            string name = "";
            int index = filename.LastIndexOf(@".jpg");

            for (int i = 0; i < index; i++)
            {
                name += filename[i];
            }
            return name;
        }
        private void simpleButton1_Click(object sender, EventArgs e)
        {
            string makho = "";
            int b=0;
            if (DataProvider.cuaHang == "CH001")
                makho = "K0001";
            else
                makho = "K002";
            if (flag == "add")
            {
                if (GlobalData.lstsp.Count > 0)
                {
                    string query = string.Format("exec sp_InsertPhieuNhap '{0}','{1}','{2}','{3}',{4}", cbnhacc.SelectedValue, DataProvider.userName, makho, DateTime.Now, 0);
                    int a = DataProvider.ExecuteNonQuery(query);

                    if (a != 0)
                    {
                        foreach (var item in GlobalData.lstsp)
                        {
                            string queryy = string.Format("exec sp_InsertCTPN '{0}',{1},{2},'{3}'", item.masp, item.soluong, item.giaban,makho);
                            b = DataProvider.ExecuteNonQuery(queryy);
                        }
                        if (b != 0)
                            MessageBox.Show("Nhập hàng thành công");
                        else
                            MessageBox.Show("Xảy ra lỗi, vui lòng thử lại sau");
                    }
                }
                else
                    MessageBox.Show("Vui lòng chọn sản phẩm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);


            }
            else if (flag == "edit")
            {
                int index = dataGridView1.CurrentCell.RowIndex;
                string anh = "";
                if (image != "")
                    anh = image;
                else
                    anh = dataGridView1.Rows[index].Cells[4].Value.ToString();
                string query = string.Format("exec sp_UpdateSP '{0}','{1}','{2}',{3},'{4}'", txttensp.Text, cbth.SelectedValue, anh, txtdongia.Text, txtmasp.Text);
                try
                {
                    DataProvider.ExecuteNonQuery(query);
                    MessageBox.Show("Sửa thành công");
                }
                catch (Exception ex)
                {

                    MessageBox.Show(ex.Message.ToString());
                }
            }
            else
            {

            }
            thêmToolStripMenuItem.Enabled = true;
        }

        private void thêmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            simpleButton2.Enabled = true;
            flag = "add";
            txtdongia.Enabled = true;
            simpleButton1.Enabled = true;
            lưuToolStripMenuItem.Enabled = true;
            LoadNhaCungCap();
            cbnhacc.Enabled = true;
        }

        private void sửaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            flag = "edit";
            simpleButton1.Enabled = true;
            txtdongia.Enabled = true;
            lưuToolStripMenuItem.Enabled = true;
            thêmToolStripMenuItem.Enabled = false;
        }

        private void xoáToolStripMenuItem_Click(object sender, EventArgs e)
        {
            flag = "delete";
            simpleButton1.Enabled = true;
        }

        private void simpleButton2_Click(object sender, EventArgs e)
        {
            string masp = txtmasp.Text.Trim();
            string tensp = txttensp.Text.Trim();
            int soluong = Int32.Parse(numericUpDown1.Value.ToString());
            double gianhap = double.Parse(txtdongia.Text.Trim());
            if (MessageBox.Show("Bạn có muốn chọn " + tensp + "\nsố lượng:" + soluong + "\nVới giá nhập:" + gianhap, "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
            {
                GlobalData.lstsp.Add(new SanPham() { masp = masp, tensp = tensp, soluong = soluong, giaban = gianhap });
                chiTiếtToolStripMenuItem.Enabled = true;
            }
        }

        private void chiTiếtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fChiTietPhieuNhap f = new fChiTietPhieuNhap();
            f.Show();
        }

        private void nhậpSảnPhẩmMớiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fNhapSPMoi f = new fNhapSPMoi();
            f.Show();
        }
    }
}
