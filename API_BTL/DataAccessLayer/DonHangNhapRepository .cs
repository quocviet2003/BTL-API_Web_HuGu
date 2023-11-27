using DataAccessLayer.Interfaces;
using DataModel;
using System.Data.SqlClient;
using System.Data;

namespace DataAccessLayer
{
    public class DonHangNhapRepository: IDonHangNhapRepository
    {
        private IDatabaseHelper _dbHelper;
        public DonHangNhapRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        

        public List<DonHangNhapModel> GetAll()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "donhangnhap_get_all");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<DonHangNhapModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        public bool Create(DonHangNhapModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "create_donhangnhap",
                    "@MaSanPham", model.MaSanPham,
                    "@TenSanPham", model.TenSanPham,
                    "@SoLuong", model.SoLuong,
                    "@NgayNhap", model.NgayNhap);

                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        public bool Update(DonHangNhapModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_donhangnhap_update",
                    "@MaDonHangNhap", model.MaDonHangNhap,
                    "@MaSanPham", model.MaSanPham,
                    "@TenSanPham", model.TenSanPham,
                    "@SoLuong", model.SoLuong,
                    "@NgayNhap", model.NgayNhap);

                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }




        public bool Delete(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_donhangnhap_delete",
                "@MaDonHangNhap", id);

                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }









        public List<DonHangNhapModel> Search(int pageIndex, int pageSize, out long total, DateTime ngayThongKe)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_donhangnhap_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@ngay_thong_ke", ngayThongKe
                    );
                if (!string.IsNullOrEmpty(msgError)) throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<DonHangNhapModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        




       





    }
}
