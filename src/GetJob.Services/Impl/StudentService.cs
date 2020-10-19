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


    }
}