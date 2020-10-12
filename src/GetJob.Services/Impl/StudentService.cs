using System;
using System.Threading.Tasks;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;

namespace GetJob.Services.Impl
{
    public class StudentService : IStudentService
    {
        private readonly UserManager<Student> _userManager;
        private readonly SignInManager<Student> _signInManager;
        private readonly ILogger<StudentService> _logger;

        public StudentService( ILogger<StudentService> logger, UserManager<Student> userManager, SignInManager<Student> signInManager)
        {
            _logger = logger;
            _userManager = userManager;
            _signInManager = signInManager;
        }

        public async Task<IdentityResult> CreateStudentAsync(Student user, string plainPassword)
        {
            try
            {
                return await _userManager.CreateAsync(user, plainPassword);
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return IdentityResult.Failed();
            }
        }

        public async Task<SignInResult> PasswordSignInAsync(string userName, string password)
        {
            try
            {
                var user = await _userManager.FindByNameAsync(userName);
                return await _signInManager.PasswordSignInAsync(user, password, false, false);
            }
            catch(Exception e)
            {
                _logger.LogError(e.Message);
                return SignInResult.Failed;
            }
        }

        public async Task SignOutAsync()
        {
            await _signInManager.SignOutAsync();
        }
    }
}