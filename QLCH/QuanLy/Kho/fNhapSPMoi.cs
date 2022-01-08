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
    public partial class fNhapSPMoi : UserControl
    {
        string filename = "";
        string image = "";
        public fNhapSPMoi()
        {
            InitializeComponent();
            LoadThuongHieu();
            LoadLoai();
        }
        public void LoadThuongHieu()
        {
            string query = "select MaThuongHieu,TenThuongHieu from ThuongHieu" ;
            DataTable dt = DataProvider.ExecuteQuery(query);
            BindingSource bds = new BindingSource();
            bds.DataSource = dt;
            cbth.DataSource = bds;
            cbth.DisplayMember = "TenThuongHieu";
            cbth.ValueMember = "MaThuongHieu";
        }
        public void LoadLoai()
        {
            string query = "select MaLoai,TenLoai from Loai";
            DataTable dt = DataProvider.ExecuteQuery(query);
            BindingSource bds = new BindingSource();
            bds.DataSource = dt;
            cbLoai.DataSource = bds;
            cbLoai.DisplayMember = "TenLoai";
            cbLoai.ValueMember = "MaLoai";
        }
        private void simpleButton2_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog opnfd = new OpenFileDialog();
                opnfd.Filter = "Image Files (*.jpg;*.jpeg;.*.gif;)|*.jpg;*.jpeg;.*.gif";
                if (opnfd.ShowDialog() == DialogResult.OK)
                {
                    filename = opnfd.FileName;
                    pictureBox1.Image = new Bitmap(opnfd.FileName);
                    pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
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
            try
            {
                if (string.IsNullOrEmpty(image))
                    MessageBox.Show("Vui lòng chọn ảnh minh hoạ", "Thông báo", MessageBoxButtons.OKCancel);
                else
                {
                    string query = string.Format("exec sp_InsertSP '{0}','{1}','{2}',{3},'{4}'", txtttensp.Text, cbth.SelectedValue, image, txtgiaban.Text,cbLoai.SelectedValue);
                    int a = DataProvider.ExecuteNonQuery(query);
                    if (a != 0)
                        MessageBox.Show("Thêm sản phẩm thành công", "Thông báo", MessageBoxButtons.OKCancel);
                    else
                        MessageBox.Show("Xảy ra lỗi, vui lòng thử lại sau", "Thông báo", MessageBoxButtons.OKCancel);
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message.ToString(), "Thông báo", MessageBoxButtons.OKCancel);
            }
           
        }
    }
}
