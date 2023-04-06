using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Services.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using static System.Formats.Asn1.AsnWriter;
using System.Composition;
using System.Security.Cryptography;


namespace FinalProject.Areas.Services.Controllers
{
    [Area("Services")]
    [Route("api/Review")]
    public class ProductReviewAjaxController : Controller
    {
        private readonly FinalProjectContext _context;

        public ProductReviewAjaxController(FinalProjectContext context)
        {
            _context = context;
        }
        // GET: ProductReviewAjaxController
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<IEnumerable<HomeReviewDTO>> Details()
        {
            List<HomeReviewDTO> ReviewDTO = new List<HomeReviewDTO>();
            var datas = (from review in _context.TProductReview
                         join orderdetail in _context.TOrderDetail on review.FOrderDetailId equals orderdetail.FId
                         join customerordersheet in _context.TCustomerOrderSheet on orderdetail.FCustomerOrderSheetId equals customerordersheet.FId
                         join customer in _context.TCustomer on customerordersheet.FCustomerId equals customer.FId
                         join product in _context.TProduct on orderdetail.FProductId equals product.FId
                         select new
                         {
                             customer.FLastName,
                             customer.FFirstName,
                             review.FReviewContent,
                             product.FName,
                         }).ToList();
            foreach (var item in datas)
            {
                ReviewDTO.Add(new HomeReviewDTO()
                {
                    FName = item.FName,
                    FFirstName = item.FFirstName,
                    FLastName = item.FLastName,
                    FReviewContent = item.FReviewContent,
                });
            }

            return ReviewDTO;
        }

        // GET: ProductReviewAjaxController/Details
        [HttpGet("{id}")]
        public async Task<IEnumerable<ProductReviewDTO>> Details(int id)
        {
            List<ProductReviewDTO> ReviewDTO = new List<ProductReviewDTO>();
            var datas = (from review in _context.TProductReview
                         join orderdetail in _context.TOrderDetail on review.FOrderDetailId equals orderdetail.FId
                         join customerordersheet in _context.TCustomerOrderSheet on orderdetail.FCustomerOrderSheetId equals customerordersheet.FId
                         join customer in _context.TCustomer on customerordersheet.FCustomerId equals customer.FId
                         where review.FProductId == id                 
                         select new
                         {                    
                             review.FId,
                             FLastName = customer.FLastName,
                             FFirstName = customer.FFirstName,
                             review.FReviewContent,
                             review.FCreationDate,
                             review.FScore
                         }).ToList();              
            foreach (var item in datas)
            {
                ReviewDTO.Add(new ProductReviewDTO()
                {
                    FId = item.FId,
                    FFirstName = item.FFirstName,
                    FLastName = item.FLastName,
                    FReviewContent = item.FReviewContent,
                    FCreationDate = item.FCreationDate.ToString("yyyy-MM-dd"),
                    FScore = item.FScore
                });
            }
            return ReviewDTO;
        }
        [HttpPost]
        public async Task<string> PostReview([FromBody] ProductReviewDTO productReview)
        {
            TProductReview review = new TProductReview
            {
				//FId= (int)productReview.FId,
				FOrderDetailId = (int)productReview.FOrderDetailId,
                FScore = (byte)productReview.FScore,
                FCreationDate = DateTime.Now,
                FReviewContent = productReview.FReviewContent,
                FProductId = (int)productReview.FProductId,
            };
            _context.TProductReview.Add(review);
            await _context.SaveChangesAsync();

            return "新增成功";
        }
    }
}
