using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using DataModel;
using Business;
using Business.Interfaces;

namespace API_Customer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBusiness _sanphamBusiness;

        public SanPhamController(ISanPhamBusiness sanphamBusiness)
        {
            _sanphamBusiness = sanphamBusiness;
        }

        [Route("get_all")]
        [HttpGet]
        public List<SanPhamModel> GetAll()
        {
            return _sanphamBusiness.GetAll();

        }



        [Route("search")]
        [HttpPost]
        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string ten_sanpham = "";
                if (formData.Keys.Contains("ten_sanpham") && !string.IsNullOrEmpty(Convert.ToString(formData["ten_sanpham"]))) { ten_sanpham = Convert.ToString(formData["ten_sanpham"]); }
                string trang_thai = "";
                if (formData.Keys.Contains("trang_thai") && !string.IsNullOrEmpty(Convert.ToString(formData["trang_thai"]))) { trang_thai = Convert.ToString(formData["trang_thai"]); }
                long total = 0;
                var data = _sanphamBusiness.Search(page, pageSize, out total, ten_sanpham, trang_thai);
                return Ok(
                    new
                    {
                        TotalItems = total,
                        Data = data,
                        Page = page,
                        PageSize = pageSize
                    }
                    );
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
