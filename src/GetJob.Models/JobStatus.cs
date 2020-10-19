using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace GetJob.Models
{
    public class JobStatus
    {
        [Key] public int JobStatusId { get; set; }
        [Required, StringLength(50)]public string Text { get; set; }
    }
}
