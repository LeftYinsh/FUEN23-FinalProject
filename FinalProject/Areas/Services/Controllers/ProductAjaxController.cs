using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Services.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text.RegularExpressions;
using System.Data;

namespace FinalProject.Areas.Services.Controllers
{
    [Area("Services")]
    [Route("api/Product")]
    public class ProductAjaxController : Controller
    {
        private readonly FinalProjectContext _context;
        public ProductAjaxController(FinalProjectContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<IEnumerable<ProductDTO>> GetAll()
        {
            List<ProductDTO> ProductDTOes = new List<ProductDTO>();
            var datas = (from p in _context.TProduct
                         join pd in _context.TPeriod on p.FPeriodId equals pd.FId
                         select new
                         {
                             FProductId = p.FId,
                             p.FName,
                             p.FDescription,
                             p.FPrice,
                             FPeriod = pd.FDescription,
                             p.FImagePath
                         }).ToList();
            foreach (var item in datas)
            {
                ProductDTOes.Add(new ProductDTO()
                {
                    FProductId = item.FProductId,
                    FName = item.FName,
                    FPeriod = item.FPeriod,
                    FPrice = item.FPrice,
                    FDescription = Regex.Split(item.FDescription, "\n", RegexOptions.IgnoreCase)[0],
                    FImagePath = item.FImagePath,
                });
            }
            return ProductDTOes;
        }
        [HttpGet("r/{amount}")]
        public async Task<IEnumerable<ProductDTO>> GetRandom(int amount)
        {
            List<ProductDTO> ProductDTOes = new List<ProductDTO>();
            var datas = (from p in _context.TProduct
                         join pd in _context.TPeriod on p.FPeriodId equals pd.FId
                         orderby Guid.NewGuid()
                         select new
                         {
                             FProductId = p.FId,
                             p.FName,
                             p.FDescription,
                             p.FPrice,
                             FPeriod = pd.FDescription,
                             p.FImagePath
                         }).Take(amount).ToList();
            foreach (var item in datas)
            {
                ProductDTOes.Add(new ProductDTO()
                {
                    FProductId = item.FProductId,
                    FName = item.FName,
                    FPeriod = item.FPeriod,
                    FPrice = item.FPrice,
                    FImagePath = item.FImagePath,
                });
            }
            return ProductDTOes;
        }
        [HttpGet("{id}")]
        public async Task<ProductDetailDTO> Details(int id)
        {
            List<ProductDetailDTO> ProductDTOes = new List<ProductDetailDTO>();
            var datas = (from p in _context.TProduct
                         join pd in _context.TPeriod on p.FPeriodId equals pd.FId
                         join pvd in _context.TProvider on p.FProviderId equals pvd.FId
                         where p.FId == id
                         select new
                         {
                             FProductId = p.FId,
                             p.FName,
                             p.FDescription,
                             p.FPrice,
                             FPeriod = pd.FDescription,
                             p.FImagePath,
                             p.FMinParticipants,
                             p.FMaxParticipants,
                             p.FAssemblyPoint,
                             p.FStartDate,
                             p.FEndDate,
                             FProvider = pvd.FCompanyName,
                             p.FRemark,
                         }).ToList();
            foreach (var item in datas)
            {
                ProductDTOes.Add(new ProductDetailDTO()
                {
                    FProductId = item.FProductId,
                    FName = item.FName,
                    FPeriod = item.FPeriod,
                    FPrice = item.FPrice,
                    FDescription = item.FDescription,
                    FImagePath = item.FImagePath,
                    FMinParticipants = item.FMinParticipants,
                    FMaxParticipants = item.FMaxParticipants,
                    FAssemblyPoint = item.FAssemblyPoint,
                    FStartDate = item.FStartDate,
                    FEndDate = item.FEndDate,
                    FProvider = item.FProvider,
                    FRemark = item.FRemark,
                });
            }
            return ProductDTOes[0];
        }
    }
}
