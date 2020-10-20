using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Services
{
    public interface ILocationService
    {
        Task<List<Location>> GetProvinceAsync();
        Task<List<Location>> GetCityAsync(int provinceId);
        Task<List<Location>> GetDistrictAsync(int cityId);
    }
}
