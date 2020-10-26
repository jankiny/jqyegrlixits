using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;
using System.Text;

namespace GetJob.Services
{
    public interface IStudentService
    {
        Task<List<Location>> GetAllLocationAsync();
        // Location
        Task<List<Nation>> GetAllNationAsync();
        // Nation
        Task<List<PoliticalOutlook>> GetAllPoliticalOutlookAsync();
        // PoliticalOutlook
        Task<List<Degree>> GetAllDegreeAsync();
        // Degree
        Task<int> AddAsync(Student model);
        Task<int> DeleteAsync(Student model);
        Task<int> UpdateAsync(Student model);
        Task<Student> GetByIdAsync(string id);
        //Task<List<Company>> GetByCompanyFieldAsync(CompanyField model);
        Task<List<Student>> GetAllAsync();
        Task<List<Student>> SearchAsync(string searchString);
    }
}
