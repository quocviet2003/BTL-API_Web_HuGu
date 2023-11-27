using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataModel;


namespace BusinessLogicLayer
{
    public class DonHangNhapBusiness : IDonHangNhapBusiness
    {
        private IDonHangNhapRepository _res;

        public DonHangNhapBusiness(IDonHangNhapRepository res)
        {
            _res = res;
        }
        public List<DonHangNhapModel> GetAll()
        {
            return _res.GetAll();
        }

        public bool Create(DonHangNhapModel model)
        {
            return _res.Create(model);
        }

        public bool Update(DonHangNhapModel model)
        {
            return _res.Update(model);
        }

        public bool Delete(int id)
        {
            return _res.Delete(id);
        }


        public List<DonHangNhapModel> Search(int pageIndex, int pageSize, out long total,  DateTime ngayThongKe)
        {
            return _res.Search(pageIndex, pageSize, out total, ngayThongKe);
        }

        
    }
}
