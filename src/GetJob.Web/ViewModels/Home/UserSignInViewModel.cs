using System.ComponentModel.DataAnnotations;

namespace GetJob.Web.ViewModels.Home
{
    public class UserSignInViewModel
    {
        [Required] [Display(Name = "用户名")] public string UserName { get; set; }
        [Required] [Display(Name = "密码")] public string Password { get; set; }
    }
}
