using GetJob.Model;
using Microsoft.AspNetCore.Identity;

namespace Identity.Models
{
    public class AppUser : IdentityUser
    {
        public string CompanyId { get; set; }
        public Company Company { get; set; }
    }
}
