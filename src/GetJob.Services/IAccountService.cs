using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;

namespace GetJob.Services
{
    public interface IAccountService
    {
        Task<IdentityResult> CreateUserAsync(Student user, string plainPassword);
        Task<SignInResult> PasswordSignInAsync(string userName, string password);
        Task SignOutAsync();
        Task SetRoleAsync(string userName, string role);
    }
}
