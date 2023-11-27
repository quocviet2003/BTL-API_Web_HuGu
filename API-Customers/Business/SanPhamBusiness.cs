using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModel;
using DataAccess;
using Business.Interfaces;
using DataAccess.Interfaces;

namespace Business
{
    public  class SanPhamBusiness : ISanPhamBusiness
    {
        private ISanPhamRepository _res;
        public SanPhamBusiness(ISanPhamRepository res)
        {
            _res = res;
        }

        public List<SanPhamModel> GetAll()
        {
            return _res.GetAll();
        }

        public List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string ten_sanpham, string trang_thai)
        {
            return _res.Search(pageIndex, pageSize, out total, ten_sanpham, trang_thai);
        }
    }
}
