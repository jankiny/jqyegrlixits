using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;

namespace GetJob.Services
{
    public interface IStudentService
    {
        Task<IdentityResult> CreateStudentAsync(Student user, string plainPassword);
        Task<SignInResult> PasswordSignInAsync(string userName, string password);
        Task SignOutAsync();
    }
}
