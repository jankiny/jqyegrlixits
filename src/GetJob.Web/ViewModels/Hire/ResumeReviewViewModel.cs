using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GetJob.Web.ViewModels.Hire
{
    public class ResumeReviewViewModel
    {
        public ResumeReviewViewModel()
        {
            JobViewModels = new List<JobViewModel>();
            DeliverListViewModels = new List<DeliverListViewModel>();
        }
        public List<JobViewModel> JobViewModels { get; set; }
        public List<DeliverListViewModel> DeliverListViewModels { get; set; }
    }
}
