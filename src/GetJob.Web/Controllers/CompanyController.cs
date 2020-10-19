using System;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;
using GetJob.Services;
using GetJob.Web.ViewModels.Company;
using GetJob.Web.ViewModels.User;
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
        private readonly IJobService _jobService;
        private readonly ILogger<CompanyController> _logger;
        private readonly IUserService _userService;


        public CompanyController(ILogger<CompanyController> logger, IUserService userService,
            ICompanyService companyService, IJobService jobService)
        {
            _logger = logger;
            _userService = userService;
            _companyService = companyService;
            _jobService = jobService;
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireJobManage(string searchString)
        {
            var company = await _companyService.GetByIdAsync(User.FindFirst("CompanyId").Value);
            var jobList = await _jobService.GetByCompanyAsync(company);
            if (!string.IsNullOrEmpty(searchString))
                jobList = jobList.Where(j =>
                        j.Name.Contains(searchString) || j.Company.Name.Contains(searchString) ||
                        j.Description.Contains(searchString))
                    .ToList();
            var vm = new JobListViewModel();
            foreach (var job in jobList) vm.JobViewModels.Add(new JobViewModel(job));
            ViewBag.SearchString = searchString;
            return View(vm);
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<ActionResult> PopulateSecondKinds(int firstKindId)
        {
            var jobSecondKind = await _jobService.GetAllSecondKindAsync(firstKindId);
            return Json(jobSecondKind);
        }

        private async Task PopulateJobRelatedDropDownList(string selectedJobCharacterId = null,
            string selectedJobFirstKindId = null, string selectedJobKindId = null, string selectedJobPayId = null,
            string selectedJobStatusId = null)
        {
            var jobCharacters = await _jobService.GetAllJobCharacterAsync();
            ViewBag.JobCharacters = new SelectList(jobCharacters, "JobCharacterId", "Text", selectedJobCharacterId);

            var jobFirstKinds = await _jobService.GetAllFirstKindAsync();
            ViewBag.JobFirstKinds = new SelectList(jobFirstKinds, "JobKindId", "Text", selectedJobFirstKindId);
            if (selectedJobFirstKindId != null)
            {
                var jobKinds = await _jobService.GetAllSecondKindAsync(int.Parse(selectedJobFirstKindId));
                ViewBag.JobKinds = new SelectList(jobKinds, "JobKindId", "Text", selectedJobKindId);
            }

            var jobPays = await _jobService.GetAllJobPayAsync();
            ViewBag.JobPays = new SelectList(jobPays, "JobPayId", "Text", selectedJobPayId);

            var jobStatuses = await _jobService.GetAllJobStatusAsync();
            ViewBag.JobStatuses = new SelectList(jobStatuses, "JobStatusId", "Text", selectedJobStatusId);
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireJobPublish()
        {
            await PopulateJobRelatedDropDownList();
            return View();
        }

        [HttpPost]
        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireJobPublish(JobViewModel vm)
        {
            if (ModelState.IsValid)
            {
                var job = new Job
                {
                    Name = vm.Name,
                    CompanyId = vm.CompanyId,
                    JobCharacterId = vm.JobCharacterId,
                    JobKindId = vm.JobKindId,
                    JobPayId = vm.JobPayId,
                    JobStatusId = vm.JobStatusId,
                    Description = vm.Description,
                    LastModify = DateTime.Now
                };
                await _jobService.AddJobAsync(job);
                return RedirectToAction(nameof(HireJobManage));
            }

            await PopulateJobRelatedDropDownList(vm.JobCharacterId.ToString(), vm.JobFirstKindId.ToString(),
                vm.JobKindId.ToString(), vm.JobPayId.ToString(), vm.JobStatusId.ToString());
            return View(vm);
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireJobEdit(string id = null)
        {
            if (id == null) return NotFound();
            var job = await _jobService.GetByIdAsync(id);
            if (job == null) return NotFound();
            var vm = new JobViewModel(job);
            await PopulateJobRelatedDropDownList(vm.JobCharacterId.ToString(), vm.JobFirstKindId.ToString(),
                vm.JobKindId.ToString(), vm.JobPayId.ToString(), vm.JobStatusId.ToString());
            return View(vm);
        }

        [HttpPost]
        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireJobEdit(JobViewModel vm)
        {
            if (ModelState.IsValid)
            {
                var job = new Job
                {
                    Id = vm.Id,
                    Name = vm.Name,
                    CompanyId = vm.CompanyId,
                    JobCharacterId = vm.JobCharacterId,
                    JobKindId = vm.JobKindId,
                    JobPayId = vm.JobPayId,
                    JobStatusId = vm.JobStatusId,
                    Description = vm.Description,
                    LastModify = DateTime.Now
                };
                await _jobService.UpdateAsync(job);
                return RedirectToAction(nameof(HireJobManage));
            }

            await PopulateJobRelatedDropDownList(vm.JobCharacterId.ToString(), vm.JobFirstKindId.ToString(),
                vm.JobKindId.ToString(), vm.JobPayId.ToString(), vm.JobStatusId.ToString());
            return View(vm);
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireJobDelete(string id = null)
        {
            if (id == null) return NotFound();

            var job = await _jobService.GetByIdAsync(id);
            await _jobService.DeleteJobAsync(job);
            return RedirectToAction(nameof(HireJobManage));
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireJobDeleteSelected(JobListViewModel vm)
        {
            if (ModelState.IsValid)
                foreach (var model in vm.JobViewModels)
                    if (model.Selected)
                    {
                        var job = await _jobService.GetByIdAsync(model.Id);
                        await _jobService.DeleteJobAsync(job);
                    }

            return RedirectToAction(nameof(HireJobManage));
        }

        private async Task PopulateCompanyFieldsDropDownList(string selectedCompanyFieldId = null)
        {
            var companyFields = await _companyService.GetAllCompanyFieldAsync();
            ViewBag.CompanyFields = new SelectList(companyFields, "CompanyFieldId", "Text", selectedCompanyFieldId);
        }

        public async Task<IActionResult> SignUp()
        {
            await PopulateCompanyFieldsDropDownList();
            return View();
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
                        return RedirectToAction("SignIn", "Home");
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