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
    public partial class fPhieuXuat : UserControl
    {
        public fPhieuXuat()
        {
            InitializeComponent();
            LoadData();
        }
        public void LoadData()
        {
            DataTable dt = DataProvider.ExecuteQuery("select MaDonHang,MaKhachHang,ThoiGianTao,TinhTrangXacNhan from DonHang ");
            dataGridView1.DataSource = dt;
            LoadHoaDon();
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

        }
        public void LoadHoaDon()
        {
            dataGridView1.Columns[0].HeaderText = "Mã đơn hàng";
            dataGridView1.Columns[1].HeaderText = "Mã khách hàng";
            dataGridView1.Columns[2].HeaderText = "Ngày";
            dataGridView1.Columns[3].HeaderText = "Đã xác nhận";
            //dataGridView1.Columns[4].HeaderText = "Đã giao";

        }
        public void LoadCTHD(string hd)
        {
            DataTable dt2 = DataProvider.ExecuteQuery(string.Format("select sp.MaSanPham , sp.TenSanPham, dh.SoLuong, dh.DonGia " +
                "From SanPham sp join(select ct.MaSanPham, ct.SoLuong, ct.DonGia, ct.MaDonHang from ChiTietDonHang ct where ct.MaDonHang = '{0}') dh  " +
                "on sp.MaSanPham = dh.MaSanPham",hd));



            dataGridView2.DataSource = dt2;
            dataGridView2.Columns[0].HeaderText = "Mã sản phẩm";
            dataGridView2.Columns[1].HeaderText = "Tên sản phẩm";
            dataGridView2.Columns[2].HeaderText = "Số lượng";
            dataGridView2.Columns[3].HeaderText = "Đơn giá";
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                int index = dataGridView1.CurrentCell.RowIndex;
                DataTable dt = (DataTable)dataGridView1.DataSource;
                if (dt.Rows.Count > 0)
                {
                    txtmahd.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
                    string makh = dataGridView1.Rows[index].Cells[1].Value.ToString();
                    string mahd = dataGridView1.Rows[index].Cells[0].Value.ToString();
                    dateTimePicker1.Text = dataGridView1.Rows[index].Cells[2].Value.ToString();
                    LoadCTHD(mahd);

                    //checkBox1.Checked = Convert.ToBoolean(dataGridView1.Rows[index].Cells[3].ToString());
                    //checkBox2.Checked = Convert.ToBoolean(dataGridView1.Rows[index].Cells[4].ToString());


                }
            }
            catch (Exception ex)
            {
                string error = ex.Message.ToString();

            }
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            string makho = "";
            int b = 0;
            if (DataProvider.cuaHang == "CH001")
                makho = "K0001";
            else
                makho = "K002";
            int index = dataGridView1.CurrentCell.RowIndex;
            string madh = dataGridView1.Rows[index].Cells[0].Value.ToString().Trim();
            var status= dataGridView1.Rows[index].Cells[3].Value.ToString().Trim();
            string makh= dataGridView1.Rows[index].Cells[1].Value.ToString().Trim();
            if (status == "True")
                MessageBox.Show("Đơn hàng đã được xác nhận rồi");
            else
            {
                string query = string.Format("exec Xac_Nhan_Don_Hang '{0}'", madh);
                try
                {
                    int a= DataProvider.ExecuteNonQuery(query);
                    if (a != 0)
                        MessageBox.Show("Xác nhận đơn hàng thành công!");
                    else
                        MessageBox.Show("Xác nhận đơn hàng thất bại, vui lòng thử lại sau");
                    string querypx = string.Format("exec sp_InsertPX '{0}','{1}','{2}','{3}','{4}'", DataProvider.userName, DataProvider.userName, makho, madh, DateTime.Now.ToString());
                    DataProvider.ExecuteNonQuery(querypx);
                    for(int i = 0; i < dataGridView2.Rows.Count-1; i++)
                    {
                        string masp = dataGridView2.Rows[i].Cells[0].Value.ToString();
                        string sl = dataGridView2.Rows[i].Cells[2].Value.ToString();
                        string queryct = string.Format("exec sp_InsertCTPX '{0}',{1}", masp, sl);
                        DataProvider.ExecuteNonQuery(queryct);
                        string querybh = string.Format("exec sp_InsertPhieuBaoHanh '{0}','{1}','{2}','2020-1-1','false'", masp, makh, madh);
                        DataProvider.ExecuteNonQuery(querybh);
                    }


                }
                catch (Exception ex)
                {

                    MessageBox.Show(ex.Message.ToString());
                }
                LoadData();

            }

        }
    }
}
