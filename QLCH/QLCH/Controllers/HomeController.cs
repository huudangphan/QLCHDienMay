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
        QLDienMayEntities db = new QLDienMayEntities();
        public ActionResult test()
        {
            var result = db.test();
            return View(result);
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}