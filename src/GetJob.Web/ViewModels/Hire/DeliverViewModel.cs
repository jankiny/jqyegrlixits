using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Web.ViewModels.Hire
{
    public class DeliverViewModel
    {
        public DeliverViewModel()
        {
            
        }

        public DeliverViewModel(Deliver deliver)
        {
            Id = deliver.Id;
            JobId = deliver.JobId;
            Job = deliver.Job;
            ResumeSubmitted = deliver.ResumeSubmitted;
            ResumeSubmittedId = deliver.ResumeSubmittedId;
            DeliverStatusId = deliver.DeliverStatusId;
            DeliverStatus = deliver.DeliverStatus;
            DeliverDateTime = deliver.DeliverDateTime;
        }
        public string Id { get; set; } = string.Empty;

        [Required, Display(Name = "岗位")] public string JobId { get; set; }
        public Job Job { get; set; }

        [Required, Display(Name = "简历")] public string ResumeSubmittedId { get; set; }
        public ResumeSubmitted ResumeSubmitted { get; set; }

        [Required, Display(Name = "提交状态")] public int DeliverStatusId { get; set; }
        public DeliverStatus DeliverStatus { get; set; }

        [Display(Name = "提交时间")] public DateTime DeliverDateTime { get; set; }
    }
}
