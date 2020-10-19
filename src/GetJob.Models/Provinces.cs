using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace GetJob.Models
{
    public class Provinces
    {
        [Key, StringLength(6)] public int PoliticalId { get; set; }

        [StringLength(50)] public string PoliticalMc { get; set; }

        
    }
}
