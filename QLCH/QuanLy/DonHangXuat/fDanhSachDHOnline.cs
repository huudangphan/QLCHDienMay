using DevExpress.XtraEditors;
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
    public partial class fDanhSachDHOnline : DevExpress.XtraEditors.XtraUserControl
    {
        public fDanhSachDHOnline()
        {
            InitializeComponent();
            LoadData();
        }
        public void LoadData()
        {
            DataTable dt = DataProvider.ExecuteQuery("select MaDonHang,MaKhachHang,ThoiGianTao,TinhTrangXacNhan,TinhTrangGiaoHang from DonHang where Loai='False'");
            dtg_dshd.DataSource = dt;           
           
            dtg_dshd.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            
           
        }
        public void LoadHoaDon()
        {
            dtg_dshd.Columns[0].HeaderText = "Mã đơn hàng";
            dtg_dshd.Columns[1].HeaderText = "Mã khách hàng";
            dtg_dshd.Columns[2].HeaderText = "Ngày";
            dtg_dshd.Columns[3].HeaderText = "Đã xác nhận";
            dtg_dshd.Columns[4].HeaderText = "Đã giao";

        }
        public void LoadCTHD(string hd)
        {
            DataTable dt2 = DataProvider.ExecuteQuery("select sp.TenSanPham,dh.SoLuong,dh.DonGia From SanPham sp join(select ct.MaSanPham,ct.SoLuong,ct.DonGia,ct.MaDonHang from ChiTietDonHang ct where ct.MaDonHang='"+hd+"') dh on sp.MaSanPham = dh.MaSanPham");
            dtgv_cthd.DataSource = dt2;
            dtgv_cthd.Columns[0].HeaderText = "Tên sản phẩm";
            dtgv_cthd.Columns[1].HeaderText = "Số lượng";
            dtgv_cthd.Columns[2].HeaderText = "Đơn giá";
            dtgv_cthd.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

        }
        public void LoadKH(string makh)
        {
            DataTable dt3 = DataProvider.ExecuteQuery("select kh.TenKhachHang,kh.SDT,kh.DiaChi from KhachHang kh join (select dh.MaKhachHang From DonHang dh where MaKhachHang='"+makh+"') dhh on kh.MaKhachHang=dhh.MaKhachHang");
            dataGridView1.DataSource = dt3;
            dataGridView1.Columns[0].HeaderText = "Tên khách hàng";
            dataGridView1.Columns[1].HeaderText = "Sđt";
            dataGridView1.Columns[2].HeaderText = "Địa chỉ";
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void dtg_dshd_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                int index = dtg_dshd.CurrentCell.RowIndex;
                DataTable dt = (DataTable)dtg_dshd.DataSource;
                if (dt.Rows.Count > 0)
                {
                    txtmahd.Text = dtg_dshd.Rows[index].Cells[0].Value.ToString();
                    string makh = dtg_dshd.Rows[index].Cells[1].Value.ToString();
                    string mahd= dtg_dshd.Rows[index].Cells[0].Value.ToString();
                    dateTimePicker1.Text = dtg_dshd.Rows[index].Cells[2].Value.ToString();                    
                    LoadCTHD(mahd);
                    LoadKH(makh);
                    checkBox1.Checked = Convert.ToBoolean(dtg_dshd.Rows[index].Cells[3].ToString());
                    checkBox2.Checked = Convert.ToBoolean(dtg_dshd.Rows[index].Cells[4].ToString());                    
                    
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
            int index = dtg_dshd.CurrentCell.RowIndex;
            string madh = dtg_dshd.Rows[index].Cells[0].Value.ToString().Trim();
            var status = dtg_dshd.Rows[index].Cells[3].Value.ToString().Trim();
            if (status == "True")
                MessageBox.Show("Đơn hàng đã được xác nhận rồi");
            else
            {
                string query = string.Format("exec Xac_Nhan_Don_Hang '{0}'", madh);
                try
                {
                    int a = DataProvider.ExecuteNonQuery(query);
                    if (a != 0)
                        MessageBox.Show("Xác nhận đơn hàng thành công!");
                    else
                        MessageBox.Show("Xác nhận đơn hàng thất bại, vui lòng thử lại sau");
                    string querypx = string.Format("exec sp_InsertPX '{0}','{1}','{2}','{3}','{4}'", DataProvider.userName, DataProvider.userName, makho, madh, DateTime.Now.ToString());
                    DataProvider.ExecuteNonQuery(querypx);
                    for (int i = 0; i < dtgv_cthd.Rows.Count - 1; i++)
                    {
                        string masp = dtgv_cthd.Rows[i].Cells[0].Value.ToString();
                        string sl = dtgv_cthd.Rows[i].Cells[2].Value.ToString();
                        string queryct = string.Format("exec sp_InsertCTPX '{0}',{1}", masp, sl);
                        DataProvider.ExecuteNonQuery(queryct);
                    }


                }
                catch (Exception ex)
                {

                    MessageBox.Show(ex.Message.ToString());
                }
                LoadData();

            }
        }

        private void simpleButton2_Click(object sender, EventArgs e)
        {

        }
    }
}
