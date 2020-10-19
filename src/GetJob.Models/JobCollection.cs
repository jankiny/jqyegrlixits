using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace GetJob.Models
{
    public class JobCollection
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();

        [Required] public string StudentId { get; set; }
        public Student Student { get; set; }

        [Required] public string JobId { get; set; }
        public Job Job { get; set; }

        public DateTime CollectionDateTime { get; set; }

    }
}
