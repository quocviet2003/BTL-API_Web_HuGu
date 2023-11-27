using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public partial interface IFeedbackCustomersRepository
    {
        List<FeedbackCustomersModel> GetAll();
        bool Create(FeedbackCustomersModel model);
    }
}
