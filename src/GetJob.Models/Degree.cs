﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace GetJob.Models
{
    public class Degree
    {
        [Key] public int DegreeId { get; set; }
        [Required, StringLength(50)] public string Text { get; set; }
    }
}
