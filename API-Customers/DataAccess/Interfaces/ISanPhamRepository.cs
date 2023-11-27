using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModel;

namespace DataAccess.Interfaces
{
    public partial interface ISanPhamRepository
    {
        List<SanPhamModel> GetAll();

        List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string ten_sanpham, string trang_thai);
    }
}
