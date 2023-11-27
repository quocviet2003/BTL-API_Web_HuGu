using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public partial interface IDonHangNhapBusiness
    {
        List<DonHangNhapModel> GetAll();

        bool Create(DonHangNhapModel model);

        bool Update(DonHangNhapModel model);

        bool Delete(int id);
        List<DonHangNhapModel> Search(int pageIndex, int pageSize, out long total, DateTime ngayThongKe);
        
    }
}
