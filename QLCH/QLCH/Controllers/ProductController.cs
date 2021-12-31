using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLCH.Models;

namespace QLCH.Controllers
{
    public class ProductController : Controller
    {
        //QLDienMayEntities4 db = new QLDienMayEntities4();
        QLDienMayEntities db = new QLDienMayEntities();
        // GET: Product
        public ActionResult XemChiTiet(string maSP="SP00000001")
        {
            var chitiet = db.SanPhams.SingleOrDefault(n => n.MaSanPham == maSP);           
            if (chitiet == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chitiet);
        }

    }
}