using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Services
{
    public interface IDeliverService
    {
        Task<List<Deliver>> GetDeliverByJobId(string jobId);
        Task<ResumeSubmitted> GetResumeSubmittedById(string id);
    }
}
