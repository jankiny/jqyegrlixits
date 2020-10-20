using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GetJob.Data;
using GetJob.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace GetJob.Services.Impl
{
    public class DegreeService : IDegreeService
    {
        private readonly GetJobDbContext _context;
        private readonly ILogger<DegreeService> _logger;

        public DegreeService(ILogger<DegreeService> logger, GetJobDbContext context)
        {
            _logger = logger;
            _context = context;
        }
        public async Task<List<Degree>> GetAllAsync()
        {
            try
            {
                return await _context.Degrees.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }
    }
}