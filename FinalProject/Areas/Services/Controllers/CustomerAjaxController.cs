using FinalProject.Areas.Client.Controllers;
using FinalProject.Areas.Client.Models;
using FinalProject.Areas.Services.DTO;
using FinalProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static FinalProject.Models.CGlobalParameters;
namespace FinalProject.Areas.Services.Controllers
{
    [Area("Services")]
    [Route("api/Customer")]
    public class CustomerAjaxController : Controller
    {
        private FinalProjectContext _context;
        public CustomerAjaxController(FinalProjectContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        //[HttpGet("demo")]
        //public string demo(string p)
        //{
        //    return $"{p}";
        //}

        [HttpGet("{id}")]
        public async Task<CustomerDTO> Details(int id)
        {
            var datas = (from customer in _context.TCustomer
                         where customer.FId == id
                         select new
                         {
                             FCustomerId = customer.FId,
                             customer.FLastName,
                             customer.FFirstName,
                             customer.FGender,
                             customer.FTel,
                             customer.FMobile,
                             customer.FEmail,
                             customer.FPassword,
                             customer.FBirthDate,
                             customer.FPoint,
                         }).First();
            CustomerDTO cusDTO = new CustomerDTO()
            {
                FId = datas.FCustomerId,
                FLastName = datas.FLastName,
                FFirstName = datas.FFirstName,
                FGender = datas.FGender,
                FTel = datas.FTel,
                FMobile = datas.FMobile,
                FEmail = datas.FEmail,
                FPassword = datas.FPassword,
                FBirthDate = datas.FBirthDate.ToString("yyyy-MM-dd"),
                FPoint = datas.FPoint,
            };
            return cusDTO;
        }

        [HttpPut("{id}")]
        public async Task<string> PutCustomers(int id, [FromBody] CustomerDTO customers)
        {
            if (id != customers.FId)
            {
                return "參數錯誤";
            }
            TCustomer? cus = await _context.TCustomer.FindAsync(customers.FId);
            cus.FFirstName = customers.FFirstName;
            cus.FLastName = customers.FLastName;
            cus.FEmail = customers.FEmail;
            cus.FPassword = customers.FPassword;
            cus.FGender = (byte)customers.FGender;
            cus.FTel = customers.FTel;
            cus.FMobile = customers.FMobile;
            //cus.FBirthDate= customers.FBirthDate;
            cus.FPoint = customers.FPoint;


            _context.Entry(cus).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CustomerExists(id))
                {
                    return "員工不存在";
                }
                else
                {
                    throw;
                }
            }

            return "修改成功";
        }

        private bool CustomerExists(int id)
        {
            return _context.TCustomer.Any(e => e.FId == id);
        }
        [HttpPost("new")]
        public async Task<string> PostTCustomer([FromBody] CustomerDTO tCustomer)
        {
            TCustomer cus = new TCustomer
            {
                FFirstName = tCustomer.FFirstName,
                FLastName = tCustomer.FLastName,
                FPassword = tCustomer.FPassword,
                FEmail = tCustomer.FEmail,
                FGender = (byte)tCustomer.FGender,
                FTel = tCustomer.FTel,
                FMobile = tCustomer.FMobile,
                FBirthDate = tCustomer.FNewBirthDate,
                FBlackList = false,
                FCreationDate = DateTime.Now,
                FLastUpdateDate = DateTime.Now,
                FPoint = tCustomer.FPoint,
                FRemark = null,
            };
            _context.TCustomer.Add(cus);
            await _context.SaveChangesAsync();

            return "註冊成功，歡迎加入TripLook!";
        }

        [HttpPost]
        public async Task<string> Login([FromBody] CLogin vm)
        {
            var user = (from cus in _context.TCustomer
                       where cus.FEmail == vm.txtAccount
                       select cus).First();
            if (user != null && user.FPassword.Equals(vm.txtPassword))
            {
                string json = System.Text.Json.JsonSerializer.Serialize<TCustomer>(user);
                HttpContext.Session.SetString(CDictionaryLogin.SK_LOGINED_CUSTOMER, json);
                
				return "登入成功！";
			}
            else
            {
                return "密碼錯誤！";
            }
        }
    }
}
