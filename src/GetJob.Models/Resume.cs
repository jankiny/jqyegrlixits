using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace GetJob.Models
{
    public class Resume
    {
        [Key, StringLength(50)] public string RID { get; set; }
        [StringLength(50)] public string SID { get; set; }
        [StringLength(50)] public string Theme { get; set; }
        public DateTime Cjsj { get; set; }
        public int JobKindId { get; set; }
        [StringLength(50)] public string  JobAdress { get; set; }
        public int JobCharacterID{ get; set; }
        public int JobPayID { get; set; }
        public string Certificate { get; set; }
        public string Gzjl { get; set; }
        public string Zwpj { get; set; }
        [StringLength(10)] public string State { get; set; }
        [StringLength(2)] public string Visible { get; set; }
       

    }
}
