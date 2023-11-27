using DataAccess.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModel;
using DataAccessLayer;

namespace DataAccess
{
    public class SanPhamRepository : ISanPhamRepository
    {
        private IDatabaseHelper _dbHelper;

        public SanPhamRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }


        public List<SanPhamModel> GetAll()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "SP_get_all");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPhamModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string ten_sanpham, string trang_thai)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@ten_sanpham", ten_sanpham,
                    "@trang_thai", trang_thai);
                if (!string.IsNullOrEmpty(msgError)) throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<SanPhamModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

}
