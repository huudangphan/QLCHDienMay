using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QLCH.Models;
namespace QLCH.Models
{
    public class GioHang
    {
        QLDienMayEntities4 db = new QLDienMayEntities4();       
        public string maSP { get; set; }
        public string tenSP { get; set; }
        public string hinhAnh { get; set; }
        public int donGia { get; set; }
        public int soLuong { get; set; }
        public double thanhTien { get { return soLuong * donGia; } }

        public GioHang(string imaSP)
        {
            maSP = imaSP;
            SanPham sp = db.SanPhams.SingleOrDefault(x => x.MaSanPham == maSP);
            tenSP = sp.TenSanPham;
            hinhAnh = sp.AnhMinhHoa;
            donGia = (int)sp.DonGia;
            soLuong = 1;
        }
    }
}