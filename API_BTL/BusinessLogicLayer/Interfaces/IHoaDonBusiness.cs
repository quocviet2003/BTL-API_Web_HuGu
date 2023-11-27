﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModel;
using DataAccessLayer;
namespace BusinessLogicLayer
{
    public partial interface IHoaDonBusiness
    {
        List<HoaDonModel> GetAll();
        List<ChiTietHoaDonModelTWO> Getbyids(int MaHoaDon);
        bool Create(HoaDonModel model);
        bool Update(HoaDonModel model);
        bool Delete(int MaHoaDon);
        List<ThongkeHoaDonModel> Search(int pageIndex, int pageSize, out long total, string TenKH, DateTime? fr_NgayTao, DateTime? to_NgayTao, string SDT);
        List<HoaDonModel> SearchSingle(int pageIndex, int pageSize, out long total, string TenKH, DateTime? fr_NgayTao, DateTime? to_NgayTao, string SDT);
    }
   
}
