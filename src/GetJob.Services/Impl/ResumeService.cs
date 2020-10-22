using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using GetJob.Data;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;
using System.Runtime.InteropServices;

namespace GetJob.Services.Impl
{
    public class ResumeService : IResumeService
    {
        private readonly ILogger<ResumeService> _logger;
        private readonly GetJobDbContext _context;

        public ResumeService(ILogger<ResumeService> logger, GetJobDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<int> AddResumeAsync(Resume model)
        {
            try
            {
                await _context.Resumes.AddAsync(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<int> DeleteResumeAsync(Resume model)
        {
            try
            {
                _context.Resumes.Remove(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<List<Resume>> GetAllAsync()
        {
            try
            {
                var resumeList = await _context.Resumes.ToListAsync();
                foreach (var resume in resumeList)
                {
                    resume.Student = await _context.Students.FindAsync(resume.StudentId);
                    resume.ForJobCharacter = await _context.JobCharacters.FindAsync(resume.ForJobCharacterId);
                    resume.ForJobKind = await _context.JobKinds.FindAsync(resume.ForJobKindId);
                    resume.ForJobPay = await _context.JobPays.FindAsync(resume.ForJobPayId);
                    resume.ForJobAddress = await _context.Locations.FindAsync(resume.ForJobAddressId);
                }

                return resumeList;
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

        public async Task<List<Location>> GetAllForJobAddressAsync()
        {
            try
            {
                return await _context.Locations.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<JobCharacter>> GetAllForJobCharacterAsync()
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

        public async Task<List<JobPay>> GetAllForJobPayAsync()
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
      

        public async Task<List<Resume>> GetByForJobCharacterAsync(JobCharacter model)
        {
            try
            {
                var resumeList = await _context.Resumes.Where(j => j.ForJobCharacterId == model.JobCharacterId).ToListAsync();
                foreach (var resume in resumeList)
                {
                    resume.Student = await _context.Students.FindAsync(resume.StudentId);
                    resume.ForJobCharacter = model;
                    resume.ForJobKind = await _context.JobKinds.FindAsync(resume.ForJobKindId);
                    resume.ForJobPay = await _context.JobPays.FindAsync(resume.ForJobPayId);
                    resume.ForJobAddress = await _context.Locations.FindAsync(resume .ForJobAddressId);
                    
                }

                return resumeList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Resume>> GetByForJobKindAsync(JobKind model)
        {
            try
            {
                var resumeList = await _context.Resumes.Where(j => j.ForJobKindId == model.JobKindId).ToListAsync();
                foreach (var resume in resumeList)
                {
                    resume.Student = await _context.Students.FindAsync(resume.StudentId);
                    resume.ForJobCharacter = await _context.JobCharacters.FindAsync(resume.ForJobCharacterId) ;
                    resume.ForJobKind = model;
                    resume.ForJobPay = await _context.JobPays.FindAsync(resume.ForJobPayId);
                    resume.ForJobAddress = await _context.Locations.FindAsync(resume.ForJobAddressId);
                }

                return resumeList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Resume>> GetByForJobPayAsync(JobPay model)
        {
            try
            {
                var resumeList = await _context.Resumes.Where(j => j.ForJobPayId == model.JobPayId).ToListAsync();
                foreach (var resume in resumeList)
                {
                    resume.Student = await _context.Students.FindAsync(resume.StudentId);
                    resume.ForJobCharacter = await _context.JobCharacters.FindAsync(resume.ForJobCharacterId);
                    resume.ForJobKind = await _context.JobKinds.FindAsync(resume.ForJobKindId);
                    resume.ForJobPay = model;
                    resume.ForJobAddress = await _context.Locations.FindAsync(resume.ForJobAddressId);
                }

                return resumeList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<Resume> GetByIdAsync(string id)
        {
            try
            {
                var resume = await _context.Resumes.FindAsync(id);
                resume.Student = await _context.Students.FindAsync(resume.StudentId);
                resume.ForJobCharacter = await _context.JobCharacters.FindAsync(resume.ForJobCharacterId);
                resume.ForJobKind = await _context.JobKinds.FindAsync(resume.ForJobKindId);
                resume.ForJobPay = await _context.JobPays.FindAsync(resume.ForJobPayId);              
                resume.ForJobAddress = await _context.Locations.FindAsync(resume.ForJobAddressId);              
                return resume;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Resume>> GetByStudentAsync(Student model)
        {
            try
            {
                var resumeList = await _context.Resumes.Where(j => j.StudentId == model.Id).ToListAsync();
                foreach (var resume in resumeList)
                {
                    resume.Student = await _context.Students.FindAsync(resume.StudentId);
                    resume.ForJobCharacter = await _context.JobCharacters.FindAsync(resume.ForJobCharacterId);
                    resume.ForJobKind = await _context.JobKinds.FindAsync(resume.ForJobKindId);
                    resume.ForJobPay = await _context.JobPays.FindAsync(resume.ForJobPayId);
                    resume.ForJobAddress = await _context.Locations.FindAsync(resume.ForJobAddressId);
                }
                return resumeList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<int> UpdateAsync(Resume model)
        {
            try
            {
                _context.Resumes.Remove(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<List<Resume>> GetByForJobAddressAsync(Location model)
        {
            try
            {
                var resumeList = await _context.Resumes.Where(j => j.ForJobAddressId  == model.LocationId).ToListAsync();
                foreach (var resume in resumeList)
                {
                    resume.Student = await _context.Students.FindAsync(resume.StudentId);
                    resume.ForJobCharacter = await _context.JobCharacters.FindAsync(resume.ForJobCharacterId);
                    resume.ForJobKind = await _context.JobKinds.FindAsync(resume.ForJobKindId);
                    resume.ForJobPay = await _context.JobPays.FindAsync(resume.ForJobPayId);
                    resume.ForJobAddress = model;
                }
                return resumeList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }
    }
}
