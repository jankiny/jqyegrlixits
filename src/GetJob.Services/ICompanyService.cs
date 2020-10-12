using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;

namespace GetJob.Services
{
    public interface ICompanyService
    {
        // 登录
        Task<IdentityResult> CreateCompanyAsync(Company model, string plainPassword);
        Task<SignInResult> PasswordSignInAsync(string userName, string password);
        Task SignOutAsync();
        Task SetRoleAsync(string userName, string role);
        // 信息删改查
        Task<IdentityResult> DeleteAsync(Company model);
        Task<IdentityResult> UpdateAsync(Company model);
        Task<Company> GetByIdAsync(string id);
        Task<List<Company>> GetByCompanyFieldAsync(CompanyField model);
        Task<List<Company>> GetAllAsync();
    }
}
