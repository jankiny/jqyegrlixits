using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace GetJob.Web.ViewModels.Recruiter
{
    public class UserInfoViewModel
    {
        public UserInfoViewModel()
        {
            
        }

        public UserInfoViewModel(IdentityUser user)
        {
            Id = user.Id;
            UserName = user.UserName;
            Email = user.Email;
            PhoneNumber = user.PhoneNumber;
        }
        public string Id { get; set; }
        [Display(Name = "用户名")] public string UserName { get; set; }
        [Display(Name = "邮箱")] public string Email { get; set; }
        [Display(Name = "电话")] public string PhoneNumber { get; set; }
    }
}
