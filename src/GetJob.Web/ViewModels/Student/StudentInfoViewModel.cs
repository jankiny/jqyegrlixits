using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Web.ViewModels.Student
{
    public class StudentInfoViewModel
    {
        public StudentInfoViewModel()
        {
            
        }
        public StudentInfoViewModel(Models.Student student)
        {
            Id = student.Id;
            IdentityNumber = student.IdentityNumber;
            Name = student.Name;
            Sex = student.Sex;         
            BirthPlace = student.BirthPlace;
            BirthPlaceId = student.BirthPlaceId;
            Address = student.Address;
            Birthday = student.Birthday;
            Nation = student.Nation;
            NationId = student.NationId;
            PoliticalOutlook = student.PoliticalOutlook;
            PoliticalOutlookId = student.PoliticalOutlookId;
            Phone = student.Phone;
            Mail = student.Mail;
            College = student.College;
            Degree = student.Degree;
            DegreeId = student.DegreeId;

        }
        public string Id { get; set; } = Guid.NewGuid().ToString();
        [StringLength(18),Display(Name="身份证号")] public string IdentityNumber { get; set; }
        [StringLength(50), Display(Name = "姓名")] public string Name { get; set; }
        [StringLength(2), Display(Name = "性别")] public string Sex { get; set; }        
        [Required, Display(Name = "籍贯")] public int BirthPlaceId { get; set; }
        public Location BirthPlace { get; set; }
        [StringLength(200), Display(Name = "地址")] public string Address { get; set; }
        [Display(Name= "出生年月")]public DateTime Birthday { get; set; }
        [Required, Display(Name = "民族")] public int NationId { get; set; }
        public Nation Nation { get; set; }
        [Required, Display(Name = "政治面貌")] public int PoliticalOutlookId { get; set; }
        public PoliticalOutlook PoliticalOutlook { get; set; }
        [StringLength(11), Display(Name = "电话")] public string Phone { get; set; }
        [StringLength(50), Display(Name = "邮箱")] public string Mail { get; set; }
        [StringLength(50), Display(Name = "专业")] public string Major { get; set; }
        [StringLength(50), Display(Name = "大学")] public string College { get; set; }
        [Display(Name= "就读时间")]public DateTime StudyDate { get; set; }
        [Required, Display(Name = "学历")] public int DegreeId { get; set; }
        public Degree Degree { get; set; }
    }

}
