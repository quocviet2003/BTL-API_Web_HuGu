using Microsoft.AspNetCore.Mvc;
using DataModel;
using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;

namespace API_BTL.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HoaDonController : ControllerBase
    {
        private IHoaDonBusiness _hoadonBusiness;

       
        public HoaDonController(IHoaDonBusiness hoadonBusiness)
        {
            _hoadonBusiness = hoadonBusiness;
        }

        [Route("get_all")]
        [HttpGet]
        public List<HoaDonModel> GetAll()
        {
            return _hoadonBusiness.GetAll();
        }
        



        [Route("getbyid-mahoadon-chitiethoadon/{id}")]
        [HttpGet]
        public List<ChiTietHoaDonModelTWO> GetByID(int id)
        {
            return _hoadonBusiness.Getbyids(id);
        }

        [Route("create-hoadon")]
        [HttpPost]
        public HoaDonModel CreateHoaDon([FromBody] HoaDonModel model)
        {
            _hoadonBusiness.Create(model);
            return model;
        }


        [Route("update-hoadon")]
        [HttpPut]
        public HoaDonModel UpdateHoaDon([FromBody] HoaDonModel model)
        {
            _hoadonBusiness.Update(model);
            return model;
        }

        [Route("delete-hoadon")]
        [HttpDelete]
        public bool Delete([FromBody] List<int> formdata)
        {
            foreach (int id in formdata)
            {
                _hoadonBusiness.Delete(id);
            }
            return true;
        }

        [Route("search-hoadon")]
        [HttpPost]
        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string TenKH = "";
                if (formData.Keys.Contains("TenKH") && !string.IsNullOrEmpty(Convert.ToString(formData["TenKH"]))) { TenKH = Convert.ToString(formData["TenKH"]); }
                string SDT = "";
                if (formData.Keys.Contains("SDT") && !string.IsNullOrEmpty(Convert.ToString(formData["SDT"]))) { SDT = Convert.ToString(formData["SDT"]); }
                DateTime? fr_NgayTao = null;
                if (formData.Keys.Contains("fr_NgayTao") && formData["fr_NgayTao"] != null && formData["fr_NgayTao"].ToString() != "")
                {
                    var dt = Convert.ToDateTime(formData["fr_NgayTao"].ToString());
                    fr_NgayTao = new DateTime(dt.Year, dt.Month, dt.Day, 0, 0, 0, 0);
                }
                DateTime? to_NgayTao = null;
                if (formData.Keys.Contains("to_NgayTao") && formData["to_NgayTao"] != null && formData["to_NgayTao"].ToString() != "")
                {
                    var dt = Convert.ToDateTime(formData["to_NgayTao"].ToString());
                    to_NgayTao = new DateTime(dt.Year, dt.Month, dt.Day, 23, 59, 59, 999);
                }
                long total = 0;
                var data = _hoadonBusiness.Search(page, pageSize, out total, TenKH, fr_NgayTao, to_NgayTao, SDT);
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

        [Route("search-hoadonsingle")]
        [HttpPost]
        public IActionResult SearchSingle([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string TenKH = "";
                if (formData.Keys.Contains("TenKH") && !string.IsNullOrEmpty(Convert.ToString(formData["TenKH"]))) { TenKH = Convert.ToString(formData["TenKH"]); }
                string SDT = "";
                if (formData.Keys.Contains("SDT") && !string.IsNullOrEmpty(Convert.ToString(formData["SDT"]))) { SDT = Convert.ToString(formData["SDT"]); }
                DateTime? fr_NgayTao = null;
                if (formData.Keys.Contains("fr_NgayTao") && formData["fr_NgayTao"] != null && formData["fr_NgayTao"].ToString() != "")
                {
                    var dt = Convert.ToDateTime(formData["fr_NgayTao"].ToString());
                    fr_NgayTao = new DateTime(dt.Year, dt.Month, dt.Day, 0, 0, 0, 0);
                }
                DateTime? to_NgayTao = null;
                if (formData.Keys.Contains("to_NgayTao") && formData["to_NgayTao"] != null && formData["to_NgayTao"].ToString() != "")
                {
                    var dt = Convert.ToDateTime(formData["to_NgayTao"].ToString());
                    to_NgayTao = new DateTime(dt.Year, dt.Month, dt.Day, 23, 59, 59, 999);
                }
                long total = 0;
                var data = _hoadonBusiness.SearchSingle(page, pageSize, out total, TenKH, fr_NgayTao, to_NgayTao, SDT);
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
