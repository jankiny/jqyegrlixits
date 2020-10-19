using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace GetJob.Models
{
    public class Deliver
    {
        [Key, StringLength(50)] public string DID { get; set; }

        public string JID { get; set; }

        [StringLength(50)] public string RSID { get; set; }

        [StringLength(50)] public string State { get; set; }

        public DateTime Tdsj { get; set; }

    }
}
