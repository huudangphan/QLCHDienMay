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
            DataTable dt2 = DataProvider.ExecuteQuery("select sp.TenSanPham,dh.SoLuong,dh.DonGia From SanPham sp join(select ct.MaSanPham,ct.SoLuong,ct.DonGia,ct.MaDonHang from ChiTietDonHang ct where ct.MaDonHang="+hd+") dh on sp.MaSanPham = dh.MaSanPham");
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
    }
}
