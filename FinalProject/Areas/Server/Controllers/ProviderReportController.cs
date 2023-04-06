using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Areas.Server.Controllers.Controllers
{
    [Area("Server")]
    public class ProviderReportController : SuperController
    {
        private readonly FinalProjectContext _context;
        public ProviderReportController(FinalProjectContext context)
        {
            _context = context;
        }
        public IActionResult List()
        {
            IEnumerable<TProductReport> datas = null;
            datas = from t in _context.TProductReport select t;
            return View(datas);
        }
    }
}
