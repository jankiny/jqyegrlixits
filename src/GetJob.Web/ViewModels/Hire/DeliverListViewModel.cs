using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GetJob.Web.ViewModels.Hire
{
    public class DeliverListViewModel
    {
        public DeliverListViewModel(string jobId)
        {
            JobId = jobId;
            DeliverViewModels = new List<DeliverViewModel>();
        }

        public string JobId { get; set; }
        public List<DeliverViewModel> DeliverViewModels { get; set; }
    }
}
