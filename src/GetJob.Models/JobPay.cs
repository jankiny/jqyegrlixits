﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GetJob.Models
{
    public class JobPay
    {
        [Key]  public int JobPayId { get; set; }

        [Required] [StringLength(50)] public string Text { get; set; }
        public double PayFrom { get; set; }
        public double PayTo { get; set; }
    }
}