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
            //txtdiachi.Enabled = txtmakh.Enabled = txtsdt.Enabled = txttenkh.Enabled = false;
            dataGridView1.DataSource = GlobalData.lstsp;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.Columns[0].HeaderText = "Mã Sản phẩm";
            dataGridView1.Columns[1].HeaderText = "Tên sản phẩm";
            dataGridView1.Columns[2].HeaderText = "Giá bán";
            dataGridView1.Columns[2].HeaderText = "Số lượng";
        }
        

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime now = DateTime.Now;
                string query = string.Format("exec sp_TaoDonHangOffline '{0}','{1}','{2}','{3}',{4}", DataProvider.userName, txtmakh.Text, DataProvider.cuaHang, now, "HAPPY2021");
                DataProvider.ExecuteNonQuery(query);
                foreach (var item in GlobalData.lstsp)
                {
                    string query2 = string.Format("exec sp_InsertCTDH '{0}',{1},{2}", item.masp, item.soluong, item.giaban);
                    DataProvider.ExecuteNonQuery(query2);
                }

                MessageBox.Show("Thêm hoá đơn thành công");
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message.ToString(), "Thông báo");
            }
            

        }
    }
}
