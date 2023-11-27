using BusinessLogicLayer;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataModel;


namespace BusinessLogicLayer
{
    public class HoaDonBusiness : IHoaDonBusiness
    {
        private IHoaDonRepository _res;

        public HoaDonBusiness(IHoaDonRepository res)
        {
            _res = res;
        }

        public List<HoaDonModel> GetAll()
        {
            return _res.GetAll();
        }
        public List<ChiTietHoaDonModelTWO> Getbyids(int id)
        {
            return _res.Getbyids(id);
        }
        public bool Create(HoaDonModel model)
        {
            return _res.Create(model);
        }

        public bool Update(HoaDonModel model)
        {
            return _res.Update(model);
        }

        public bool Delete(int MaHoaDon)
        {
            return _res.Delete(MaHoaDon);
        }

        public List<ThongkeHoaDonModel> Search(int pageIndex, int pageSize, out long total, string TenKH, DateTime? fr_NgayTao, DateTime? to_NgayTao, string SDT)
        {
            return _res.Search(pageIndex, pageSize, out total, TenKH, fr_NgayTao, to_NgayTao, SDT);
        }

        public List<HoaDonModel> SearchSingle(int pageIndex, int pageSize, out long total, string TenKH, DateTime? fr_NgayTao, DateTime? to_NgayTao, string SDT)
        {
            return _res.SearchSingle(pageIndex, pageSize, out total, TenKH, fr_NgayTao, to_NgayTao, SDT);
        }
    }
}
