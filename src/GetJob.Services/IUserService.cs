using System.Collections.Generic;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;

namespace GetJob.Services
{
    public interface IUserService
    {
        Task<IdentityResult> CreateUserAsync(IdentityUser model, string plainPassword, Company company);
        Task<IdentityResult> CreateUserAsync(IdentityUser model, string plainPassword, Student student);
        Task<SignInResult> PasswordSignInAsync(string userName, string password);
        Task SignOutAsync();
        Task<IdentityResult> DeleteAsync(IdentityUser model);
        Task<IdentityResult> UpdateAsync(IdentityUser model);
        Task<IdentityResult> UpdateUserClaimAsync(string userName, string claimType, string claimValue);
        Task<IdentityResult> ChangePassword(string userName, string currentPassword, string newPassword);
        Task<IdentityUser> GetByIdAsync(string id);
        Task<IdentityUser> GetByUserNameAsync(string userName);
        Task<string> GetUserClaimAsync(string userName, string claimType);
        Task<object> GetUserIdentity(string userName);
        Task<List<IdentityUser>> GetAllAsync();
    }
}
