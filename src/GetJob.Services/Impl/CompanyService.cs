using System;
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
    public class CompanyService : ICompanyService
    {
        private readonly ILogger<CompanyService> _logger;
        private readonly GetJobDbContext _context;

        public CompanyService(ILogger<CompanyService> logger, GetJobDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        async Task<List<Company>> ICompanyService.GetByCompanyFieldAsync(CompanyField model)
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

        async Task<List<Company>> ICompanyService.GetAllAsync()
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

        async Task<List<Company>> ICompanyService.SearchAsync(string searchString)
        {
            try
            {
                // Where(c => c.Name.Contains(searchString) || ...)
                var companyList = await _context.Companies.Where(c => c.Name.Contains(searchString)).ToListAsync();
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