using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLCH.Models;
namespace QLCH.Controllers
{
    public class HomeController : Controller
    {
        //QLDienMayEntities4 db = new QLDienMayEntities4();
        QLDienMayEntities db = new QLDienMayEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Shop()
        {
            return View();
        }
        public ActionResult SingleProduct()
        {
            return View();
        }
        public ActionResult Cart()
        {
            return View();
        }
        public ActionResult Toshiba()
        {
            //Apple
            var list = from c in db.SanPhams
                       where c.MaThuongHieu == "TH004"
                       select c;
            return View(list);
            //db.SanPhams.Where(c => c.MaThuongHieu == "TH001").Take(4).ToList();
        }
        public ActionResult Sharp()
        {
            //toshiba
            var list = from c in db.SanPhams
                       where c.MaThuongHieu == "TH001"
                       select c;
            return View(list);
            //db.SanPhams.Where(c => c.MaThuongHieu == "TH001").Take(4).ToList();
        }
        public ActionResult SamSung()
        {
            var list = from c in db.SanPhams
                       where c.MaThuongHieu == "TH007"
                       select c;
            return View(list);
            //db.SanPhams.Where(c => c.MaThuongHieu == "TH001").Take(4).ToList();
        }
        public ActionResult Iphone()
        {
            //panasonic
            var list = from c in db.SanPhams
                       where c.MaThuongHieu == "TH003"
                       select c;
            return View(list);
            //db.SanPhams.Where(c => c.MaThuongHieu == "TH001").Take(4).ToList();
        }
        public PartialViewResult DienThoaiHot()
        {
            var list = db.SanPhams.Where(c => c.MaThuongHieu == "TH007"||c.MaThuongHieu=="TH004").Take(6);

            return PartialView("DienThoaiHot", list);
        }
        public PartialViewResult TiViHot()
        {
            var list = db.SanPhams.Where(c => c.MaThuongHieu == "TH004").Take(3);

            return PartialView("TiViHot", list);
        }
    }
}