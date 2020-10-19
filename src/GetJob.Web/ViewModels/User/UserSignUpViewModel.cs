using System.ComponentModel.DataAnnotations;

namespace GetJob.Web.ViewModels.User
{
    public class UserSignUpViewModel
    {
        [Required] [Display(Name = "用户名")] public string UserName { get; set; }

        [Required] [Display(Name = "密码")] public string Password { get; set; }

        [Required] [Display(Name = "邮箱")] public string Mail { get; set; }

        [Required] [Display(Name = "手机")] public string Phone { get; set; }
        public bool HasCompany { get; set; }
        [Display(Name = "公司名")] public string CompanyName { get; set; }
        [Display(Name = "公司类别")] public int CompanyFieldId { get; set; }
    }
}