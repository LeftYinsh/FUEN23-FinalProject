using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Areas.Server.Controllers
{
    [Area("Server")]
    public class ProviderReviewController : SuperController
    {
		private readonly FinalProjectContext _context;
		public ProviderReviewController(FinalProjectContext context)
		{
			_context = context;
		}
		public IActionResult List()
        {
            IEnumerable<TProductReview> datas = null;
            datas = from t in _context.TProductReview select t;
            return View(datas);
        }
    }
}
