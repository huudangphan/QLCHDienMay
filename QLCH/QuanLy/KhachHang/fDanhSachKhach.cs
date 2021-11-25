using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy.KhachHang
{
    public partial class fDanhSachKhach : UserControl
    {
        int cur_row;
        public fDanhSachKhach()
        {
            InitializeComponent();
            
            LoadData();
            txtdiachi.Enabled = txtemail.Enabled = txtmakh.Enabled = txtsdt.Enabled = txttenkh.Enabled = true;
            cur_row = dataGridView1.Rows.Count;

        }
        private void LoadData()
        {
            string query = "select MaKhachHang,TenKhachHang,SDT,DiaChi,Email from KhachHang";
            DataTable dt = DataProvider.ExecuteQuery(query);
            dataGridView1.DataSource = dt;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.Columns[0].HeaderText = "Mã KH";
            dataGridView1.Columns[0].ReadOnly = true;
            dataGridView1.Columns[1].HeaderText = "Tên KH";
            dataGridView1.Columns[2].HeaderText = "SĐT";
            dataGridView1.Columns[3].HeaderText = "Địa chỉ";
            dataGridView1.Columns[4].HeaderText = "Email";
        }
        private void fDanhSachKhach_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            DataTable dt = (DataTable)dataGridView1.DataSource;
            if (dt.Rows.Count > 0)
            {
                txtmakh.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
                txttenkh.Text = dataGridView1.Rows[index].Cells[1].Value.ToString();
                txtsdt.Text = dataGridView1.Rows[index].Cells[2].Value.ToString();
                txtdiachi.Text = dataGridView1.Rows[index].Cells[3].Value.ToString();
                txtemail.Text = dataGridView1.Rows[index].Cells[4].Value.ToString();

            }
        }

        private void simpleButton2_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "";
                DataTable dt = (DataTable)dataGridView1.DataSource;
                string tenkh, sdt, diachi, email,makh;
                int row = dt.Rows.Count;
                for (int i = 0; i < cur_row-1; i++)
                {
                    makh = dt.Rows[i][0].ToString();
                    tenkh = dt.Rows[i][1].ToString();
                    sdt = dt.Rows[i][2].ToString();
                    diachi = dt.Rows[i][3].ToString();
                    email = dt.Rows[i][4].ToString();
                    DataProvider.ExecuteNonQuery(string.Format(" exec sp_UpdateKH '{0}','{1}','{2}','{3}','{4}'", makh, tenkh, sdt, diachi, email));
                }
                for (int i = cur_row-1; i < row; i++)
                {
                    tenkh = dt.Rows[i][1].ToString();
                    sdt = dt.Rows[i][2].ToString();
                    diachi = dt.Rows[i][3].ToString();
                    email = dt.Rows[i][4].ToString();
                    DataProvider.ExecuteNonQuery(string.Format(" exec sp_InsertKH '{0}','{1}','{2}','{3}'", tenkh, sdt, diachi, email));
                }
                MessageBox.Show("Cập nhật thông tin thành công!");
                LoadData();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message.ToString());
            }
            
        }
    }
}
