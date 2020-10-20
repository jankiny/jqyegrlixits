using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;

namespace GetJob.Services
{
    public interface IStudentService
    {
        Task<Student> GetByIdAsync(string id);
    }
}
