﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;
using GetJob.Services;
using GetJob.Web.ViewModels;
using GetJob.Web.ViewModels.User;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace GetJob.Web.Controllers
{
    public class UserController : Controller
    {
        private readonly IUserService _userService;
        private readonly ILogger<UserController> _logger;

        public UserController(IUserService userService, ILogger<UserController> logger)
        {
            _userService = userService;
            _logger = logger;
        }
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
                    return RedirectToAction("Home", "Company");
                }
                else if (identity is Student student)
                {
                    _logger.LogInformation($"用户身份是{student.StudentId}");
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    _logger.LogError("未找到用户身份");
                    return NotFound();
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
            return RedirectToAction("SignIn", "User");
        }
    }
}
