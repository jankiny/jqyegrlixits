using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Services
{
    public interface INationService
    {
        Task<List<Nation>> GetAllAsync();
    }
}
