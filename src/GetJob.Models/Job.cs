﻿using System;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace GetJob.Models
{
    public class Job
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();

        [Required, StringLength(50)] public string Name { get; set; }

        [Required] public string CompanyId { get; set; }

        public Company Company { get; set; }

        [Required] public int JobCharacterId { get; set; }

        public JobCharacter JobCharacter { get; set; }

        [Required] public int JobKindId { get; set; }

        public JobKind JobKind { get; set; }

        [Required] public int JobPayId { get; set; }

        public JobPay JobPay { get; set; }

        [StringLength(450)] public string Description { get; set; } = string.Empty;

        // 用‘|’分割
        [StringLength(450)] public string ResumeReceived { get; set; } = string.Empty;
        [Required, DataType(DataType.DateTime)] public DateTime LastModify { get; set; }
    }
}