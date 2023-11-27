﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModel
{
    public class ChiTietHoaDonModel
    {
        public int MaChiTietHoaDon { get; set; }
        public int MaHoaDon { get; set; }
        public int MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public Decimal TongGia { get; set; }
        public int status { get; set; }
    }

    public class ChiTietHoaDonModelTWO
    {
        public int MaChiTietHoaDon { get; set; }
        public int MaHoaDon { get; set; }
        public string TenSanPham { get; set; }
        public int MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public Decimal TongGia { get; set; }
        public int status { get; set; }
    }
}
