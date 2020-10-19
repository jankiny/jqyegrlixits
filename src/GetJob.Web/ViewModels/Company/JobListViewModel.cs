using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GetJob.Web.ViewModels.Company
{
    public class JobListViewModel
    {
        public JobListViewModel()
        {
            JobViewModels = new List<JobViewModel>();
        }


        public bool SelectedAll { get; set; }
        public List<JobViewModel> JobViewModels { get; set; }
    }
}
