using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Services.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using static System.Formats.Asn1.AsnWriter;


namespace FinalProject.Areas.Services.Controllers
{
    [Area("Services")]
    [Route("api/Report")]
    public class ProductReportAjaxController : Controller
    {
        private readonly FinalProjectContext _context;

        public ProductReportAjaxController(FinalProjectContext context)
        {
            _context = context;
        }
        // GET: ProductReportAjaxController
        public ActionResult Index()
        {
            return View();
        }

        // GET: ProductReportAjaxController/Details
        [HttpGet("{id}")]
        public async Task<IEnumerable<ProductReportDTO>> Details(int id)
        {
            List<ProductReportDTO> ReportDTO = new List<ProductReportDTO>();
            var datas = (from report in _context.TProductReport
                         join orderdetail in _context.TOrderDetail on report.FOrderDetailId equals orderdetail.FId
                         join customerordersheet in _context.TCustomerOrderSheet on orderdetail.FCustomerOrderSheetId equals customerordersheet.FId
                         join customer in _context.TCustomer on customerordersheet.FCustomerId equals customer.FId
                         where report.FProductId == id  // 找商品 FProductId                   
                         select new
                         {                    
                             report.FId,               
                             report.FReportContent,
                             report.FCreationDate,                     
                             FLastName = customer.FLastName,
                             FFirstName = customer.FFirstName,
                         }).ToList();
            foreach (var item in datas)
            {
                ReportDTO.Add(new ProductReportDTO()
                {
                    FId = item.FId,        
                    FReportContent = item.FReportContent,
                    FCreationDate = item.FCreationDate.ToString("yyyy-MM-dd"),
                    FLastName = item.FLastName,
                    FFirstName = item.FFirstName,
                });
            }

            string strJson = JsonConvert.SerializeObject(ReportDTO, Formatting.Indented);

            Console.WriteLine(strJson);

            return ReportDTO;
        }


        [HttpPost]
        public async Task<string> PostReport([FromBody] ProductReportDTO productReport)
        {
            TProductReport Report = new TProductReport
            {
                FOrderDetailId = (int)productReport.FOrderDetailId,
                FCreationDate = DateTime.Now,
                FReportContent = productReport.FReportContent,
                FProductId = productReport.FProductId,
            };
            _context.TProductReport.Add(Report);
            await _context.SaveChangesAsync();

            return "檢舉成功";
        }
    }
}
