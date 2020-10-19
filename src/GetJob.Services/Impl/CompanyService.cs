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

        public async Task<List<CompanyField>> GetAllCompanyFieldAsync()
        {
            try
            {
                return await _context.CompanyFields.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<int> AddAsync(Company model)
        {
            try
            {
                await _context.Companies.AddAsync(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<int> DeleteAsync(Company model)
        {
            try
            {
                _context.Companies.Remove(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<int> UpdateAsync(Company model)
        {
            try
            {
                _context.Companies.Update(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<Company> GetByIdAsync(string id)
        {
            try
            {
                var company = await _context.Companies.FindAsync(id);
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
                var companyList = await _context.Companies.Where(c => c.CompanyFieldId == model.CompanyFieldId).ToListAsync();
                foreach (var company in companyList)
                {
                    company.CompanyField = model;
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

        public async Task<List<Company>> SearchAsync(string searchString)
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