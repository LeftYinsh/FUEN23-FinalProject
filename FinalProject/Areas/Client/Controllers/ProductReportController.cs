using Microsoft.AspNetCore.Mvc;

namespace FinalProject.Areas.Client.Controllers
{
    [Area("Client")]
    public class ProductReportController : Controller
    {
        public IActionResult ProductReport()
        {
            return View();
        }
    }
}
