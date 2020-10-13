using System;
using System.Threading.Tasks;
using GetJob.Models;
using GetJob.Services;
using GetJob.Web.ViewModels.Company;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.Logging;

namespace GetJob.Web.Controllers
{
    public class CompanyController : Controller
    {
        private readonly IUserService _userService;
        private readonly ILogger<CompanyController> _logger;

        public CompanyController(ILogger<CompanyController> logger, IUserService userService)
        {
            _logger = logger;
            _userService = userService;
        }

        public IActionResult Home()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SignIn(UserSignInViewModel vm, string returnUrl = null)
        {
            if (!ModelState.IsValid) return RedirectToAction("SignIn", "User", vm);
            var result = await _userService.PasswordSignInAsync(vm.UserName, vm.Password);
            if (result.Succeeded)
            {
                _logger.LogInformation($"{vm.UserName} logged in.");
                if (returnUrl != null) return LocalRedirect(returnUrl);
                var identity = await _userService.GetUserClaim(vm.UserName);
                if (identity is Company)
                {
                    return RedirectToAction("Home", "Company");
                }
                else
                {
                    return RedirectToAction("Home", "Student");
                }
            }

            ModelState.AddModelError("", "用户名/密码不正确");
            return RedirectToAction("SignIn", "User");
        }

        [HttpPost]
        public async Task<IActionResult> SignUp(CompanySignUpViewModel vm, string returnUrl = null)
        {
            if (ModelState.IsValid)
            {
                var user = new IdentityUser
                {
                    PhoneNumber = vm.PhoneNumber,
                    UserName = vm.UserName,
                    Email = vm.Mail,
                    EmailConfirmed = true
                };
                var company = new Company
                {
                    Name = vm.CompanyName,
                    CompanyFieldId = vm.CompanyFieldId
                };
                var result = await _userService.CreateUserAsync(user, vm.Password, company);
                if (result.Succeeded)
                {
                    _logger.LogInformation($"{vm.PhoneNumber} created a new account with password.");
                    return View("_SignUpSuccess");
                }
            }

            _logger.LogInformation("Failed to create a new account.");
            ModelState.AddModelError("", "错误信息");
            return RedirectToAction("SignUp", "User", vm);
        }
        public async Task<IActionResult> Logout(string returnUrl = null)
        {
            await _userService.SignOutAsync();
            _logger.LogInformation("Company logged out.");
            if (returnUrl != null)
                return LocalRedirect(returnUrl);
            return RedirectToAction("SignIn", "User");
        }
    }
}