using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Services;
using GetJob.Web.ViewModels.Recruiter;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GetJob.Web.Controllers
{
    public class RecruiterController : Controller
    {
        private readonly IUserService _userService;

        public RecruiterController(IUserService userService)
        {
            _userService = userService;
        }
        [Authorize(Policy = "CompanyOnly")]
        public async Task<IActionResult> PersonalInfo()
        {
            var user = await _userService.GetByUserNameAsync(User.Identity.Name);
            var vm = new UserInfoViewModel(user);
            return View(vm);
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
