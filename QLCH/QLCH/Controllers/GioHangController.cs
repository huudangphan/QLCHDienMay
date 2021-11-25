using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLCH.Models;

namespace QLCH.Controllers
{
    public class GioHangController : Controller
    {
        QLDienMayEntities4 db = new QLDienMayEntities4();
        // GET: GioHang
        public List<GioHang> getGioHang()
        {
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang == null)
            {
                listGioHang = new List<GioHang>();
                Session["GioHang"] = listGioHang;
            }// nếu chưa có giỏ hàng
            return listGioHang;
        }
        //them gio hang
        public ActionResult ThemGioHang(string masp, string url)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(x => x.MaSanPham == masp);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> listGioHang = getGioHang();
            // Kiểm tra sản phẩm đã tồn tại trong giỏ hàng hay chưa
            GioHang sanpham = listGioHang.Find(x => x.maSP == masp);
            if (sanpham == null)
            {
                sanpham = new GioHang(masp);
                // add sản phẩm mới
                listGioHang.Add(sanpham);
                return Redirect(url);
            }
            else
            {
                sanpham.soLuong++;
                return Redirect(url);
            }
        }
        // cập nhật giỏ hàng
        public ActionResult CapNhatGioHang(string masp, FormCollection f)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(a => a.MaSanPham == masp);
            // kiểm tra sản phẩm có tồn tại trong giỏ hàng hay không
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }   
            List<GioHang> listGioHang = getGioHang();
            GioHang lsp = listGioHang.SingleOrDefault(x => x.maSP == masp);
            if (lsp != null)
            {
                lsp.soLuong = Int32.Parse(f["txtSoLuong"].ToString());
            }

            return RedirectToAction("GioHang");
        }
        // Xóa giỏ hàng
        public ActionResult XoaGioHang(string masp)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(x => x.MaSanPham == masp);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            List<GioHang> listGioHang = getGioHang();
            GioHang lsp = listGioHang.SingleOrDefault(x => x.maSP == masp);
            if (lsp != null)
            {
                listGioHang.RemoveAll(x => x.maSP == masp);

            }
            if (listGioHang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaTatCaGioHang()
        {
            List<GioHang> lstGioHang = getGioHang();
            lstGioHang.Clear();
            return RedirectToAction("Index", "Home");
        }
        //Tong so luong
        private int TongSoLuong()
        {
            int tongSL = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                tongSL = listGioHang.Sum(x => x.soLuong);
            }
            return tongSL;
        }
        //tong tien
        private double TongTien()
        {
            double tongTien = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                tongTien = listGioHang.Sum(x => x.thanhTien);
            }
            ViewBag.tongtien = tongTien;
            return tongTien;
        }
        //VIEW giỏ hàng
        public ActionResult GioHang()
        {
            if (Session["GioHang"] == null) 
                return RedirectToAction("Index", "Home");
            List<GioHang> listGioHang = getGioHang();

            ViewBag.TongSoluong = TongSoLuong();
            ViewBag.TongTien = TongTien();

            return View(listGioHang);
        }
        //View partial gio hang
        public PartialViewResult PartialGioHang()
        {
            //ViewBag.TongSoluong = TongSoLuong();
            //ViewBag.TongTien = TongTien();
            //return PartialView();
            if (TongSoLuong() == 0)
            {
                return PartialView();
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }
    }
}