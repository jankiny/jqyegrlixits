using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class Student
    {
        public string StudentId { get; set; }
        [StringLength(10)]
        public string Xh { get; set; }
        public string Xm { get; set; }
        public string Xb { get; set; }
        public string Csny { get; set; }
        public string MzId { get; set; }
        public string ZzId { get; set; }
        public string Phone { get; set; }

        public string Mail { get; set; }
        public string Adress { get; set; }
    }
}
