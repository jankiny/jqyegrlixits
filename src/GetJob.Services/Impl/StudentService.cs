using System;
using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;

namespace GetJob.Services.Impl
{
    public class StudentService : IStudentService
    {
        private readonly ILogger<StudentService> _logger;

        public StudentService( ILogger<StudentService> logger)
        {
            _logger = logger;
        }

    }
}