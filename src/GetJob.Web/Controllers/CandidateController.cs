using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace GetJob.Web.Controllers
{
    public class CandidateController : Controller
    {
        public IActionResult CandidateFollowList()
        {
            return View();
        }
        public IActionResult CandidateSearch()
        {
            return View();
        }
    }
}
