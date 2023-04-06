using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Services.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static FinalProject.Models.CGlobalParameters;

namespace FinalProject.Areas.Services.Controllers
{
    [Area("Services")]
    [Route("api/ShoppingCart")]
    public class ShoppingCartAjaxController : Controller
    {
        private readonly FinalProjectContext _context;

        public ShoppingCartAjaxController(FinalProjectContext context)
        {
            _context = context;
        }
        // GET: ShoppingCartAjaxController
        public ActionResult Index()
        {
            return View();
        }

        // GET: ShoppingCartAjaxController/Details/5
        [HttpGet]
        public async Task<IEnumerable<ShoppingCartDTO>> List()
        {
			int CustomerCurrentID = FetchCustomerId(this);
			List<ShoppingCartDTO> CartDTOes = new List<ShoppingCartDTO>();
            var datas = (from cart in _context.TShoppingCart
                         join p in _context.TProduct on cart.FProductId equals p.FId
                         join pd in _context.TPeriod on p.FPeriodId equals pd.FId
                         where cart.FCustomerId == CustomerCurrentID
                         select new
                         {
                             cart.FSid,
                             cart.FProductId,
                             p.FName,
                             cart.FTravelDate,
                             pd.FDescription,
                             cart.FPurchaseQuantity,
                             p.FPrice,
                             p.FImagePath,
                         }).ToList();
            foreach (var item in datas)
            {
                CartDTOes.Add(new ShoppingCartDTO()
                {
                    FSid = item.FSid,
                    FProductId = item.FProductId,
                    FName = item.FName,
                    FTravelDate = item.FTravelDate.ToString("yyyy-MM-dd"),
                    FPeriod = item.FDescription,
                    FPurchaseQuantity = item.FPurchaseQuantity,
                    FPrice = item.FPrice,
                    FImagePath = item.FImagePath,
                });
            }
            return CartDTOes;
        }

        [HttpPost]
        public async Task<string> AddToCart([FromBody] AddToCartDTO cartList)
        {
            if(IsCustomer(this))
            { 
            TShoppingCart list = new TShoppingCart
            {
                FCustomerId = cartList.FCustomerId,
                FProductId = cartList.FProductId,
                FPurchaseQuantity = cartList.FPurchaseQuantity,
                FTravelDate = cartList.FTravelDate,
            };
            _context.Add(list);
            await _context.SaveChangesAsync();

            return "成功加入購物車！";
            }
            else
            {
                return "請先登入會員！";
            }
        }
        //[HttpPost]
        //public async Task<string> postOrder([FromBody] ShoppingCartDTO shoppingCart)
        //{
        //    TCustomerOrderSheet postOrder = new TCustomerOrderSheet
        //    {
        //        FCustomerId = (int)shoppingCart.FCustomerId,
        //        FCouponCode = shoppingCart.FCouponCode,
        //        FCreationDate = DateTime.Now,
        //        FTravelDate = (DateTime)shoppingCart.FNewTravelDate,
        //    };
        //    _context.TCustomerOrderSheet.Add(postOrder);
        //    await _context.SaveChangesAsync();

        //    TOrderDetail orderDetail = new TOrderDetail
        //    {
        //        FCustomerOrderSheetId = (from os in _context.TCustomerOrderSheet
        //                                 where os.FCustomerId == shoppingCart.FCustomerId
        //                                 orderby os.FCreationDate
        //                                 select os.FId).First(),
        //        FProductId = shoppingCart.FProductId,
        //        FPurchaseQuantity = (int)shoppingCart.FPurchaseQuantity,
        //    };
        //    _context.TOrderDetail.Add(orderDetail);
        //    await _context.SaveChangesAsync();

        //    var deleteCart = await _context.TShoppingCart.FindAsync();
        //    if (deleteCart == null)
        //    {
        //        return "刪除失敗";
        //    }

        //    _context.TShoppingCart.Remove(deleteCart);
        //    await _context.SaveChangesAsync();


        //    return "訂單成立！";
        //}
        [HttpDelete]
        public async Task<string> DeleteAddCart([FromBody] DeleteCartDTO dcDTO)
        {
            var deleteCart = (from dc in _context.TShoppingCart
                             where dc.FSid == dcDTO.FSid
                             select dc).First();
            if (deleteCart == null)
            {
                return "刪除失敗";
            }

            _context.TShoppingCart.Remove(deleteCart);
            await _context.SaveChangesAsync();

            return "刪除成功";
        }
    }
}
