using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Web.ViewModels.Hire
{
    public class ResumeSubmittedViewModel
    {
        public ResumeSubmittedViewModel()
        {

        }

        public ResumeSubmittedViewModel(Deliver deliver)
        {
            DeliverStatusId = deliver.DeliverStatusId;
            DeliverId = deliver.Id;
            Id = deliver.ResumeSubmitted.Id;
            StudentId = deliver.ResumeSubmitted.StudentId;
            Student = deliver.ResumeSubmitted.Student;
            Title = deliver.ResumeSubmitted.Title;
            CreateDateTime = deliver.ResumeSubmitted.CreateDateTime;
            ForJobKindId = deliver.ResumeSubmitted.ForJobKindId;
            ForJobKind = deliver.ResumeSubmitted.ForJobKind;
            ForJobAddressId = deliver.ResumeSubmitted.ForJobAddressId;
            ForJobAddress = deliver.ResumeSubmitted.ForJobAddress;
            ForJobCharacterId = deliver.ResumeSubmitted.ForJobCharacterId;
            ForJobCharacter = deliver.ResumeSubmitted.ForJobCharacter;
            ForJobPayId = deliver.ResumeSubmitted.ForJobPayId;
            ForJobPay = deliver.ResumeSubmitted.ForJobPay;
            Certificate = deliver.ResumeSubmitted.Certificate;
            WorkExperience = deliver.ResumeSubmitted.WorkExperience;
            SelfEvaluation = deliver.ResumeSubmitted.SelfEvaluation;
            State = deliver.ResumeSubmitted.State;
            Visible = deliver.ResumeSubmitted.Visible;
        }
        public string Pass { get; set; }
        public int DeliverStatusId { get; set; }
        [Display(Name = "标题")] public string NotifyTitle { get; set; }
        [Display(Name = "地点")] public string InterviewLocation { get; set; }
        [Display(Name = "时间")] public DateTime InterviewDate { get; set; } = DateTime.Now;
        [Display(Name = "备注")] public string InterviewNote { get; set; }
        public string DeliverId { get; set; }
        public string Id { get; set; } = string.Empty;
        [Required, Display(Name = "求职人")] public string StudentId { get; set; }
        public Models.Student Student { get; set; }
        [StringLength(50), Display(Name = "简历标题")] public string Title { get; set; }
        public DateTime CreateDateTime { get; set; }
        [Required, Display(Name = "岗位类型")] public int ForJobKindId { get; set; }
        public JobKind ForJobKind { get; set; }
        [Required, Display(Name = "工作地点")] public int ForJobAddressId { get; set; }
        public Location ForJobAddress { get; set; }
        [Required, Display(Name = "求职类型")] public int ForJobCharacterId { get; set; }
        public JobCharacter ForJobCharacter { get; set; }
        [Required, Display(Name = "期望薪水")] public int ForJobPayId { get; set; }
        public JobPay ForJobPay { get; set; }
        [Display(Name = "获奖情况")] public string Certificate { get; set; }
        [Display(Name = "工作经历")] public string WorkExperience { get; set; }
        [Display(Name = "自我评估")] public string SelfEvaluation { get; set; }
        [StringLength(10), Display(Name = "当前状态")] public string State { get; set; }
        [StringLength(2)] public string Visible { get; set; }
    }
}
