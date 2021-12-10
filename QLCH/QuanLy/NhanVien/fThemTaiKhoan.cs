using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy.NhanVien
{
    public partial class fThemTaiKhoan : UserControl
    {
        public fThemTaiKhoan()
        {
            InitializeComponent();
           
            loadNhanVien();
        }
        public void LoadChucVu()
        {
            string query = string.Format("select TenChucVu from ChucVu ");
            DataTable dt = DataProvider.ExecuteQuery(query);
            BindingSource bds = new BindingSource();
            bds.DataSource = dt;
            cbchucvu.DataSource = bds;
            cbchucvu.DisplayMember = "TenChucVu";
            //cbchucvu.ValueMember = "MaChucVu";


        }
        public void loadNhanVien()
        {
            string query = string.Format("select MaNhanVien,TenNhanVien from NhanVien ");
            DataTable dt = DataProvider.ExecuteQuery(query);
            BindingSource bds = new BindingSource();
            bds.DataSource = dt;
            cbUserName.DataSource = bds;
            cbUserName.DisplayMember = "TenNhanVien";
            cbUserName.ValueMember = "MaNhanVien";
           
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
           
            try
            {
                string query = string.Format("exec sp_Login '{0}','{1}','{2}','{3}'", txtLoginName.Text, txtMatKhau.Text, cbUserName.SelectedValue, cbchucvu.Text);
                DataProvider.ExecuteNonQuery(query);
                MessageBox.Show("Thêm tài khoản thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.None);
            }
            catch (Exception ex)
            {

                string exx = ex.Message.ToString();
                MessageBox.Show(exx);
            }

        }
    }
}
