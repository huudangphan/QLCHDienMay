using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLCH.Models;
namespace QLCH.Controllers
{
    public class KhachHangController : Controller
    {
        //QLDienMayEntities4 db = new QLDienMayEntities4();
        QLDienMayEntities db = new QLDienMayEntities();
        // GET: KhachHang
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangKy(ModelKhachHang kh)
        {
            try
            {  
                    KhachHang khach = new KhachHang();
                    khach.TenKhachHang = kh.tenKH;
                    khach.SDT = kh.sdt;
                    khach.DiaChi = kh.diaChi;
                    khach.Email = kh.email;

                    khach.TaiKhoan = kh.username;
                    khach.MatKhau = kh.password;

                    db.KhachHangs.Add(khach);
                    db.SaveChanges();

                    return RedirectToAction("DangNhap","KhachHang");
             
            }
            catch (Exception ex)
            {
                //ViewBag.loi = ex.ToString();
                string a = ex.Message.ToString();
                ViewBag.thongbao = "Tài khoản bị trùng";
                return View();
            }
        }

        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(KhachHang kh)
        {
            if (kh.TaiKhoan == null || kh.MatKhau == null)
            {
                ViewBag.error = "Tài khoản và mật khẩu không thể để trống";
                return View();
            }
            else
            {
                var data = db.KhachHangs.Where(c => c.TaiKhoan.Equals(kh.TaiKhoan) && c.MatKhau.Equals(kh.MatKhau)).ToList();
                var khachhang = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == kh.TaiKhoan && n.MatKhau == kh.MatKhau);

                if (data.Count() > 0)
                {
                    Session["TaiKhoan"] = khachhang;
                    Session["tk"] = data.FirstOrDefault().TaiKhoan;
                    Session["TenKhachHang"] = data.FirstOrDefault().TenKhachHang;

                    Session["MatKhau"] = data.FirstOrDefault().MatKhau;
                    Session["DiaChi"] = data.FirstOrDefault().DiaChi;

                    Session["Email"] = data.FirstOrDefault().Email;
                    Session["sdt"] = data.FirstOrDefault().SDT;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.error = "Tên đăng nhập hoặc mật khẩu sai";
                    return View();
                }
            }
        }
        public ActionResult DangXuat()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }
    }
}