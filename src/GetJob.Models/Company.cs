using System;
using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class Company
    {
        /// <summary>
        /// 公司GUID
        /// </summary>
        public string Id { get; set; } = Guid.NewGuid().ToString();

        /// <summary>
        /// 公司名
        /// </summary>
        [Required] [StringLength(50)] public string Name { get; set; }
        [Required] public int CompanyFieldId { get; set; }
        public CompanyField CompanyField { get; set; }
        [Required] public int CompanyScaleId { get; set; }
        public CompanyScale CompanyScale { get; set; }
        [StringLength(450)] public string Description { get; set; }
    }
}