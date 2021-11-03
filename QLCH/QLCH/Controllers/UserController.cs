using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLCH.Models;

namespace QLCH.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        QLDienMayEntities1 db = new QLDienMayEntities1();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult LoginEmployee()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginEmployee(NhanVien nv)
        {
            try
            {
             

                db.sp_DangNhap(nv.TaiKhoan, GlobalData.EnryptString(nv.MatKhau), GlobalData.type);
                return View();
            }
            catch (Exception ex)
            {
                string ero = ex.ToString();
                ViewBag.Error = ex.InnerException.Message.ToString();
                return View();
            }
           
        }
    }
}