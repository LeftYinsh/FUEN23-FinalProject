using FinalProject.Areas.Client.Models;
using FinalProject.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using static FinalProject.Models.CGlobalParameters;

namespace FinalProject.Areas.Client.Controllers.Controllers
{
    [Area("Client")]
	[Route("/")]
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
            return View();
        }
        [Route("Logout")]
        public IActionResult Logout()
        {
            if (IsCustomer(this))
            {
                HttpContext.Session.Remove(CDictionaryLogin.SK_LOGINED_CUSTOMER);
            }
            return RedirectToAction("Index");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        [Route("Error")]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}