using System;
using System.Threading.Tasks;
using GetJob.Models;
using GetJob.Services;
using GetJob.Web.ViewModels;
using GetJob.Web.ViewModels.Company;
using GetJob.Web.ViewModels.User;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.Logging;

namespace GetJob.Web.Controllers
{
    public class CompanyController : Controller
    {
        private readonly IUserService _userService;
        private readonly ICompanyService _companyService;
        private readonly ILogger<CompanyController> _logger;

        public CompanyController(ILogger<CompanyController> logger, IUserService userService, ICompanyService companyService)
        {
            _logger = logger;
            _userService = userService;
            _companyService = companyService;
        }

        public IActionResult Home()
        {
            return View();
        }
        public async Task<IActionResult> SignUp()
        {
            await PopulateCompanyFieldsDropDownList();
            return View();
        }

        private async Task PopulateCompanyFieldsDropDownList(string selectedCompanyFieldId = null)
        {
            var companyFields = await _companyService.GetAllCompanyFieldAsync();
            ViewBag.CompanyFields = new SelectList(companyFields, "CompanyFieldId", "Text", selectedCompanyFieldId);
        }
        [HttpPost]
        public async Task<IActionResult> SignUp(UserSignUpViewModel vm)
        {
            if (ModelState.IsValid)
            {
                var user = new IdentityUser
                {
                    PhoneNumber = vm.Phone,
                    UserName = vm.UserName,
                    Email = vm.Mail,
                    EmailConfirmed = true
                };
                var company = new Company
                {
                    Name = vm.CompanyName,
                    CompanyFieldId = vm.CompanyFieldId
                };
                if (await _companyService.AddAsync(company) != -1)
                {
                    var result = await _userService.CreateUserAsync(user, vm.Password, company);

                    if (result.Succeeded)
                    {
                        _logger.LogInformation($"{vm.Phone} created a new account with password.");
                        return RedirectToAction("SignIn", "User");
                    }
                }
            }
            _logger.LogInformation("Failed to create a new account.");
            ModelState.AddModelError("", "错误信息");
            await PopulateCompanyFieldsDropDownList(vm.CompanyFieldId.ToString());
            return RedirectToAction("SignUp", "Company", vm);
        }
    }
}