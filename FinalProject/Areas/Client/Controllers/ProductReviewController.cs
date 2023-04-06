using Microsoft.AspNetCore.Mvc;

namespace FinalProject.Areas.Client.Controllers
{
    [Area("Client")]
    public class ProductReviewController : Controller
    {
        public IActionResult ProductReview()
        {
            return View();
        }
    }
}
