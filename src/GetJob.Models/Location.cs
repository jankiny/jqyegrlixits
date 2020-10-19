using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace GetJob.Models
{
    public class Location
    {
        [Key] public int LocationId { get; set; }

        [StringLength(50)] public string Text { get; set; }

        
    }
}
