using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace GetJob.Models
{
    public class Deliver
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();

        [Required] public string JobId { get; set; }
        public Job Job { get; set; }

        [Required] public string ResumeSubmittedId { get; set; }
        public ResumeSubmitted ResumeSubmitted { get; set; }

        [Required] public int DeliverStatusId { get; set; }
        public DeliverStatus DeliverStatus { get; set; }

        public DateTime DeliverDateTime { get; set; }
    }
}
