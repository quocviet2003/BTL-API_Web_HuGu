using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModel;

namespace Business.Interfaces
{
    public partial interface ISanPhamBusiness
    {
        List<SanPhamModel> GetAll();

        List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string ten_sanpham, string trang_thai);
    }
}
