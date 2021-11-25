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
    public partial class fDanhSachNhanVien : UserControl
    {
        string flag = "";
        public fDanhSachNhanVien()
        {
            InitializeComponent();
            LoadData();
            lưuToolStripMenuItem.Enabled = false;
            txtdiachi.Enabled = txtemail.Enabled = txtmakh.Enabled = txtsdt.Enabled = txttenkh.Enabled = false;

        }
        public void LoadData()
        {
            string query = "select MaNhanVien,TenNhanVien,NgaySinh,SDT,Email,DiaChi,CuaHang from NhanVien";
            DataTable dt = DataProvider.ExecuteQuery(query);
            dataGridView1.DataSource = dt;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.Columns[0].HeaderText = "Mã NV";
            dataGridView1.Columns[0].ReadOnly = true;
            dataGridView1.Columns[1].HeaderText = "Tên NV";
            dataGridView1.Columns[2].HeaderText = "SĐT";
            dataGridView1.Columns[3].HeaderText = "Địa chỉ";
            dataGridView1.Columns[4].HeaderText = "Email";
            dataGridView1.Columns[5].HeaderText = "Ngày sinh";
            dataGridView1.Columns[6].HeaderText = "Mã cửa hàng";

        }
        public bool CheckValidate(TextBox tb, string str)
        {
            if (tb.Text.Trim().Equals(""))
            {
                MessageBox.Show(str, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                tb.Focus();
                return false;
            }
            return true;


        }
        private void thêmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            flag = "add";

            txtdiachi.Enabled = txtemail.Enabled = txtmakh.Enabled = txtsdt.Enabled = txttenkh.Enabled = true;
            
            xoáToolStripMenuItem.Enabled = sửaToolStripMenuItem.Enabled = false;
            lưuToolStripMenuItem.Enabled = true;
            txtdiachi.Text = txtemail.Text = txtmakh.Text = txtsdt.Text = txttenkh.Text = "";

        }

        private void sửaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            flag = "edit";
            txtdiachi.Enabled = txtemail.Enabled = txtmakh.Enabled = txtsdt.Enabled = txttenkh.Enabled = true;
            lưuToolStripMenuItem.Enabled = true;
            thêmToolStripMenuItem.Enabled = xoáToolStripMenuItem.Enabled = false;
        }

        private void lưuToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                if (flag == "add")
                {
                    if (!CheckValidate(txtdiachi, "Địa chỉ không được để trống"))
                        return;
                    if (!CheckValidate(txtemail, "Email không được để trống"))
                        return;
                    if (!CheckValidate(txtsdt, "Số điện thoại không được để trống"))
                        return;
                    if (!CheckValidate(txttenkh, "Tên nhân viên không được để trống"))
                        return;
                    string mach = dataGridView1.Rows[0].Cells[6].Value.ToString();

                    string query = string.Format("exec sp_InsertNV '{0}','{1}','{2}','{3}','{4}','{5}'", txttenkh.Text, dateTimePicker1.Value.ToString(), txtsdt.Text, txtemail.Text, txtdiachi.Text, mach);
                    DataProvider.ExecuteNonQuery(query);
                }
                if (flag == "edit")
                {
                    if (!CheckValidate(txtdiachi, "Địa chỉ không được để trống"))
                        return;
                    if (!CheckValidate(txtemail, "Email không được để trống"))
                        return;
                    if (!CheckValidate(txtsdt, "Số điện thoại không được để trống"))
                        return;
                    if (!CheckValidate(txttenkh, "Tên nhân viên không được để trống"))
                        return;
                    string mach = dataGridView1.Rows[0].Cells[6].Value.ToString();
                    string query = string.Format("exec sp_UpdateNV '{0}','{1}','{2}','{3}','{4}','{5}','{6}'", txttenkh.Text, dateTimePicker1.Value.ToString(), txtsdt.Text, txtemail.Text, txtdiachi.Text, mach,txtmakh.Text);
                    DataProvider.ExecuteNonQuery(query);
                }
                MessageBox.Show("Cập nhật thông tin thành công");
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message.ToString());
            }
            
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            int index = dataGridView1.CurrentCell.RowIndex;
            DataTable dt = (DataTable)dataGridView1.DataSource;
            if (dt.Rows.Count > 0)
            {
                
                txtmakh.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
                txttenkh.Text = dataGridView1.Rows[index].Cells[1].Value.ToString();
                txtsdt.Text = dataGridView1.Rows[index].Cells[3].Value.ToString();
                txtdiachi.Text = dataGridView1.Rows[index].Cells[5].Value.ToString();
                txtemail.Text = dataGridView1.Rows[index].Cells[4].Value.ToString();
                dateTimePicker1.Text = dataGridView1.Rows[index].Cells[2].Value.ToString();

            }
        }
    }
}
