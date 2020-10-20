using System.Collections.Generic;

namespace GetJob.Web.ViewModels.Hire
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
