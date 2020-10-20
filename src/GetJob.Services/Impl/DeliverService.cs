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
    public class DeliverService : IDeliverService
    {
        private readonly ILogger<DeliverService> _logger;
        private readonly GetJobDbContext _context;
        private readonly IJobService _jobService;
        private readonly IStudentService _studentService;

        public DeliverService(ILogger<DeliverService> logger, GetJobDbContext context, IJobService jobService, IStudentService studentService)
        {
            _logger = logger;
            _context = context;
            _jobService = jobService;
            _studentService = studentService;
        }

        public async Task<List<Deliver>> GetDeliverByJobId(string jobId)
        {
            try
            {
                var delivers = await _context.Delivers.Where(d => d.JobId == jobId).ToListAsync();
                foreach (var deliver in delivers)
                {
                    deliver.Job = await _jobService.GetByIdAsync(deliver.JobId);
                    deliver.ResumeSubmitted = await GetResumeSubmittedById(deliver.ResumeSubmittedId);
                    deliver.DeliverStatus = await _context.DeliverStatuses.FindAsync(deliver.DeliverStatusId);
                }
                return delivers;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<ResumeSubmitted> GetResumeSubmittedById(string id)
        {
            try
            {
                var resumeSubmitted = await _context.SubmittedResumes.FindAsync(id);
                resumeSubmitted.Student = await _studentService.GetByIdAsync(resumeSubmitted.StudentId);
                resumeSubmitted.ForJobKind = await _context.JobKinds.FindAsync(resumeSubmitted.ForJobKindId);
                resumeSubmitted.ForJobAddress = await _context.Locations.FindAsync(resumeSubmitted.ForJobAddressId);
                resumeSubmitted.ForJobCharacter = await _context.JobCharacters.FindAsync(resumeSubmitted.ForJobCharacterId);
                resumeSubmitted.ForJobPay = await _context.JobPays.FindAsync(resumeSubmitted.ForJobPayId);
                return resumeSubmitted;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }
    }
}