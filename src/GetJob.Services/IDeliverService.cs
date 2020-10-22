using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Services
{
    public interface IDeliverService
    {
        Task<int> AddResume(Resume model);
        Task<int> AddResumeSubmit(ResumeSubmitted model);
        Task<int> AddDeliver(Deliver model);
        Task<List<Deliver>> GetDeliverByJobId(string jobId);
        Task<ResumeSubmitted> GetResumeSubmittedById(string id);
    }
}
