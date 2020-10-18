using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GetJob.Models
{
    public class JobCharacter
    {
        [Key]
        public int JobCharacterId { get; set; }

        [Required] [StringLength(50)] public string Text { get; set; }
    }
}