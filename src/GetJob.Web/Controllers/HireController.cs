using System;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;
using GetJob.Services;
using GetJob.Web.ViewModels.Company;
using GetJob.Web.ViewModels.Hire;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity.UI.V3.Pages.Internal.Account;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore.Query;
using Microsoft.Extensions.Logging;

namespace GetJob.Web.Controllers
{
    public class HireController : Controller
    {
        private readonly ICompanyService _companyService;
        private readonly IJobService _jobService;
        private readonly ILocationService _locationService;
        private readonly IDegreeService _degreeService;
        private readonly IDeliverService _deliverService;
        private readonly ILogger<HireController> _logger;

        public HireController(ILogger<HireController> logger, ICompanyService companyService, IJobService jobService,
            ILocationService locationService, IDegreeService degreeService, IDeliverService deliverService)
        {
            _logger = logger;
            _companyService = companyService;
            _jobService = jobService;
            _locationService = locationService;
            _degreeService = degreeService;
            _deliverService = deliverService;
        }

        #region 公司部分
        [Authorize(Policy = "CompanyOnly")]
        public async Task PopulateJobStatusesDropDownList(string selectedJobStatus = null)
        {
            var jobStatuses = await _jobService.GetAllJobStatusAsync();
            ViewBag.JobStatuses = new SelectList(jobStatuses, "JobStatusId", "Text", selectedJobStatus);
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireJobManage(string searchString, string selectedJobStatus)
        {
            var company = await _companyService.GetByIdAsync(User.FindFirst("CompanyId").Value);
            var jobList = await _jobService.GetByCompanyAsync(company);
            if (!string.IsNullOrEmpty(searchString))
                jobList = jobList.Where(j =>
                        j.Name.Contains(searchString) || j.Company.Name.Contains(searchString) ||
                        j.Description.Contains(searchString))
                    .ToList();
            if (!string.IsNullOrEmpty(selectedJobStatus))
            {
                jobList = jobList.Where(j => j.JobStatus.JobStatusId == int.Parse(selectedJobStatus)).ToList();
            }
            var vm = new JobListViewModel();
            foreach (var job in jobList) vm.JobViewModels.Add(new JobViewModel(job));
            ViewBag.SearchString = searchString;
            await PopulateJobStatusesDropDownList(selectedJobStatus);
            return View(vm);
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<ActionResult> PopulateSecondKinds(int firstKindId)
        {
            var jobSecondKind = await _jobService.GetAllSecondKindAsync(firstKindId);
            return Json(jobSecondKind);
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<ActionResult> PopulateCities(int provinceId)
        {
            var cities = await _locationService.GetCityAsync(provinceId);
            return Json(cities);
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<ActionResult> PopulateDistricts(int cityId)
        {
            var districts = await _locationService.GetDistrictAsync(cityId);
            return Json(districts);
        }

        private async Task PopulateJobRelatedDropDownList(string selectedJobCharacterId = null,
            string selectedJobFirstKindId = null, string selectedJobKindId = null, string selectedJobPayId = null,
            string selectedJobStatusId = null, string selectedProvinceId = null, string selectedCityId = null,
            string selectedDistrictId = null, string selectedDegreeId = null)
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

            var provinces = await _locationService.GetProvinceAsync();
            ViewBag.Provinces = new SelectList(provinces, "LocationId", "Text", selectedProvinceId);

            if (selectedProvinceId != null)
            {
                var cities = await _locationService.GetCityAsync(int.Parse(selectedProvinceId));
                ViewBag.Cities = new SelectList(cities, "LocationId", "Text", selectedCityId);
            }

            if (selectedCityId != null)
            {
                var districts = await _locationService.GetDistrictAsync(int.Parse(selectedCityId));
                ViewBag.Districts = new SelectList(districts, "LocationId", "Text", selectedDistrictId);
            }

            var degrees = await _degreeService.GetAllAsync();
            ViewBag.Degrees = new SelectList(degrees, "DegreeId", "Text", selectedDistrictId);
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
                    LocationId = vm.LocationId,
                    DegreeId = vm.DegreeId,
                    RecruitNumber = vm.RecruitNumber,
                    Description = vm.Description,
                    LastModify = DateTime.Now
                };
                await _jobService.AddJobAsync(job);
                return RedirectToAction(nameof(HireJobManage));
            }

            await PopulateJobRelatedDropDownList(vm.JobCharacterId.ToString(), vm.JobFirstKindId.ToString(),
                vm.JobKindId.ToString(), vm.JobPayId.ToString(), vm.JobStatusId.ToString(), vm.ProvinceId.ToString(),
                vm.CityId.ToString(), vm.LocationId.ToString(), vm.DegreeId.ToString());
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
                vm.JobKindId.ToString(), vm.JobPayId.ToString(), vm.JobStatusId.ToString(), vm.ProvinceId.ToString(),
                vm.CityId.ToString(), vm.LocationId.ToString(), vm.DegreeId.ToString());
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
                    LocationId = vm.LocationId,
                    DegreeId = vm.DegreeId,
                    RecruitNumber = vm.RecruitNumber,
                    Description = vm.Description,
                    LastModify = DateTime.Now
                };
                await _jobService.UpdateAsync(job);
                return RedirectToAction(nameof(HireJobManage));
            }

            await PopulateJobRelatedDropDownList(vm.JobCharacterId.ToString(), vm.JobFirstKindId.ToString(),
                vm.JobKindId.ToString(), vm.JobPayId.ToString(), vm.JobStatusId.ToString(), vm.ProvinceId.ToString(),
                vm.CityId.ToString(), vm.LocationId.ToString(), vm.DegreeId.ToString());
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
                foreach (var model in vm.JobViewModels.Where(model => model.Selected))
                {
                    var job = await _jobService.GetByIdAsync(model.Id);
                    await _jobService.DeleteJobAsync(job);
                }

            return RedirectToAction(nameof(HireJobManage));
        }

        [Authorize(Policy = "CompanyOnly")]
        public IActionResult HireHistory()
        {
            return View();
        }

        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireResumeList(string selectedJobStatus)
        {
            var company = await _companyService.GetByIdAsync(User.FindFirst("CompanyId").Value);
            var jobList = await _jobService.GetByCompanyAsync(company);
            if (!string.IsNullOrEmpty(selectedJobStatus))
            {
                jobList = jobList.Where(j => j.JobStatus.JobStatusId == int.Parse(selectedJobStatus)).ToList();
            }
            var vm = new ResumeReviewViewModel();
            foreach (var job in jobList)
            {
                vm.JobViewModels.Add(new JobViewModel(job));
                var deliverListViewModel = new DeliverListViewModel(job.Id);
                var delivers = await _deliverService.GetDeliverByJobId(job.Id);
                foreach (var deliver in delivers)
                {
                    deliverListViewModel.DeliverViewModels.Add(new DeliverViewModel(deliver));
                }
                vm.DeliverListViewModels.Add(deliverListViewModel);
            }
            await PopulateJobStatusesDropDownList(selectedJobStatus);
            return View(vm);
        }
        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireResumeReview(string id = null)
        {
            if (id == null) return NotFound();
            var resume = await _deliverService.GetResumeSubmittedById(id);
            if (resume == null) return NotFound();
            var vm = new ResumeSubmittedViewModel(resume);
            return View(vm);
        }

        #endregion
    }
}