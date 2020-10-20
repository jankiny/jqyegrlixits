using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace GetJob.Web.ViewModels.Company
{
    public class CompanySignUpViewModel
    {
        [Required, Display(Name = "手机")] public string PhoneNumber { get; set; }
        [Required, Display(Name = "用户名")] public string UserName { get; set; }
        [Required, Display(Name = "邮箱")] public string Mail { get; set; }
        [Required, Display(Name = "密码")] public string Password { get; set; }
        [Required, Display(Name = "公司名")] public string CompanyName { get; set; }
        [Required, Display(Name = "公司性质")] public int CompanyFieldId { get; set; }
        [Required, Display(Name = "公司规模")] public int CompanyScaleId { get; set; }
    }
}
