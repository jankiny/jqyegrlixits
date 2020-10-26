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

        public async Task<List<JobCharacter>> GetAllJobCharacterAsync()
        {
            try
            {
                return await _context.JobCharacters.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<JobKind>> GetAllFirstKindAsync()
        {
            try
            {
                return await _context.JobKinds.Where(k => k.JobKindId % 10000 == 0).ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<JobKind>> GetAllSecondKindAsync(int firstKindId)
        {
            try
            {
                var maxId = firstKindId + 9999;
                return await _context.JobKinds.Where(k => k.JobKindId > firstKindId && k.JobKindId <= maxId).ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<JobPay>> GetAllJobPayAsync()
        {
            try
            {
                return await _context.JobPays.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<JobStatus>> GetAllJobStatusAsync()
        {
            try
            {
                return await _context.JobStatuses.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<int> AddJobAsync(Job model)
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

        public async Task<Job> GetByIdAsync(string id)
        {
            try
            {
                var job = await _context.Jobs.FindAsync(id);
                job.Company = await _context.Companies.FindAsync(job.CompanyId);
                job.JobCharacter = await _context.JobCharacters.FindAsync(job.JobCharacterId);
                job.JobKind = await _context.JobKinds.FindAsync(job.JobKindId);
                job.JobPay = await _context.JobPays.FindAsync(job.JobPayId);
                job.JobStatus = await _context.JobStatuses.FindAsync(job.JobStatusId);
                job.Location = await _context.Locations.FindAsync(job.LocationId);
                job.Degree = await _context.Degrees.FindAsync(job.DegreeId);
                return job;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Job>> GetByCompanyAsync(Company model)
        {
            try
            {
                var jobList = await _context.Jobs.Where(j => j.CompanyId == model.Id).OrderBy(j => j.LastModify).ToListAsync();
                foreach (var job in jobList)
                {
                    job.Company = await _context.Companies.FindAsync(model.Id);
                    job.JobCharacter = await _context.JobCharacters.FindAsync(job.JobCharacterId);
                    job.JobKind = await _context.JobKinds.FindAsync(job.JobKindId);
                    job.JobPay = await _context.JobPays.FindAsync(job.JobPayId);
                    job.JobStatus = await _context.JobStatuses.FindAsync(job.JobStatusId);
                    job.Location = await _context.Locations.FindAsync(job.LocationId);
                    job.Degree = await _context.Degrees.FindAsync(job.DegreeId);
                }

                return jobList;
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
                var jobList = await _context.Jobs.Where(j => j.JobCharacterId == model.JobCharacterId).ToListAsync();
                foreach (var job in jobList)
                {
                    job.Company = await _context.Companies.FindAsync(job.CompanyId);
                    job.JobCharacter = model;
                    job.JobKind = await _context.JobKinds.FindAsync(job.JobKindId);
                    job.JobPay = await _context.JobPays.FindAsync(job.JobPayId);
                    job.JobStatus = await _context.JobStatuses.FindAsync(job.JobStatusId);
                    job.Location = await _context.Locations.FindAsync(job.LocationId);
                    job.Degree = await _context.Degrees.FindAsync(job.DegreeId);
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
                var jobList = await _context.Jobs.Where(j => j.JobKindId == model.JobKindId).ToListAsync();
                foreach (var job in jobList)
                {
                    job.Company = await _context.Companies.FindAsync(job.CompanyId);
                    job.JobCharacter = await _context.JobCharacters.FindAsync(job.JobCharacterId);
                    job.JobKind = model;
                    job.JobPay = await _context.JobPays.FindAsync(job.JobPayId);
                    job.JobStatus = await _context.JobStatuses.FindAsync(job.JobStatusId);
                    job.Location = await _context.Locations.FindAsync(job.LocationId);
                    job.Degree = await _context.Degrees.FindAsync(job.DegreeId);
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
                var jobList = await _context.Jobs.Where(j => j.JobPayId == model.JobPayId).ToListAsync();
                foreach (var job in jobList)
                {
                    job.Company = await _context.Companies.FindAsync(job.CompanyId);
                    job.JobCharacter = await _context.JobCharacters.FindAsync(job.JobCharacterId);
                    job.JobKind = await _context.JobKinds.FindAsync(job.JobKindId);
                    job.JobPay = model;
                    job.JobStatus = await _context.JobStatuses.FindAsync(job.JobStatusId);
                    job.Location = await _context.Locations.FindAsync(job.LocationId);
                    job.Degree = await _context.Degrees.FindAsync(job.DegreeId);
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
                    job.Company = await _context.Companies.FindAsync(job.CompanyId);
                    job.JobCharacter = await _context.JobCharacters.FindAsync(job.JobCharacterId);
                    job.JobKind = await _context.JobKinds.FindAsync(job.JobKindId);
                    job.JobPay = await _context.JobPays.FindAsync(job.JobPayId);
                    job.JobStatus = await _context.JobStatuses.FindAsync(job.JobStatusId);
                    job.Location = await _context.Locations.FindAsync(job.LocationId);
                    job.Degree = await _context.Degrees.FindAsync(job.DegreeId);
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