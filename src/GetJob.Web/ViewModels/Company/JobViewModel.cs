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
            JobKindId = job.JobKindId;
            JobKind = job.JobKind;
            JobPayId = job.JobPayId;
            JobPay = job.JobPay;
            Description = job.Description;
            ResumeReceived = job.ResumeReceived;
            LastModify = job.LastModify;
        }
        public bool Selected { get; set; }

        public string Id { get; set; } = string.Empty;

        [Required, StringLength(50), Display(Name = "岗位名")] public string Name { get; set; }

        [Required] public string CompanyId { get; set; }

        public Models.Company Company { get; set; }

        [Required, Display(Name = "招聘类型")] public int JobCharacterId { get; set; }

        public JobCharacter JobCharacter { get; set; }

        [Required, Display(Name = "岗位类别")] public int JobKindId { get; set; }
        public int JobFirstKindId { get; set; }

        public JobKind JobKind { get; set; }

        [Required, Display(Name = "薪水")] public int JobPayId { get; set; }

        public JobPay JobPay { get; set; }

        [StringLength(450), Display(Name = "岗位描述")] public string Description { get; set; } = string.Empty;

        // 用‘|’分割
        [StringLength(450)] public string ResumeReceived { get; set; } = string.Empty;
        public DateTime LastModify { get; set; }
    }
}
