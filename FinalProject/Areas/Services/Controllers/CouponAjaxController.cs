using FinalProject.Areas.Services.DTO;
using FinalProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

namespace FinalProject.Areas.Services.Controllers
{
	[Area("Services")]
	[Route("api/Coupon")]
	public class CouponAjaxController : Controller
	{
		private FinalProjectContext _context;
		public CouponAjaxController(FinalProjectContext context)
		{
			_context = context;
		}
		public IActionResult Index()
		{
			return View();
		}
		[HttpGet]
		public async Task<IEnumerable<CouponDTO>> List()
		{
			List<CouponDTO> CouponDTOes = new List<CouponDTO>();
			var datas = (from p in _context.TCoupon
						 select new
						 {
							 FCode = p.FCode,
							 FRatio = p.FRatio,
						 }).ToList();
			foreach (var item in datas)
			{
				CouponDTOes.Add(new CouponDTO()
				{
					FCode = item.FCode,
					FRatio = item.FRatio,
				});
			}
			return CouponDTOes;
		}

	}
}
