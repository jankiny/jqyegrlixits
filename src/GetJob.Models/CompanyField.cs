using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class CompanyField
    {
        [Key] public int Id { get; set; }
        [Required] public string Text { get; set; }
    }
}
