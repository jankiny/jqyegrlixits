using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Web.ViewModels.Company
{
    public class JobViewModel
    {
        public JobViewModel()
        {
            
        }

        public JobViewModel(Job job)
        {
            Id = job.Id;
            Name = job.Name;
            CompanyId = job.CompanyId;
            Company = job.Company;
            JobCharacterId = job.JobCharacterId;
            JobCharacter = job.JobCharacter;
            JobFirstKindId = job.JobKindId - (job.JobKindId % 10000);
            JobKindId = job.JobKindId;
            JobKind = job.JobKind;
            JobPayId = job.JobPayId;
            JobPay = job.JobPay;
            JobStatusId = job.JobStatusId;
            JobStatus = job.JobStatus;
            ProvinceId = job.LocationId - (job.LocationId % 10000);
            CityId = job.LocationId - (job.LocationId % 100);
            LocationId = job.LocationId;
            Location = job.Location;
            DegreeId = job.DegreeId;
            Degree = job.Degree;
            RecruitNumber = job.RecruitNumber;
            Description = job.Description;
            LastModify = job.LastModify;
        }
        public bool Selected { get; set; }

        public string Id { get; set; } = string.Empty;

        [Required, StringLength(50), Display(Name = "岗位名")] public string Name { get; set; }

        [Required] public string CompanyId { get; set; }
        public Models.Company Company { get; set; }

        [Required, Display(Name = "招聘类型")] public int JobCharacterId { get; set; }
        public JobCharacter JobCharacter { get; set; }

        [Required, Display(Name = "岗位大类")]  public int JobFirstKindId { get; set; }
        [Required, Display(Name = "岗位类别")] public int JobKindId { get; set; }
        public JobKind JobKind { get; set; }


        [Required, Display(Name = "薪水")] public int JobPayId { get; set; }
        public JobPay JobPay { get; set; }

        [Required, Display(Name = "招聘状态")] public int JobStatusId { get; set; }
        public JobStatus JobStatus { get; set; }


        [Required, Display(Name = "省份")] public int ProvinceId { get; set; }
        [Required, Display(Name = "城市")] public int CityId { get; set; }
        [Required, Display(Name = "工作地点")] public int LocationId { get; set; }
        public Location Location { get; set; }

        [Required, Display(Name = "学历")] public int DegreeId { get; set; }
        public Degree Degree { get; set; }

        [Required, Display(Name = "招聘人数")] public int RecruitNumber { get; set; }

        [StringLength(450), Display(Name = "岗位描述")] public string Description { get; set; } = string.Empty;

        //// 用‘|’分割
        //[StringLength(450)] public string ResumeReceived { get; set; } = string.Empty;
        public DateTime LastModify { get; set; }
    }
}
