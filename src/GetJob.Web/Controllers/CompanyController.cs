using System;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;
using GetJob.Services;
using GetJob.Web.ViewModels.Company;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Logging;

namespace GetJob.Web.Controllers
{
    public class CompanyController : Controller
    {
        private readonly ICompanyService _companyService;
        private readonly ILogger<CompanyController> _logger;
        private readonly IUserService _userService;


        public CompanyController(ILogger<CompanyController> logger, IUserService userService,
            ICompanyService companyService)
        {
            _logger = logger;
            _userService = userService;
            _companyService = companyService;
        }

        private async Task PopulateCompanyRelatedDropDownList(string selectedCompanyFieldId = null,
            string selectedCompanyScaleId = null)
        {
            var companyFields = await _companyService.GetAllCompanyFieldAsync();
            ViewBag.CompanyFields = new SelectList(companyFields, "CompanyFieldId", "Text", selectedCompanyFieldId);

            var companyScales = await _companyService.GetAllCompanyScaleAsync();
            ViewBag.CompanyScales = new SelectList(companyScales, "CompanyScaleId", "Text", selectedCompanyScaleId);
        }

        public async Task<IActionResult> CompanyInfo()
        {
            var company = await _companyService.GetByIdAsync(User.FindFirst("CompanyId").Value);
            var vm = new CompanyInfoViewModel(company);
            await PopulateCompanyRelatedDropDownList();
            return View(vm);
        }

        [HttpPost]
        public async Task<IActionResult> CompanyInfoEdit(CompanyInfoViewModel vm)
        {
            if (ModelState.IsValid)
            {
                var company = new Company
                {
                    Id = vm.Id,
                    Name = vm.Name,
                    CompanyFieldId = vm.CompanyFieldId,
                    CompanyScaleId = vm.CompanyScaleId,
                    Description = vm.Description
                };
                await _companyService.UpdateAsync(company);
                await PopulateCompanyRelatedDropDownList();
                return View(nameof(CompanyInfo), vm);
            }
            await PopulateCompanyRelatedDropDownList(vm.CompanyFieldId.ToString(), vm.CompanyScaleId.ToString());
            return View(nameof(CompanyInfo), vm);
        }

        public async Task<IActionResult> SignUp()
        {
            await PopulateCompanyRelatedDropDownList();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SignUp(CompanySignUpViewModel vm)
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
                    CompanyFieldId = vm.CompanyFieldId,
                    CompanyScaleId = vm.CompanyScaleId
                };
                if (await _companyService.AddAsync(company) != -1)
                {
                    var result = await _userService.CreateUserAsync(user, vm.Password, company);

                    if (result.Succeeded)
                    {
                        _logger.LogInformation($"{vm.PhoneNumber} created a new account with password.");
                        return RedirectToAction("SignIn", "Home");
                    }
                }
            }

            _logger.LogInformation("Failed to create a new account.");
            ModelState.AddModelError("", "错误信息");
            await PopulateCompanyRelatedDropDownList(vm.CompanyFieldId.ToString(), vm.CompanyScaleId.ToString());
            return RedirectToAction("SignUp", "Company", vm);
        }
    }
}