using System.ComponentModel.DataAnnotations;

namespace GetJob.Models
{
    public class JobCharacter
    {
        [Key] public int Id { get; set; }

        [Required, StringLength(50)] public string Text { get; set; }
    }
}