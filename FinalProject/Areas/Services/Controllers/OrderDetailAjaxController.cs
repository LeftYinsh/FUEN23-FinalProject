using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Services.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static FinalProject.Models.CGlobalParameters;

namespace FinalProject.Areas.Services.Controllers
{
    [Area("Services")]
    [Route("api/OrderDetail")]
    public class OrderDetailAjaxController : Controller
    {
        private readonly FinalProjectContext _context;

        public OrderDetailAjaxController(FinalProjectContext context)
        {
            _context = context;
        }
        // GET: OrderDetailAjaxController
        public IActionResult Index()
        {
            return View();
        }

        //public int CustomerCurrentID = 12;

        // GET: OrderDetailAjaxController/Details/5
        [HttpGet]
        public async Task<IEnumerable<OrderDetailDTO>> Details()
        {
            int CustomerCurrentID = FetchCustomerId(this);
            List<OrderDetailDTO> ODetailDTO = new List<OrderDetailDTO>();
            var datas = (from order in _context.TOrderDetail
                         join customerorder in _context.TCustomerOrderSheet on order.FCustomerOrderSheetId equals customerorder.FId
                         join customer in _context.TCustomer on customerorder.FCustomerId equals customer.FId
                         join p in _context.TProduct on order.FProductId equals p.FId
                         join period in _context.TPeriod on p.FPeriodId equals period.FId
                         //where customerorder.FCustomerId == id
                         where customerorder.FCustomerId == CustomerCurrentID
                         select new
                         {
                             order.FId,
                             order.FProductId,
                             p.FName,
                             order.FTravelDate,
                             period.FDescription,
                             order.FPurchaseQuantity,
                             p.FPrice,
                             p.FImagePath,
                             customerorder.FCouponCode,
                         }).ToList();
            foreach (var item in datas)
            {
                ODetailDTO.Add(new OrderDetailDTO()
                {
                    FId = item.FId,
                    FProductId = item.FProductId,
                    FName = item.FName,
                    FTravelDate = item.FTravelDate.ToString("yyyy-MM-dd"),
                    FPeriod = item.FDescription,
                    FPurchaseQuantity = item.FPurchaseQuantity,
                    FPrice = item.FPrice,
                    FImagePath = item.FImagePath,
                    FCouponCode = item.FCouponCode,
                });
            }


            return ODetailDTO;
        }
    }
}
