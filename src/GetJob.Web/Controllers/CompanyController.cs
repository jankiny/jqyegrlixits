using System.Threading.Tasks;
using GetJob.Models;
using GetJob.Services;
using GetJob.Web.ViewModels.Company;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace GetJob.Web.Controllers
{
    public class CompanyController : Controller
    {
        private readonly ICompanyService _companyService;
        private readonly ILogger<CompanyController> _logger;

        public CompanyController(ILogger<CompanyController> logger, ICompanyService companyService)
        {
            _logger = logger;
            _companyService = companyService;
        }

        public IActionResult Home()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SignIn(CompanySignInViewModel vm, string returnUrl = null)
        {
            if (!ModelState.IsValid) return RedirectToAction("SignIn", "User", vm);
            var result = await _companyService.PasswordSignInAsync(vm.UserName, vm.Password);
            if (result.Succeeded)
            {
                _logger.LogInformation($"{vm.UserName} logged in.");
                if (returnUrl != null) return LocalRedirect(returnUrl);

                return RedirectToAction("Home", "Company");
            }

            ModelState.AddModelError("", "用户名/密码不正确");
            return RedirectToAction("SignIn", "User");
        }

        [HttpPost]
        public async Task<IActionResult> SignUp(CompanySignUpViewModel vm, string returnUrl = null)
        {
            if (ModelState.IsValid)
            {
                var company = new Company
                {
                    PhoneNumber = vm.PhoneNumber,
                    UserName = vm.UserName,
                    Email = vm.Mail,
                    EmailConfirmed = true,
                    CompanyFieldId = vm.CompanyFieldId
                };
                var result = await _companyService.CreateCompanyAsync(company, vm.Password);
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
            await _companyService.SignOutAsync();
            _logger.LogInformation("Company logged out.");
            if (returnUrl != null)
                return LocalRedirect(returnUrl);
            return RedirectToAction("SignIn", "User");
        }
    }
}