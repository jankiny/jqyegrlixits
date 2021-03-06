﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using GetJob.Data;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace GetJob.Services.Impl
{
    public class UserService : IUserService
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ILogger<UserService> _logger;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly GetJobDbContext _context;

        public UserService(UserManager<IdentityUser> userManager, ILogger<UserService> logger, SignInManager<IdentityUser> signInManager, GetJobDbContext context)
        {
            _userManager = userManager;
            _logger = logger;
            _signInManager = signInManager;
            _context = context;
        }

        public async Task<IdentityResult> CreateUserAsync(IdentityUser model, string plainPassword, Company company)
        {
            try
            {
                await _userManager.CreateAsync(model, plainPassword);
                await _userManager.AddClaimAsync(model, new Claim("HeaderUrl", @"/img/default_head.png"));
                await _userManager.AddClaimAsync(model, new Claim("Identity", "Company"));
                return await _userManager.AddClaimAsync(model, new Claim("CompanyId", company.Id));
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return IdentityResult.Failed();
            }
        }

        public async Task<IdentityResult> CreateUserAsync(IdentityUser model, string plainPassword, Student student)
        {
            try
            {
                await _userManager.CreateAsync(model, plainPassword);
                await _userManager.AddClaimAsync(model, new Claim("HeaderUrl", @"/img/default_head.png"));
                await _userManager.AddClaimAsync(model, new Claim("Identity", "Student"));
                return await _userManager.AddClaimAsync(model, new Claim("StudentId", student.Id));
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
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return SignInResult.Failed;
            }
        }

        public async Task SignOutAsync()
        {
            await _signInManager.SignOutAsync();
        }

        public async Task<IdentityResult> DeleteAsync(IdentityUser model)
        {
            try
            {
                await _userManager.DeleteAsync(model);
                return await _userManager.RemoveClaimsAsync(model, await _userManager.GetClaimsAsync(model));
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return IdentityResult.Failed();
            }
        }

        public async Task<IdentityResult> UpdateAsync(IdentityUser model)
        {
            try
            {
                return await _userManager.UpdateAsync(model);
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return IdentityResult.Failed();
            }
        }

        public async Task<IdentityResult> UpdateUserClaimAsync(string userName, string claimType, string claimValue)
        {
            try
            {
                var user = await _userManager.FindByNameAsync(userName);
                var claims = await _userManager.GetClaimsAsync(user);
                var claim = claims.FirstOrDefault(c => c.Type == claimType);
                await _userManager.RemoveClaimAsync(user, claim);
                return await _userManager.AddClaimAsync(user, new Claim(claim?.Type, claimValue));
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return IdentityResult.Failed();
            }
        }

        public async Task<IdentityResult> ChangePassword(string userName, string currentPassword, string newPassword)
        {
            try
            {
                var user = await _userManager.FindByNameAsync(userName);
                return await _userManager.ChangePasswordAsync(user, currentPassword, newPassword);
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return IdentityResult.Failed();
            }
        }


        public async Task<IdentityUser> GetByIdAsync(string id)
        {
            try
            {
                return await _userManager.FindByIdAsync(id);
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<IdentityUser> GetByUserNameAsync(string userName)
        {
            try
            {
                return await _userManager.FindByNameAsync(userName);
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<string> GetUserClaimAsync(string userName, string claimType)
        {
            try
            {
                var user = await _userManager.FindByNameAsync(userName);
                var claims = await _userManager.GetClaimsAsync(user);
                return claims.FirstOrDefault(c => c.Type == claimType)?.Value;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return string.Empty;
            }
        }

        public async Task<object> GetUserIdentity(string userName)
        {
            try
            {
                var user = await _userManager.FindByNameAsync(userName);
                var claims = await _userManager.GetClaimsAsync(user);
                var identity = claims.FirstOrDefault(c => c.Type == "Identity")?.Value;
                // GetUserClaimAsync(userName, "Identity");
                switch (identity)
                {
                    case "Company":
                        var companyId = claims.FirstOrDefault(c => c.Type == "CompanyId")?.Value;
                        return await _context.Companies.FindAsync(companyId);
                    case "Student":
                        var studentId = claims.FirstOrDefault(c => c.Type == "StudentId")?.Value;
                        return await _context.Students.FindAsync(studentId);
                    default:
                        return null;
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<IdentityUser>> GetAllAsync()
        {
            try
            {
                return await _userManager.Users.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }
    }
}