using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;
using System.Text;

namespace GetJob.Services
{
    public interface IResumeService
    {
        // ForJobCharacter
        Task<List<JobCharacter>> GetAllForJobCharacterAsync();
        // ForJobKind
        Task<List<JobKind>> GetAllFirstKindAsync();
        Task<List<JobKind>> GetAllSecondKindAsync(int firstKindId);
        // ForJobPay
        Task<List<JobPay>> GetAllForJobPayAsync();
        // ForJobAddress
        Task<List<Location>> GetAllForJobAddressAsync();
        // JobAddress
        Task<int> AddResumeAsync(Resume model);
        Task<int> DeleteResumeAsync(Resume model);
        Task<int> UpdateAsync(Resume model);
        Task<Resume> GetByIdAsync(string id);
        Task<List<Resume>> GetByStudentAsync(Student model);
        Task<List<Resume>> GetByForJobCharacterAsync(JobCharacter model);
        Task<List<Resume>> GetByForJobKindAsync(JobKind model);
        Task<List<Resume>> GetByForJobPayAsync(JobPay model);
        Task<List<Resume>> GetByForJobAddressAsync(Location model);
        Task<List<Resume>> GetAllAsync();
    }
}
