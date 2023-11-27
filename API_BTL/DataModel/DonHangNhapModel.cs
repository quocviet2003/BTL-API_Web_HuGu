using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModel
{
    public class DonHangNhapModel
    {
        public int MaDonHangNhap { get; set; }
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public int SoLuong { get; set; }
        public DateTime NgayNhap { get; set; }
    }
}
