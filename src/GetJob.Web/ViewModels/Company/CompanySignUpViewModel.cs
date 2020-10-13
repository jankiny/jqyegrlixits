using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GetJob.Web.ViewModels.Company
{
    public class CompanySignUpViewModel
    {
        public string PhoneNumber { get; set; }
        public string UserName { get; set; }
        public string CompanyName { get; set; }
        public string Mail { get; set; }
        public string Password { get; set; }
        public int CompanyFieldId { get; set; }
    }
}
