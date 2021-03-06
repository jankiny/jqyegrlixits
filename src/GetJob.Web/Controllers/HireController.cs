﻿using System;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;
using GetJob.Services;
using GetJob.Web.ViewModels.Hire;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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
        /// <summary>
        /// 填充JobStatus下拉框
        /// </summary>
        /// <param name="selectedJobStatus">选择的JobStatusId</param>
        /// <returns></returns>
        [Authorize(Policy = "CompanyOnly")]
        private async Task PopulateJobStatusesDropDownList(string selectedJobStatus = null)
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
            // TODO：是否需要在进入时显示所有招聘（如果后期数据变多 显示全部 页面数据会很多）
            if (string.IsNullOrEmpty(selectedJobStatus))
            {
                jobList = jobList.Where(j => j.JobStatus.JobStatusId == 1).ToList();
            }
            else
            {
                jobList = jobList.Where(j => j.JobStatus.JobStatusId == int.Parse(selectedJobStatus)).ToList();
            }
            var vm = new JobListViewModel();
            foreach (var job in jobList) vm.JobViewModels.Add(new JobViewModel(job));
            ViewBag.SearchString = searchString;
            await PopulateJobStatusesDropDownList(selectedJobStatus);
            return View(vm);
        }
        /// <summary>
        /// 返回工作类别（第二级）Json数据
        /// </summary>
        /// <param name="firstKindId">工作类别（第一级）</param>
        /// <returns>工作类别（第二级）Json数据</returns>
        [Authorize(Policy = "CompanyOnly")]
        public async Task<ActionResult> PopulateSecondKinds(int firstKindId)
        {
            var jobSecondKind = await _jobService.GetAllSecondKindAsync(firstKindId);
            return Json(jobSecondKind);
        }
        /// <summary>
        /// 返回城市字典Json数据
        /// </summary>
        /// <param name="provinceId">省份代码</param>
        /// <returns>城市字典Json数据</returns>
        [Authorize(Policy = "CompanyOnly")]
        public async Task<ActionResult> PopulateCities(int provinceId)
        {
            var cities = await _locationService.GetCityAsync(provinceId);
            return Json(cities);
        }
        /// <summary>
        /// 返回地区字典Json数据
        /// </summary>
        /// <param name="cityId">城市代码</param>
        /// <returns>地区字典Json数据</returns>
        [Authorize(Policy = "CompanyOnly")]
        public async Task<ActionResult> PopulateDistricts(int cityId)
        {
            var districts = await _locationService.GetDistrictAsync(cityId);
            return Json(districts);
        }
        /// <summary>
        /// 填充Job相关下拉框
        /// </summary>
        /// <param name="selectedJobCharacterId">已选择的JobCharacterId</param>
        /// <param name="selectedJobFirstKindId">已选择的JobFirstKindId</param>
        /// <param name="selectedJobKindId">已选择的JobKindId</param>
        /// <param name="selectedJobPayId">已选择的JobPayId</param>
        /// <param name="selectedJobStatusId">已选择的JobStatusId</param>
        /// <param name="selectedProvinceId">已选择的ProvinceId</param>
        /// <param name="selectedCityId">已选择的CityId</param>
        /// <param name="selectedDistrictId">已选择的DistrictId</param>
        /// <param name="selectedDegreeId">已选择的DegreeId</param>
        /// <returns></returns>
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
            
            //TODO: 不不允许用户直接修改招聘状态，改成停止招聘按钮
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
        public async Task<IActionResult> HireResumeList(string selectedJobStatus)
        {
            var company = await _companyService.GetByIdAsync(User.FindFirst("CompanyId").Value);
            var jobList = await _jobService.GetByCompanyAsync(company);
            if (string.IsNullOrEmpty(selectedJobStatus))
            {
                jobList = jobList.Where(j => j.JobStatus.JobStatusId == 1).ToList();
            }
            else
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
        public async Task<IActionResult> HireHistory(string selectedJobStatus)
        {
            var company = await _companyService.GetByIdAsync(User.FindFirst("CompanyId").Value);
            var jobList = await _jobService.GetByCompanyAsync(company);
            if (string.IsNullOrEmpty(selectedJobStatus))
            {
                jobList = jobList.Where(j => j.JobStatus.JobStatusId == 1).ToList();
            }
            else
            {
                jobList = jobList.Where(j => j.JobStatus.JobStatusId == int.Parse(selectedJobStatus)).ToList();
            }
            var vm = new ResumeReviewViewModel();
            foreach (var job in jobList)
            {
                vm.JobViewModels.Add(new JobViewModel(job));
                var deliverListViewModel = new DeliverListViewModel(job.Id);
                var delivers = await _deliverService.GetDeliverByJobId(job.Id);
                delivers = delivers.Where(d => d.DeliverStatusId == 2).ToList();
                foreach (var deliver in delivers)
                {
                    deliverListViewModel.DeliverViewModels.Add(new DeliverViewModel(deliver));
                }
                vm.DeliverListViewModels.Add(deliverListViewModel);
            }
            await PopulateJobStatusesDropDownList(selectedJobStatus);
            return View(vm);
        }
        /// <summary>
        /// 填充提交表的下拉框数据
        /// </summary>
        /// <param name="selectedJobStatus">选择的JobStatusId</param>
        /// <returns></returns>
        [Authorize(Policy = "CompanyOnly")]
        private async Task PopulateDeliverDropDownList(string selectedJobStatus = null)
        {
            var jobStatuses = await _jobService.GetAllJobStatusAsync();
            ViewBag.JobStatuses = new SelectList(jobStatuses, "JobStatusId", "Text", selectedJobStatus);
        }
        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireResumeReview(string id = null)
        {
            if (id == null) return NotFound();
            var deliver = await _deliverService.GetDeliverById(id);
            if (deliver == null) return NotFound();
            var vm = new ResumeSubmittedViewModel(deliver);
            return View(vm);
        }
        [HttpPost, Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> HireResumeReview(ResumeSubmittedViewModel vm)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrEmpty(vm.Pass))
                {
                    _logger.LogError("HireResumeReview中提交了未知的ViewModel");
                    return View(vm);
                }
                var deliver = await _deliverService.GetDeliverById(vm.DeliverId);
                if (vm.Pass == "通过")
                {
                    deliver.DeliverStatusId = 2;
                    await _deliverService.UpdateAsync(deliver);

                    var notify = new InterviewNotify
                    {
                        DeliverId = vm.DeliverId,
                        Title = vm.NotifyTitle,
                        InterviewDate = vm.InterviewDate,
                        InterviewLocation = vm.InterviewLocation,
                        Note = vm.InterviewNote
                    };
                    await _deliverService.AddNotify(notify);
                }
                else
                {
                    deliver.DeliverStatusId = 3;
                    await _deliverService.UpdateAsync(deliver);
                }
                return RedirectToAction(nameof(HireResumeList));
            }
            return View(vm);
        }

        #endregion
    }
}