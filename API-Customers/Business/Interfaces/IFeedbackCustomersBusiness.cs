using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Interfaces
{
    public partial interface IFeedbackCustomersBusiness
    {
        List<FeedbackCustomersModel> GetAll();
        bool Create(FeedbackCustomersModel model);
    }
}
