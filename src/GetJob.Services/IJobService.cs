using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Services
{
    public interface IJobService
    {
        // JobCharacter
        Task<List<JobCharacter>> GetAllJobCharacterAsync();
        // JobKind
        Task<List<JobKind>> GetAllFirstKindAsync();
        Task<List<JobKind>> GetAllSecondKindAsync(int firstKindId);
        // JobPay
        Task<List<JobPay>> GetAllJobPayAsync();
        // JobStatus
        Task<List<JobStatus>> GetAllJobStatusAsync();

        // Job
        Task<int> AddJobAsync(Job model);
        Task<int> DeleteJobAsync(Job model);
        Task<int> UpdateAsync(Job model);
        Task<Job> GetByIdAsync(string id);
        Task<List<Job>> GetByCompanyAsync(Company model);
        Task<List<Job>> GetByJobCharacterAsync(JobCharacter model);
        Task<List<Job>> GetByJobKindAsync(JobKind model);
        Task<List<Job>> GetByJobPayAsync(JobPay model);
        Task<List<Job>> GetAllAsync();
    }
}
