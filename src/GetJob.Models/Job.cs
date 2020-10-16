using System;
using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class Job
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();

        [Required, StringLength(50)] public string Name { get; set; }

        [Required] public string PublisherId { get; set; }

        public Company Publisher { get; set; }

        [Required] public int JobKindId { get; set; }

        public JobKind JobKind { get; set; }

        [Required] public int JobCharacterId { get; set; }

        public JobCharacter JobCharacter { get; set; }

        [Required] public int JobPayId { get; set; }

        public JobPay JobPay { get; set; }

        public string Description { get; set; }

        // 用‘|’分割
        public string ResumeReceived { get; set; }
    }
}