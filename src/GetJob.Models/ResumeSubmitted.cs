using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace GetJob.Models
{
    public class ResumeSubmitted
    {
        public ResumeSubmitted()
        {
            
        }
        public ResumeSubmitted(Resume resume)
        {
            Id = resume.Id;
            StudentId = resume.StudentId;
            Student = resume.Student;
            Title = resume.Title;
            CreateDateTime = resume.CreateDateTime;
            ForJobKindId = resume.ForJobKindId;
            ForJobKind = resume.ForJobKind;
            ForJobAddressId = resume.ForJobAddressId;
            ForJobAddress = resume.ForJobAddress;
            ForJobCharacterId = resume.ForJobCharacterId;
            ForJobCharacter = resume.ForJobCharacter;
            ForJobPayId = resume.ForJobPayId;
            ForJobPay = resume.ForJobPay;
            Certificate = resume.Certificate;
            WorkExperience = resume.WorkExperience;
            SelfEvaluation = resume.SelfEvaluation;
            State = resume.State;
            Visible = resume.Visible;
        }
        public string Id { get; set; } = Guid.NewGuid().ToString();
        [Required] public string StudentId { get; set; }
        public Student Student { get; set; }
        [StringLength(50)] public string Title { get; set; }
        public DateTime CreateDateTime { get; set; }
        [Required] public int ForJobKindId { get; set; }
        public JobKind ForJobKind { get; set; }
        [Required] public int ForJobAddressId { get; set; }
        public Location ForJobAddress { get; set; }
        [Required] public int ForJobCharacterId { get; set; }
        public JobCharacter ForJobCharacter { get; set; }
        [Required] public int ForJobPayId { get; set; }
        public JobPay ForJobPay { get; set; }
        public string Certificate { get; set; }
        public string WorkExperience { get; set; }
        public string SelfEvaluation { get; set; }
        [StringLength(10)] public string State { get; set; }
        [StringLength(2)] public string Visible { get; set; }

    }
}
