using System;
using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class InterviewNotify
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();

        //[Required] public string ToStudentId { get; set; }

        //public Student ToStudent { get; set; }

        //[Required] public string JobId { get; set; }

        //public Job Job { get; set; }
        [Required] public string DeliverId { get; set; }
        public Deliver Deliver { get; set; }

        [Required, StringLength(50)] public string Title { get; set; }

        [Required, DataType(DataType.Date)] public DateTime InterviewDate { get; set; }

        [Required] public string InterviewLocation { get; set; }

        [StringLength(100)] public string Note { get; set; } = string.Empty;
    }
}