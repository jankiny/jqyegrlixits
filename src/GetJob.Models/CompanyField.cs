﻿using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class CompanyField
    {
        [Key] public int CompanyFieldId { get; set; }
        [Required, StringLength(50)] public string Text { get; set; }
    }
}