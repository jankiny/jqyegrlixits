using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using GetJob.Data;
using GetJob.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;
using System.Runtime.InteropServices;

namespace GetJob.Services.Impl
{
    public class StudentService : IStudentService
    {
        private readonly ILogger<StudentService> _logger;
        private readonly GetJobDbContext _context;

        public StudentService(ILogger<StudentService> logger, GetJobDbContext context)
        {
            _logger = logger;
            _context = context;
        }


        public async Task<Student> GetByIdAsync(string id)
        {
            try
            {
                var student = await _context.Students.FindAsync(id);
                student.BirthPlace = await _context.Locations.FindAsync(student.BirthPlaceId);
                student.Nation = await _context.Nations.FindAsync(student.NationId);
                student.PoliticalOutlook = await _context.PoliticalOutlooks.FindAsync(student.PoliticalOutlookId);
                student.Degree = await _context.Degrees.FindAsync(student.DegreeId);
                return student;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<int> AddAsync(Student model)
        {
            try
            {
                await _context.Students.AddAsync(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<int> DeleteAsync(Student model)
        {
            try
            {
                _context.Students.Remove(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }

        public async Task<List<Student>> GetAllAsync()
        {
            try
            {
                var studentList = await _context.Students.ToListAsync();
                foreach (var student in studentList)
                {
                    student.BirthPlace = await _context.Locations.FindAsync(student.BirthPlaceId);
                    student.Nation = await _context.Nations.FindAsync(student.NationId);
                    student.PoliticalOutlook = await _context.PoliticalOutlooks.FindAsync(student.PoliticalOutlookId);
                    student.Degree = await _context.Degrees.FindAsync(student.DegreeId);
                }

                return studentList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Degree>> GetAllDegreeAsync()
        {
            try
            {
                return await _context.Degrees.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Location>> GetAllLocationAsync()
        {
            try
            {
                return await _context.Locations.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Nation>> GetAllNationAsync()
        {
            try
            {
                return await _context.Nations.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<PoliticalOutlook>> GetAllPoliticalOutlookAsync()
        {
            try
            {
                return await _context.PoliticalOutlooks.ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<List<Student>> SearchAsync(string searchString)
        {
            try
            {
               
                var studentList = await _context.Students.Where(c => c.Name.Contains(searchString)).ToListAsync();
                foreach (var student in studentList)
                {
                    student.BirthPlace = await _context.Locations.FindAsync(student.BirthPlaceId);
                    student.Nation = await _context.Nations.FindAsync(student.NationId);
                    student.PoliticalOutlook = await _context.PoliticalOutlooks.FindAsync(student.PoliticalOutlookId);
                    student.Degree = await _context.Degrees.FindAsync(student.DegreeId);
                }

                return studentList;
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return null;
            }
        }

        public async Task<int> UpdateAsync(Student model)
        {
            try
            {
                _context.Students.Update(model);
                return await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e.Message);
                return -1;
            }
        }
    }
}