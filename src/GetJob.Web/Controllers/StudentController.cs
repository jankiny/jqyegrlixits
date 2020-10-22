using System;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;
using GetJob.Services;
using GetJob.Web.ViewModels.Student;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Logging;

namespace GetJob.Web.Controllers
{
    public class StudentController : Controller
    {
        private readonly IStudentService _studentService;
        private readonly ILogger<StudentController> _logger;
        private readonly IUserService _userService;
        public StudentController(ILogger<StudentController> logger, IUserService userService,
            IStudentService companyService)
        {
            _logger = logger;
            _userService = userService;
            _studentService = companyService;
        }

        private async Task PopulateStudentRelatedDropDownList(string selectedBirthPlaceId = null,
            string selectedNationId = null, string selectedPoliticalOutlookId = null, string selectedDegreeId = null)
        {
            var locations = await _studentService.GetAllLocationAsync();
            ViewBag.Locations = new SelectList(locations, "LocationId", "Text", selectedBirthPlaceId);

            var nations = await _studentService.GetAllNationAsync();
            ViewBag.Nations = new SelectList(nations, "NationId", "Text",selectedNationId);

            var politicalOutlooks = await _studentService.GetAllPoliticalOutlookAsync();
            ViewBag.PoliticalOutlooks = new SelectList(politicalOutlooks, "PoliticalOutlookId", "Text", selectedPoliticalOutlookId);

            var degrees = await _studentService.GetAllDegreeAsync();
            ViewBag.Degrees = new SelectList(degrees, "DegreeId", "Text", selectedDegreeId);
        }

        public async Task<IActionResult> StudentInfo()
        {
            var student = await _studentService.GetByIdAsync(User.FindFirst("StudentId").Value);
            var vm = new StudentInfoViewModel(student);
            await PopulateStudentRelatedDropDownList();
            return View(vm);
        }
        [HttpPost]
        public async Task<IActionResult> StudentInfoEdit(StudentInfoViewModel vm)
        {
            if (ModelState.IsValid)
            {
                var student = new Student
                {
                    Id = vm.Id,
                    IdentityNumber = vm.IdentityNumber,
                    Name = vm.Name,
                    Sex = vm.Sex,
                    BirthPlaceId = vm.BirthPlaceId,
                    Address = vm.Address,
                    Birthday = vm.Birthday,
                    NationId = vm.NationId,
                    PoliticalOutlookId = vm.PoliticalOutlookId,
                    Phone = vm.Phone,
                    Mail = vm.Mail,
                    College = vm.College,
                    Major=vm.Major,
                    DegreeId = vm.DegreeId
            };
                await _studentService.UpdateAsync(student);
                await PopulateStudentRelatedDropDownList();
                return View(nameof(StudentInfo), vm);
            }
            await PopulateStudentRelatedDropDownList(vm.BirthPlaceId.ToString(), vm.NationId.ToString(), vm.PoliticalOutlookId.ToString(), vm.DegreeId.ToString());
            return View(nameof(StudentInfo), vm);
        }

        public async Task<IActionResult> SignUp()
        {
            await PopulateStudentRelatedDropDownList();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SignUp(StudentSignUpViewModel vm)
        {
            if (ModelState.IsValid)
            {
                var user = new IdentityUser
                {
                    PhoneNumber = vm.Phone,
                    UserName = vm.UserName,
                    Email = vm.Mail,
                    EmailConfirmed = true
                };
                var student = new Student
                {
                    IdentityNumber = vm.IdentityNumber,
                    Name = vm.Name,
                    Sex = vm.Sex,
                    BirthPlaceId = vm.BirthPlaceId,
                    Address = vm.Address,
                    Birthday = vm.Birthday,
                    NationId = vm.NationId,
                    PoliticalOutlookId = vm.PoliticalOutlookId,
                    Phone = vm.Phone,
                    Mail = vm.Mail,
                    College = vm.College,
                    DegreeId = vm.DegreeId
                };
                if (await _studentService.AddAsync(student) != -1)
                {
                    var result = await _userService.CreateUserAsync(user, vm.Password, student);

                    if (result.Succeeded)
                    {
                        _logger.LogInformation($"{vm.Phone} created a new account with password.");
                        return RedirectToAction("SignIn", "Home");
                    }
                }
            }

            _logger.LogInformation("Failed to create a new account.");
            ModelState.AddModelError("", "错误信息");
            await PopulateStudentRelatedDropDownList(vm.BirthPlaceId.ToString(), vm.NationId.ToString(), vm.PoliticalOutlookId.ToString(), vm.DegreeId.ToString());
            return RedirectToAction("SignUp", "Student", vm);
        }
    }
}
