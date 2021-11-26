using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLy
{
    public class GlobalData
    {
        public static string makh { get; set; }
        public static List<SanPham> listMasp { get; set; }
        public static string tenkh { get; set; }
        public static string diachi { get; set; }
        public static string sdt { get; set; }
        
    }
    public class SanPham
    {
        public string masp { get; set; }
        public string tensp { get; set; }
        public double giaban { get; set; }
    }
}
