using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Services;
using GetJob.Web.Helper;
using GetJob.Web.ViewModels.Recruiter;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GetJob.Web.Controllers
{
    public class RecruiterController : Controller
    {
        private readonly IUserService _userService;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public RecruiterController(IUserService userService, IWebHostEnvironment webHostEnvironment)
        {
            _userService = userService;
            _webHostEnvironment = webHostEnvironment;
        }
        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> PersonalInfo()
        {
            var user = await _userService.GetByUserNameAsync(User.Identity.Name);
            var vm = new UserInfoViewModel(user)
            {
                HeaderUrl = await _userService.GetUserClaimAsync(user.UserName, "HeaderUrl")
            };
            return View(vm);
        }
        [HttpPost, Authorize(Policy = "CompanyOnly")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> PersonalInfoChangeHeader(UserInfoViewModel vm, IFormFile headerFile)
        {
            if (ModelState.IsValid)
            {
                var user = await _userService.GetByUserNameAsync(User.Identity.Name);
                var fileName = await FileHelper.UploadFileAsync(headerFile, _webHostEnvironment.WebRootPath + @$"\upload\header\");
                vm.HeaderUrl = @"\upload\header\" + fileName;
                await _userService.UpdateUserClaimAsync(user.UserName, "HeaderUrl", vm.HeaderUrl);
                return RedirectToAction(nameof(PersonalInfo), vm);
            }
            ModelState.AddModelError("", "未知错误");
            return RedirectToAction(nameof(PersonalInfo));
        }
        [Authorize(Policy = "CompanyOnly")]
        public IActionResult RecruiterInfo()
        {
            return View();
        }
        [Authorize(Policy = "CompanyOnly")]
        public IActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost, Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> ChangePassword(ChangePasswordViewModel vm)
        {
            var result = await _userService.ChangePassword(User.Identity.Name, vm.OldPassword, vm.NewPassword);
            if (result.Succeeded)
            {
                return View("_PasswordChangeSuccess");
            }
            ModelState.AddModelError("PasswordError", "密码错误");
            return View(vm);
        }
        [HttpPost, Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> ChangeEmail(string emailAddress)
        {
            var user = await _userService.GetByUserNameAsync(User.Identity.Name);
            user.Email = emailAddress;
            return Json(await _userService.UpdateAsync(user));
        }
        [HttpPost, Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> ChangePhoneNumber(string phoneNumber)
        {
            var user = await _userService.GetByUserNameAsync(User.Identity.Name);
            user.PhoneNumber = phoneNumber;
            return Json(await _userService.UpdateAsync(user));
        }
    }
}
