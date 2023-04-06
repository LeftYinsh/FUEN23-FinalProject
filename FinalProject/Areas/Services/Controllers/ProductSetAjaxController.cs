using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Services.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Threading.Tasks;
using static FinalProject.Models.CGlobalParameters;

namespace FinalProject.Areas.Services.Controllers
{
    [Area("Services")]
    [Route("api/ProductSet")]
    public class ProductSetAjaxController : Controller
    {
        private bool FPeriod1 = false;
        private bool FPeriod2 = false;
        private bool FPeriod3 = false;
        private int PeriodPara = 0;
        //private int ClientCurrentID = FetchCustomerId(this);

        private readonly FinalProjectContext _context;


        public ProductSetAjaxController(FinalProjectContext context)
        {
            _context = context;
        }
        // GET: ProductSetAjaxController
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public Task<IEnumerable<ProductSetDTO>> PostPeriod([FromBody] ProductSetDTO productSet)
        {
            //ClientCurrentID = id;
            FPeriod1 = (bool)productSet.FPeriod1;
            FPeriod2 = (bool)productSet.FPeriod2;
            FPeriod3 = (bool)productSet.FPeriod3;
            return Details();
        }

        [HttpGet]
        public async Task<IEnumerable<ProductSetDTO>> Details()
        {
            int ClientCurrentID = FetchCustomerId(this);
            if (FPeriod1 == true)
            {
                if (FPeriod2 == true)
                {
                    if (FPeriod3 == true)
                    {
                        PeriodPara = 1;
                    }
                    else
                    {
                        PeriodPara = 2;
                    }
                }
                else
                {
                    if (FPeriod3 == true)
                    {
                        PeriodPara = 3;
                    }
                    else
                    {
                        PeriodPara = 4;
                    }
                }
            }
            else
            {
                if (FPeriod2 == true)
                {
                    if (FPeriod3 == true)
                    {
                        PeriodPara = 5;
                    }
                    else
                    {
                        PeriodPara = 6;
                    }
                }
                else
                {
                    if (FPeriod3 == true)
                    {
                        PeriodPara = 7;
                    }
                    else
                    {
                        PeriodPara = 8;
                    }
                }
            }
            List<ProductSetDTO> setDTO = new List<ProductSetDTO>();
            switch (PeriodPara)
            {
                case 1:
                    var datas1 = (from Productset in _context.TProduct
                                  where Productset.FPeriodId == 1 || Productset.FPeriodId == 2 || Productset.FPeriodId == 3
                                  group Productset by Productset.FPeriodId into g
                                  select g.OrderBy(x => Guid.NewGuid()).First()).ToList();
                    foreach (var item in datas1)
                    {
                        setDTO.Add(new ProductSetDTO()
                        {
                            FId = item.FId,
                            FCustomerId = ClientCurrentID,
                            FName = item.FName,
                            FPrice = item.FPrice,
                            FImagePath = item.FImagePath,
                            FPeriodId = item.FPeriodId,
                        });
                    }
                    string strJson1 = JsonConvert.SerializeObject(setDTO, Formatting.Indented);

                    Console.WriteLine(strJson1);
                    break;
                case 2:
                    var datas2 = (from Productset in _context.TProduct
                                  where Productset.FPeriodId == 1 || Productset.FPeriodId == 2
                                  group Productset by Productset.FPeriodId into g
                                  select g.OrderBy(x => Guid.NewGuid()).First()).ToList();
                    foreach (var item in datas2)
                    {
                        setDTO.Add(new ProductSetDTO()
                        {
                            FId = item.FId,
                            FCustomerId = ClientCurrentID,
                            FName = item.FName,
                            FPrice = item.FPrice,
                            FImagePath = item.FImagePath,
                            FPeriodId = item.FPeriodId,
                        });
                    }
                    string strJson2 = JsonConvert.SerializeObject(setDTO, Formatting.Indented);

                    Console.WriteLine(strJson2);
                    break;
                case 3:
                    var datas3 = (from Productset in _context.TProduct
                                  where Productset.FPeriodId == 1 || Productset.FPeriodId == 3
                                  group Productset by Productset.FPeriodId into g
                                  select g.OrderBy(x => Guid.NewGuid()).First()).ToList();
                    foreach (var item in datas3)
                    {
                        setDTO.Add(new ProductSetDTO()
                        {
                            FId = item.FId,
                            FCustomerId = ClientCurrentID,
                            FName = item.FName,
                            FPrice = item.FPrice,
                            FImagePath = item.FImagePath,
                            FPeriodId = item.FPeriodId,
                        });
                    }
                    string strJson3 = JsonConvert.SerializeObject(setDTO, Formatting.Indented);

                    Console.WriteLine(strJson3);
                    break;
                case 4:
                    var datas4 = (from Productset in _context.TProduct
                                  where Productset.FPeriodId == 1
                                  group Productset by Productset.FPeriodId into g
                                  select g.OrderBy(x => Guid.NewGuid()).First()).ToList();
                    foreach (var item in datas4)
                    {
                        setDTO.Add(new ProductSetDTO()
                        {
                            FId = item.FId,
                            FCustomerId = ClientCurrentID,
                            FName = item.FName,
                            FPrice = item.FPrice,
                            FImagePath = item.FImagePath,
                            FPeriodId = item.FPeriodId,
                        });
                    }
                    string strJson4 = JsonConvert.SerializeObject(setDTO, Formatting.Indented);

                    Console.WriteLine(strJson4);
                    break;
                case 5:
                    var datas5 = (from Productset in _context.TProduct
                                  where Productset.FPeriodId == 2 || Productset.FPeriodId == 3
                                  group Productset by Productset.FPeriodId into g
                                  select g.OrderBy(x => Guid.NewGuid()).First()).ToList();
                    foreach (var item in datas5)
                    {
                        setDTO.Add(new ProductSetDTO()
                        {
                            FId = item.FId,
                            FCustomerId = ClientCurrentID,
                            FName = item.FName,
                            FPrice = item.FPrice,
                            FImagePath = item.FImagePath,
                            FPeriodId = item.FPeriodId,
                        });
                    }
                    string strJson5 = JsonConvert.SerializeObject(setDTO, Formatting.Indented);

                    Console.WriteLine(strJson5);
                    break;
                case 6:
                    var datas6 = (from Productset in _context.TProduct
                                  where Productset.FPeriodId == 2
                                  group Productset by Productset.FPeriodId into g
                                  select g.OrderBy(x => Guid.NewGuid()).First()).ToList();
                    foreach (var item in datas6)
                    {
                        setDTO.Add(new ProductSetDTO()
                        {
                            FId = item.FId,
                            FCustomerId = ClientCurrentID,
                            FName = item.FName,
                            FPrice = item.FPrice,
                            FImagePath = item.FImagePath,
                            FPeriodId = item.FPeriodId,
                        });
                    }
                    string strJson6 = JsonConvert.SerializeObject(setDTO, Formatting.Indented);

                    Console.WriteLine(strJson6);
                    break;
                case 7:
                    var datas7 = (from Productset in _context.TProduct
                                  where Productset.FPeriodId == 3
                                  group Productset by Productset.FPeriodId into g
                                  select g.OrderBy(x => Guid.NewGuid()).First()).ToList();
                    foreach (var item in datas7)
                    {
                        setDTO.Add(new ProductSetDTO()
                        {
                            FId = item.FId,
                            FCustomerId = ClientCurrentID,
                            FName = item.FName,
                            FPrice = item.FPrice,
                            FImagePath = item.FImagePath,
                            FPeriodId = item.FPeriodId,
                        });
                    }
                    string strJson7 = JsonConvert.SerializeObject(setDTO, Formatting.Indented);

                    Console.WriteLine(strJson7);
                    break;
                case 8:

                    break;
            }
            return setDTO;
        }
        [HttpPost("{id}")]
        public async Task<string> PostReview([FromBody] ProductSetDTO productSet)
        {
            TShoppingCart cart = new TShoppingCart
            {
                FCustomerId = (int)productSet.FCustomerId,
                FProductId = (int)productSet.FId,
                FPurchaseQuantity = (int)productSet.FPurchaseQuantity,
                FTravelDate = (DateTime)productSet.FTravelDate,
            };
            _context.TShoppingCart.Add(cart);
            await _context.SaveChangesAsync();

            return "新增成功";
        }
    }
}
