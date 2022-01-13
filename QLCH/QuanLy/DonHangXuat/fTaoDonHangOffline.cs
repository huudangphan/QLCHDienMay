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
            dataGridView1.Columns[3].HeaderText = "Số lượng";
        }
        

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            try
            {
                int temp = 0;
                DateTime now = DateTime.Now;
                string query = string.Format("exec sp_TaoDonHangOffline '{0}','{1}','{2}','{3}',{4}", DataProvider.userName, txtmakh.Text, DataProvider.cuaHang, now, "HAPPY2021");
                DataProvider.ExecuteNonQuery(query);
                foreach (var item in GlobalData.lstsp)
                {
                    string query2 = string.Format("exec sp_InsertCTDH '{0}',{1},{2}", item.masp, item.soluong, item.giaban);
                    int a= DataProvider.ExecuteNonQuery(query2);
                    if (a == 0)
                    {
                        temp = 1;
                        MessageBox.Show(string.Format("Số lượng {0} trong kho không đủ!", item.tensp));
                    }
                     

                   
                }
                if (temp != 1)
                    MessageBox.Show("Thêm hoá đơn thành công. Vui lòng liên hệ nhân viên thủ kho để lấy hàng");
                GlobalData.lstsp.Clear();

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message.ToString(), "Thông báo");
            }
            

        }
    }
}
