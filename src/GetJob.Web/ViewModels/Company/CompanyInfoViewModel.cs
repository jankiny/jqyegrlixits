using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using GetJob.Models;

namespace GetJob.Web.ViewModels.Company
{
    public class CompanyInfoViewModel
    {
        public CompanyInfoViewModel()
        {
            
        }
        public CompanyInfoViewModel(Models.Company company)
        {
            Id = company.Id;
            Name = company.Name;
            CompanyFieldId = company.CompanyFieldId;
            CompanyField = company.CompanyField;
            CompanyScaleId = company.CompanyScaleId;
            CompanyScale = company.CompanyScale;
            Description = company.Description;
        }
        public string Id { get; set; } = Guid.NewGuid().ToString();
        [Required, StringLength(50), Display(Name = "企业名称")] public string Name { get; set; }
        [Required, Display(Name = "企业性质")] public int CompanyFieldId { get; set; }
        public CompanyField CompanyField { get; set; }
        [Required, Display(Name = "企业规模")] public int CompanyScaleId { get; set; }
        public CompanyScale CompanyScale { get; set; }
        [StringLength(450), Display(Name = "企业描述")] public string Description { get; set; }
    }
}
