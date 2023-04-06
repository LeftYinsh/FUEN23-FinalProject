using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Services.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static FinalProject.Models.CGlobalParameters;

namespace FinalProject.Areas.Services.Controllers
{
	[Area("Services")]
	[Route("api/AddOrderSheet")]
	public class AddOrderSheetAjaxController : Controller
	{
		private readonly FinalProjectContext _context;

		public AddOrderSheetAjaxController(FinalProjectContext context)
		{
			_context = context;
		}

		[HttpPost]
		public async Task<string> AddOrder([FromBody] AddOrderSheetDTO addOrderSheet)
		{
			TCustomerOrderSheet osList = new TCustomerOrderSheet
			{
				FCustomerId = (int)addOrderSheet.FCustomerId,
				FCouponCode = addOrderSheet.FCouponCode,
				FCreationDate = DateTime.Now,
				FOrderSheetCancel = false,
			};
			_context.TCustomerOrderSheet.Add(osList);

            var productList = from cart in _context.TShoppingCart
							  where cart.FCustomerId == addOrderSheet.FCustomerId
							  select cart;

			int osId = (from os in _context.TCustomerOrderSheet
					  where os.FCustomerId == addOrderSheet.FCustomerId
					  orderby os.FCreationDate
					  select os.FId).First();

			foreach (var item in productList)
			{
				TOrderDetail odList = new TOrderDetail
				{
					FCustomerOrderSheetId = osId,
					FProductId = item.FProductId,
					FPurchaseQuantity = item.FPurchaseQuantity,
					FTravelDate = item.FTravelDate,
				};
				_context.TOrderDetail.Add(odList);           
            }
            await _context.SaveChangesAsync();
            return "訂單成立";
		}

	}
}
