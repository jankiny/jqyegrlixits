using System;
using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class Company
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        [Required] [StringLength(50)] public string Name { get; set; }
        [Required] public int CompanyFieldId { get; set; }
        public CompanyField CompanyField { get; set; }
        [StringLength(450)] public string Description { get; set; }
    }
}