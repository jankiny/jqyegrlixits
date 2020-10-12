using Microsoft.AspNetCore.Identity;

namespace GetJob.Models
{
    public class Student : IdentityUser
    {
        public int StudentId { get; set; }
    }
}
