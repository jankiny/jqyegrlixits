using Microsoft.AspNetCore.Identity;
using System;
using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class Student
    {
        [Key,StringLength(50)] public string SID { get; set; }
        [StringLength(18)] public string Sfzh { get; set; }
        [StringLength(50)] public string Xm { get; set; }
        [StringLength(2)] public string Xb { get; set; }
        [StringLength(50)] public string Jg { get; set; }
        public DateTime Csny { get; set; }
        public int MzId { get; set; }
        public int ZzmmId { get; set; }
        [StringLength(11)] public string Phone { get; set; }
        [StringLength(50)] public string Mail { get; set; }
        [StringLength(200)] public string Adress { get; set; }
        [StringLength(50)] public string Major { get; set; }
        [StringLength(50)] public string College { get; set; }
        public DateTime Jdsj { get; set; }
        public int DegreeID { get; set; }
        public int XlID { get; set; }
    }
}
