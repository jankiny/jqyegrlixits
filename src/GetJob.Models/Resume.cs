using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace GetJob.Models
{
    public class Resume
    {
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
