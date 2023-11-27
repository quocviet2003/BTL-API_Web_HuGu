using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_BTL.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DonHangNhapController : ControllerBase
    {
        private IDonHangNhapBusiness _donhangnhapBusiness;

        [Route("get_all")]
        [HttpGet]
        public List<DonHangNhapModel> GetAll()
        {
            return _donhangnhapBusiness.GetAll();
        }
        public DonHangNhapController(IDonHangNhapBusiness donhangnhapBusiness)
        {
            _donhangnhapBusiness = donhangnhapBusiness;
        }



        [Route("Create")]
        [HttpPost]
        public DonHangNhapModel CreateItem([FromBody] DonHangNhapModel model)
        {
            _donhangnhapBusiness.Create(model);
            return model;
        }


        [Route("Update")]
        [HttpPost]
        public DonHangNhapModel UpdateItem([FromBody] DonHangNhapModel model)
        {
            _donhangnhapBusiness.Update(model);
            return model;
        }



        [Route("Delete")]
        [HttpPost]
        public IActionResult DeleteItem(int id)
        {
            bool result = _donhangnhapBusiness.Delete(id);
            if (result)
            {
                return Ok("Xóa thành công");
            }
            else
            {
                return BadRequest("Không tìm thấy đơn hàng nhập!");
            }
        }

        [Route("search")]
        [HttpPost]
        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                DateTime ngayThongKe = DateTime.Parse(formData["ngayThongKe"].ToString()); // Thêm dòng này để lấy ngày từ formData
                long total = 0;
                var data = _donhangnhapBusiness.Search(page, pageSize, out total, ngayThongKe); // Sử dụng phương thức tìm kiếm theo ngày
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
                return BadRequest(ex.Message);
            }
        }

    }
}
