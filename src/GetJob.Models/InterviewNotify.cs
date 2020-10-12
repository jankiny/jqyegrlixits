using System;
using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class InterviewNotify
    {
        [Key] public int Id { get; set; }

        [Required] public string ToStudentId { get; set; }

        public Student ToStudent { get; set; }

        [Required] public int JobId { get; set; }

        public Job Job { get; set; }

        [Required] [StringLength(50)] public string Title { get; set; }

        [Required] [DataType(DataType.Date)] public DateTime InterviewDate { get; set; }

        [Required] public string InterviewLocation { get; set; }

        public string Note { get; set; }
    }
}