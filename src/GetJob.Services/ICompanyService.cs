using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;

namespace GetJob.Services
{
    public interface ICompanyService
    {
        Task<List<Company>> GetByCompanyFieldAsync(CompanyField model);
        Task<List<Company>> GetAllAsync();
        Task<List<Company>> SearchAsync(string searchString);
    }
}
