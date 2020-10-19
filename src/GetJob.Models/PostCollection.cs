using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace GetJob.Models
{
    public class PostCollection
    {
        [Key, StringLength(50)] public string PID { get; set; }

        [StringLength(50)] public string SID { get; set; }

        public string JID { get; set; }

        [StringLength(50)] public string State { get; set; }

        public DateTime Scsj { get; set; }

    }
}
