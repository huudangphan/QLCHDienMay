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
    public partial class fThemNV : Form
    {
        public fThemNV()
        {
            InitializeComponent();
            LoadChucVu();
        }
        public void LoadChucVu()
        {
            string query = string.Format("select TenChucVu,MaChucVu from ChucVu ");
            DataTable dt = DataProvider.ExecuteQuery(query);
            BindingSource bds = new BindingSource();
            bds.DataSource = dt;
            cbchucvu.DataSource = bds;
            cbchucvu.DisplayMember = "TenChucVu";
            cbchucvu.ValueMember = "MaChucVu";


        }
        private void simpleButton1_Click(object sender, EventArgs e)
        {
            if (txtdiachi.Text == "" || txtemail.Text == "" || txtsdt.Text == "" || txtten.Text == "")

            {
                MessageBox.Show("Thông tin không được để trống", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                try
                {
                    string diachi = txtdiachi.Text;
                    string email = txtemail.Text;
                    string sdt = txtsdt.Text;
                    string ten = txtten.Text;
                    string ngaysinh = dateTimePicker1.Value.ToString();
                    string chucvu = cbchucvu.SelectedValue.ToString();
                    string query = string.Format("exec sp_InsertNV '{0}','{1}','{2}','{3}','{4}','{5}','{6}'", ten, ngaysinh, sdt, email, diachi, DataProvider.cuaHang,chucvu);

                    DataProvider.ExecuteNonQuery(query);
                    MessageBox.Show("Thêm nhân viên mới thành công");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                }
            }
        }
    }
}
