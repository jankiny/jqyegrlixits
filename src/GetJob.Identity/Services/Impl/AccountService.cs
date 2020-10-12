using System;
using System.Threading.Tasks;
using Identity.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;

namespace Identity.Services.Impl
{
    public class AccountService : IAccountService
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ILogger<AccountService> _logger;

        public AccountService( ILogger<AccountService> logger, RoleManager<IdentityRole> roleManager, UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            _logger = logger;
            _roleManager = roleManager;
            _userManager = userManager;
            _signInManager = signInManager;
        }

        public async Task<IdentityResult> CreateUserAsync(AppUser user, string plainPassword)
        {
            try
            {
                return await _userManager.CreateAsync(user, plainPassword);
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return IdentityResult.Failed();
            }
        }

        public async Task<SignInResult> PasswordSignInAsync(string userName, string password)
        {
            try
            {
                var user = await _userManager.FindByNameAsync(userName);
                return await _signInManager.PasswordSignInAsync(user, password, false, false);
            }
            catch(Exception e)
            {
                _logger.LogError(e.Message);
                return SignInResult.Failed;
            }
        }

        public async Task SignOutAsync()
        {
            await _signInManager.SignOutAsync();
        }

        public async Task SetRoleAsync(string userName, string role)
        {
            var oneRole = await _roleManager.FindByNameAsync(role);
            if (oneRole == null)
            {
                var result = await _roleManager.CreateAsync(new IdentityRole(role));
                if (!result.Succeeded)
                {
                    _logger.LogError($"Failed to Create role named {role}");
                }
            }
            var user = await _userManager.FindByNameAsync(userName);
            if (user != null)
            {
                var userRoles = await _userManager.GetRolesAsync(user);
                if (!userRoles.Contains(role))
                {
                    var result = await _userManager.AddToRoleAsync(user, role);
                    if (!result.Succeeded)
                    {
                        _logger.LogError($"Failed AddToRole user named {userName}");
                    }
                }
            }
        }
    }
}