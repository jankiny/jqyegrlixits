using System;
using System.Threading.Tasks;
using GetJob.Data;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;

namespace GetJob.Services.Impl
{
    public class StudentService : IStudentService
    {
        private readonly ILogger<StudentService> _logger;
        private readonly GetJobDbContext _context;

        public StudentService(ILogger<StudentService> logger, GetJobDbContext context)
        {
            _logger = logger;
            _context = context;
        }


        public async Task<Student> GetByIdAsync(string id)
        {
            try
            {
                var student = await _context.Students.FindAsync(id);
                student.BirthPlace = await _context.Locations.FindAsync(student.BirthPlaceId);
                student.Nation = await _context.Nations.FindAsync(student.NationId);
                student.PoliticalOutlook = await _context.PoliticalOutlooks.FindAsync(student.PoliticalOutlookId);
                student.Degree = await _context.Degrees.FindAsync(student.DegreeId);
                return student;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }
    }
}