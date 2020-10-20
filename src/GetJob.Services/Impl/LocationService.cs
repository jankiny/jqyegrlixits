using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Data;
using GetJob.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace GetJob.Services.Impl
{
    public class LocationService : ILocationService
    {
        private readonly GetJobDbContext _context;
        private readonly ILogger<LocationService> _logger;

        public LocationService(ILogger<LocationService> logger, GetJobDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<List<Location>> GetProvinceAsync()
        {
            try
            {
                return await _context.Locations.Where(l => l.LocationId % 10000 == 0).ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Location>> GetCityAsync(int provinceId)
        {
            try
            {
                var maxId = provinceId + 9999;
                return await _context.Locations
                    .Where(l => l.LocationId > provinceId && l.LocationId <= maxId)
                    .Where(l => l.LocationId % 100 == 0)
                    .ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Location>> GetDistrictAsync(int cityId)
        {
            try
            {
                var maxId = cityId + 99;
                return await _context.Locations
                    .Where(l => l.LocationId > cityId && l.LocationId <= maxId)
                    .ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }
    }
}