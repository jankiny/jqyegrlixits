using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace GetJob.Models
{
    public class Company : IdentityUser
    {

        [Required, StringLength(50)] public string RealName { get; set; }

        [Required] public int CompanyFieldId { get; set; }

        public CompanyField CompanyField { get; set; }
        public string Description { get; set; }
    }
}