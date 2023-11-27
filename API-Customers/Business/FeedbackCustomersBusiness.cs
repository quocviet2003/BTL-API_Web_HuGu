using Business.Interfaces;
using DataAccess.Interfaces;
using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class FeedbackCustomersBusiness : IFeedbackCustomersBusiness
    {
        private IFeedbackCustomersRepository _res;
        public FeedbackCustomersBusiness(IFeedbackCustomersRepository res)
        {
            _res = res;
        }

        public List<FeedbackCustomersModel> GetAll()
        {
            return _res.GetAll();
        }

        public bool Create(FeedbackCustomersModel model)
        {
            return _res.Create(model);
        }
    }
}
