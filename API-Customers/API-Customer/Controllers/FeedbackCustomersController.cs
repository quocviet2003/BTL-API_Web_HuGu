using Business;
using Business.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Customer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeedbackCustomersController : ControllerBase
    {
        private IFeedbackCustomersBusiness _feedbackBusiness;

        public FeedbackCustomersController(IFeedbackCustomersBusiness feedbackBusiness)
        {
            _feedbackBusiness = feedbackBusiness;
        }

        [Route("get_all")]
        [HttpGet]
        public List<FeedbackCustomersModel> GetAll()
        {
            return _feedbackBusiness.GetAll();

        }

        [Route("Create")]
        [HttpPost]
        public FeedbackCustomersModel CreateItem([FromBody] FeedbackCustomersModel model)
        {
            _feedbackBusiness.Create(model);
            return model;

        }
    }
}
