using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;

namespace GetJob.Services
{
    public interface ICompanyService
    {
        // CompanyField
        Task<List<CompanyField>> GetAllCompanyFieldAsync();
        // CompanyScale
        Task<List<CompanyScale>> GetAllCompanyScaleAsync();
        // Company
        Task<int> AddAsync(Company model);
        Task<int> DeleteAsync(Company model);
        Task<int> UpdateAsync(Company model);
        Task<Company> GetByIdAsync(string id);
        Task<List<Company>> GetByCompanyFieldAsync(CompanyField model);
        Task<List<Company>> GetAllAsync();
        Task<List<Company>> SearchAsync(string searchString);
    }
}
