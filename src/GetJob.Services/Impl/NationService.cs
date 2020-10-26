using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GetJob.Data;
using GetJob.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
namespace GetJob.Services.Impl
{
    public class NationService:INationService
    {
        private readonly GetJobDbContext _context;
        private readonly ILogger<NationService> _logger;

        public NationService(ILogger<NationService> logger, GetJobDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<List<Nation>> GetAllAsync()
        {
            try
            {
                return await _context.Nations.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }
    }
}
