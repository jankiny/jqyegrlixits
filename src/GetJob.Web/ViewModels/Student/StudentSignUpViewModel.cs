using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using System;

namespace GetJob.Web.ViewModels.Student
{
    public class StudentSignUpViewModel
    {
        [Required] [Display(Name = "用户名")] public string UserName { get; set; }

        [Required] [Display(Name = "密码")] public string Password { get; set; }

        [Required] [Display(Name = "邮箱")] public string Mail { get; set; }

        [Required] [Display(Name = "手机")] public string Phone { get; set; }

        [Required] [Display(Name = "身份证号")] public string IdentityNumber { get; set; }
        [Required] [Display(Name = "姓名")] public string Name { get; set; }
        [Required] [Display(Name = "性别")] public string Sex { get; set; }
        [Required] [Display(Name = "籍贯")] public int BirthPlaceId { get; set; }
        [Required] [Display(Name = "地址")] public string Address { get; set; }
        [Required] [Display(Name = "出生年月")] public DateTime Birthday { get; set; }
        [Required] [Display(Name = "民族")] public int NationId { get; set; }

        [Required] [Display(Name = "政治面貌")] public int PoliticalOutlookId { get; set; }

        [Required] [Display(Name = "专业")] public string Major { get; set; }
        
        [Required] [Display(Name = "大学")] public string College { get; set; }
        [Required] [Display(Name = "就读时间")] public DateTime StudyTime { get; set; }
        [Required, Display(Name = "学历")] public int DegreeId { get; set; }

        [Required, Display(Name = "省份")] public int ProvinceId { get; set; }
        [Required, Display(Name = "城市")] public int CityId { get; set; }
    }
}