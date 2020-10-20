using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;
using GetJob.Services;
using GetJob.Web.ViewModels;
using GetJob.Web.ViewModels.Home;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace GetJob.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IUserService _userService;
        private readonly ILogger<HomeController> _logger;

        public HomeController(IUserService userService, ILogger<HomeController> logger)
        {
            _userService = userService;
            _logger = logger;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult SignIn()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> SignIn(UserSignInViewModel vm)
        {
            if (!ModelState.IsValid) return View(vm);
            var result = await _userService.PasswordSignInAsync(vm.UserName, vm.Password);
            if (result.Succeeded)
            {
                _logger.LogInformation("用户登录成功");
                var identity = await _userService.GetUserClaim(vm.UserName);
                if (identity is Company company)
                {
                    _logger.LogInformation($"用户身份是{company.Name}");
                    return RedirectToAction("PersonalInfo", "Recruiter");
                }
                else if (identity is Student student)
                {
                    _logger.LogInformation($"用户身份是{student.Id}");
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    _logger.LogError("未找到用户身份");
                    ModelState.AddModelError("", "用户身份非法");
                    await _userService.SignOutAsync();
                    return View();
                }
            }
            ModelState.AddModelError("", "用户名/密码不正确");
            return View();
        }
        public async Task<IActionResult> Logout(string returnUrl = null)
        {
            await _userService.SignOutAsync();
            _logger.LogInformation("Company logged out.");
            if (returnUrl != null)
                return LocalRedirect(returnUrl);
            return RedirectToAction("Index", "Home");
        }
    }
}
