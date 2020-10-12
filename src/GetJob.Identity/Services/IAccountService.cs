using System.Threading.Tasks;
using Identity.Models;
using Microsoft.AspNetCore.Identity;

namespace Identity.Services
{
    public interface IAccountService
    {
        Task<IdentityResult> CreateUserAsync(AppUser user, string plainPassword);
        Task<SignInResult> PasswordSignInAsync(string userName, string password);
        Task SignOutAsync();
        Task SetRoleAsync(string userName, string role);
    }
}
