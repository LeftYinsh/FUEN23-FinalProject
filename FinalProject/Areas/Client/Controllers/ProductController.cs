using Microsoft.AspNetCore.Mvc;

namespace FinalProject.Areas.Client.Controllers
{
    [Area("Client")]
    [Route("Product")]
    public class ProductController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        [Route("{id}")]
        public IActionResult Details(int id)
        {
            ViewData["id"] = id;
            return View();
        }
    }
}
