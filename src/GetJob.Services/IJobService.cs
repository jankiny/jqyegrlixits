using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Services
{
    public interface IJobService
    {
        Task<int> PublishJobAsync(Job model);
        Task<int> DeleteJobAsync(Job model);
        Task<int> UpdateAsync(Job model);
        Task<Job> GetByIdAsync(int id);
        Task<List<Job>> GetByJobCharacterAsync(JobCharacter model);
        Task<List<Job>> GetByJobKindAsync(JobKind model);
        Task<List<Job>> GetByJobPayAsync(JobPay model);
        Task<List<Job>> GetAllAsync();
    }
}
