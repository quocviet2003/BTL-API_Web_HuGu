﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModel;
using DataAccessLayer;
namespace BusinessLogicLayer
{
    public partial interface IUserBusiness
    {
        UserModel Login(string taikhoan, string matkhau);
    }
   
}
