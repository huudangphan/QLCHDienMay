using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy
{
    public partial class fLogin : Form
    {
        SqlConnection conn_publisher = new SqlConnection();
        public fLogin()
        {
            InitializeComponent();
            if (KetNoiVoiMayChu() == 0)
                return;
            LayThongTin("select * from v_getSubcribes");
            cbChiNhanh.SelectedIndex = 1;
            var a= cbChiNhanh.SelectedValue.ToString();
            DataProvider.serverName = cbChiNhanh.SelectedValue.ToString();
        }
        private void LayThongTin(String cmd)
        {
            DataTable dt = new DataTable();
            if (conn_publisher.State == ConnectionState.Closed)
                conn_publisher.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd, conn_publisher);
            adapter.Fill(dt);
            conn_publisher.Close();
            DataProvider.danhSachChiNhanh.DataSource = dt;
            cbChiNhanh.DataSource = DataProvider.danhSachChiNhanh;
            cbChiNhanh.DisplayMember = "TenCN";
            cbChiNhanh.ValueMember = "TENSERVER";
        }
        private int KetNoiVoiMayChu()
        {
            if (conn_publisher != null && conn_publisher.State == ConnectionState.Open)
                conn_publisher.Close();
            try
            {
                conn_publisher.ConnectionString = DataProvider.con_pulisher;
                conn_publisher.Open();
                return 1;
            }
            catch (Exception ex)
            {
                string a = ex.ToString();
                MessageBox.Show(ex.Message.ToString());
                return 0;

            }
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
           
            DataProvider.mLogin = txtUserName.Text.Trim();
            DataProvider.password = txtPassword.Text.Trim();
            if (DataProvider.KetNoi() == 0)
                MessageBox.Show("Error");
            DataProvider.maCN = cbChiNhanh.SelectedIndex;
            DataProvider.mLoginDN = DataProvider.mLogin;
            DataProvider.passWordDN = DataProvider.password;
            string query = "exec sp_Lay_thong_tin_tu_login '" + DataProvider.mLogin + "'";
            DataProvider.myReader = DataProvider.ExecDataReader(query);
            if (DataProvider.myReader == null)
                MessageBox.Show("Tài khoản không hợp lệ!");
            DataProvider.myReader.Read();
            DataProvider.userName = DataProvider.myReader.GetString(0);
            if(Convert.IsDBNull(DataProvider.userName))
            {
                MessageBox.Show("Tài khoản không hợp lệ");
                
            }
            try
            {
                DataProvider.mHoTen = DataProvider.myReader.GetString(1);
                DataProvider.mGroup = DataProvider.myReader.GetString(2);
                MessageBox.Show(DataProvider.userName);
                DataProvider.myReader.Close();
                conn_publisher.Close();
                fMain f = new fMain();
                f.Show();
            }
            catch (Exception ex)
            {

                MessageBox.Show("Tài khoản hoặc mật khẩu sai!");
            }
           
        }

        private void cbChiNhanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            var a = cbChiNhanh.SelectedValue.ToString();
            DataProvider.serverName = cbChiNhanh.SelectedValue.ToString();
        }
    }
}
