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
    public class JobService : IJobService
    {
        private readonly ILogger<JobService> _logger;
        private readonly GetJobDbContext _context;

        public JobService(ILogger<JobService> logger, GetJobDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<int> PublishJobAsync(Job model)
        {
            try
            {
                await _context.Jobs.AddAsync(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<int> DeleteJobAsync(Job model)
        {
            try
            {
                _context.Jobs.Remove(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<int> UpdateAsync(Job model)
        {
            try
            {
                _context.Jobs.Update(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<Job> GetByIdAsync(int id)
        {
            try
            {
                var job = await _context.Jobs.FindAsync(id);
                job.JobCharacter = await _context.JobCharacters.FindAsync(job.JobCharacterId);
                job.JobKind = await _context.JobKinds.FindAsync(job.JobKindId);
                job.JobPay = await _context.JobPays.FindAsync(job.JobPayId);
                return job;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Job>> GetByJobCharacterAsync(JobCharacter model)
        {
            try
            {
                var jobList = await _context.Jobs.Where(j => j.JobCharacterId == model.Id).ToListAsync();
                foreach (var job in jobList)
                {
                    job.JobCharacter = model;
                    job.JobKind = await _context.JobKinds.FindAsync(job.JobKindId);
                    job.JobPay = await _context.JobPays.FindAsync(job.JobPayId);
                }

                return jobList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Job>> GetByJobKindAsync(JobKind model)
        {
            try
            {
                var jobList = await _context.Jobs.Where(j => j.JobKindId == model.Id).ToListAsync();
                foreach (var job in jobList)
                {
                    job.JobCharacter = await _context.JobCharacters.FindAsync(job.JobCharacterId);
                    job.JobKind = model;
                    job.JobPay = await _context.JobPays.FindAsync(job.JobPayId);
                }

                return jobList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Job>> GetByJobPayAsync(JobPay model)
        {
            try
            {
                var jobList = await _context.Jobs.Where(j => j.JobPayId == model.Id).ToListAsync();
                foreach (var job in jobList)
                {
                    job.JobCharacter = await _context.JobCharacters.FindAsync(job.JobCharacterId);
                    job.JobKind = await _context.JobKinds.FindAsync(job.JobKindId);
                    job.JobPay = model;
                }

                return jobList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Job>> GetAllAsync()
        {
            try
            {
                var jobList = await _context.Jobs.ToListAsync();
                foreach (var job in jobList)
                {
                    job.JobCharacter = await _context.JobCharacters.FindAsync(job.JobCharacterId);
                    job.JobKind = await _context.JobKinds.FindAsync(job.JobKindId);
                    job.JobPay = await _context.JobPays.FindAsync(job.JobPayId);
                }

                return jobList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }
    }
}