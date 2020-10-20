using System.ComponentModel.DataAnnotations;

namespace GetJob.Web.ViewModels.Recruiter
{
    public class ChangePasswordViewModel
    {
        [Required]
        [Display(Name = "旧密码")]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "密码长度介于6到20之间")]
        public string OldPassword { get; set; }

        [Required]
        [Display(Name = "新密码")]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "密码长度介于6到20之间")]
        public string NewPassword { get; set; }
    }
}