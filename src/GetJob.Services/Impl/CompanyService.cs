using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Data;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace GetJob.Services.Impl
{
    class CompanyService : ICompanyService
    {
        private readonly ILogger<CompanyService> _logger;
        private readonly GetJobDbContext _context;
        private readonly UserManager<Company> _userManager;
        private readonly SignInManager<Company> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public CompanyService(ILogger<CompanyService> logger, UserManager<Company> userManager, RoleManager<IdentityRole> roleManager, SignInManager<Company> signInManager, GetJobDbContext context)
        {
            _logger = logger;
            _userManager = userManager;
            _roleManager = roleManager;
            _signInManager = signInManager;
            _context = context;
        }
        public async Task<IdentityResult> CreateCompanyAsync(Company model, string plainPassword)
        {
            try
            {
                return await _userManager.CreateAsync(model, plainPassword);
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

        public async Task<IdentityResult> DeleteAsync(Company model)
        {
            try
            {
                return await _userManager.DeleteAsync(model);
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return IdentityResult.Failed();
            }
        }

        public async Task<IdentityResult> UpdateAsync(Company model)
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

        public async Task<Company> GetByIdAsync(string id)
        {
            try
            {
                var company = await _userManager.FindByIdAsync(id);
                company.CompanyField = await _context.CompanyFields.FindAsync(company.CompanyFieldId);
                return company;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Company>> GetByCompanyFieldAsync(CompanyField model)
        {
            try
            {
                var companyList = await _context.Companies.Where(c => c.CompanyFieldId == model.Id).ToListAsync();
                foreach (var company in companyList)
                {
                    company.CompanyField = await _context.CompanyFields.FindAsync(company.CompanyFieldId);
                }

                return companyList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Company>> GetAllAsync()
        {
            try
            {
                var companyList = await _context.Companies.ToListAsync();
                foreach (var company in companyList)
                {
                    company.CompanyField = await _context.CompanyFields.FindAsync(company.CompanyFieldId);
                }

                return companyList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }
    }
}