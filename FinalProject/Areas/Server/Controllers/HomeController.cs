using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Text.Json;
using static FinalProject.Areas.Server.Models.CDictionary;
using static FinalProject.Models.CGlobalParameters;

namespace FinalProject.Areas.Server.Controllers.Controllers
{
    [Area("Server")]
    public class HomeController : Controller
    {
        private readonly FinalProjectContext _context;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, FinalProjectContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            if (!IsAdmin(this) && !IsProvider(this))
            {
                return RedirectToAction("Login");
            }
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Login()
        {
            if (IsAdmin(this))
            {
                return RedirectToAction("Index");
            }
            return View();
        }
        [HttpPost]
        public IActionResult Login(CLoginViewModel vm)
        {
            TManager admin = _context.TManager.FirstOrDefault(
         t => t.FAccount.Equals(vm.txtAccount) && t.FPassword.Equals(vm.txtPassword));

            TProvider provider = _context.TProvider.FirstOrDefault(
         t => t.FContactEmail.Equals(vm.txtAccount) && t.FPassword.Equals(vm.txtPassword));

            if (admin != null && admin.FPassword.Equals(vm.txtPassword))
            {
                string json = JsonSerializer.Serialize(admin);
                HttpContext.Session.SetString(SK_LOGINED_ADMIN, json);
                return RedirectToAction("Index");
            }
            else if (provider != null && provider.FPassword.Equals(vm.txtPassword))
            {
                string json = JsonSerializer.Serialize(provider);
                HttpContext.Session.SetString(SK_LOGINED_PROVIDER, json);
                return RedirectToAction("Index");
            }
            return View();
        }
        public IActionResult Logout(int? id)
        {
            if (IsAdmin(this))
            {
                HttpContext.Session.Remove(SK_LOGINED_ADMIN);
            }
            else if (IsProvider(this))
            {
                HttpContext.Session.Remove(SK_LOGINED_PROVIDER);
            }
            return id == 1 ? RedirectToAction("Index", "Home", new { area = "Client" }) : RedirectToAction("Login");
        }
    }
}