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

        public ResumeSubmittedViewModel(ResumeSubmitted resumeSubmitted)
        {
            Id = resumeSubmitted.Id;
            StudentId = resumeSubmitted.StudentId;
            Student = resumeSubmitted.Student;
            Title = resumeSubmitted.Title;
            CreateDateTime = resumeSubmitted.CreateDateTime;
            ForJobKindId = resumeSubmitted.ForJobKindId;
            ForJobKind = resumeSubmitted.ForJobKind;
            ForJobAddressId = resumeSubmitted.ForJobAddressId;
            ForJobAddress = resumeSubmitted.ForJobAddress;
            ForJobCharacterId = resumeSubmitted.ForJobCharacterId;
            ForJobCharacter = resumeSubmitted.ForJobCharacter;
            ForJobPayId = resumeSubmitted.ForJobPayId;
            ForJobPay = resumeSubmitted.ForJobPay;
            Certificate = resumeSubmitted.Certificate;
            WorkExperience = resumeSubmitted.WorkExperience;
            SelfEvaluation = resumeSubmitted.SelfEvaluation;
            State = resumeSubmitted.State;
            Visible = resumeSubmitted.Visible;
        }
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
