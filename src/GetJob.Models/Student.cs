using Microsoft.AspNetCore.Identity;
using System;
using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class Student
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        [StringLength(18)] public string IdentityNumber { get; set; }
        [StringLength(50)] public string Name { get; set; }
        [StringLength(2)] public string Sex { get; set; }
        [Required] public int BirthPlaceId { get; set; }
        public Location BirthPlace { get; set; }
        [StringLength(200)] public string Address { get; set; }

        public DateTime Birthday { get; set; }
        [Required] public int NationId { get; set; }
        public Nation Nation { get; set; }
        [Required] public int PoliticalOutlookId { get; set; }
        public PoliticalOutlook PoliticalOutlook { get; set; }
        [StringLength(11)] public string Phone { get; set; }
        [StringLength(50)] public string Mail { get; set; }
        [StringLength(50)] public string Major { get; set; }
        [StringLength(50)] public string College { get; set; }
        public DateTime StudyDate { get; set; }
        [Required] public int DegreeId { get; set; }
        public Degree Degree { get; set; }
    }
}
