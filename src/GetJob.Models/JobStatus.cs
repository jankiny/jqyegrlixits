using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace GetJob.Models
{
    public class JobStatus
    {
        public int JobStatusId { get; set; }
        public string Text { get; set; }
    }
}
