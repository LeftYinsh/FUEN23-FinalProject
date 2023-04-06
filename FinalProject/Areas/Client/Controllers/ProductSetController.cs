using Microsoft.AspNetCore.Mvc;

namespace FinalProject.Areas.Client.Controllers
{
    [Area("Client")]
    [Route("ProductSet")]
    public class ProductSetController : Controller
    {
        public IActionResult ProductSet()
        {
            return View();
        }
    }
}
