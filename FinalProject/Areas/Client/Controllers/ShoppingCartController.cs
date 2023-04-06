using Microsoft.AspNetCore.Mvc;

namespace FinalProject.Areas.Client.Controllers
{
    [Area("Client")]
    [Route("ShoppingCart")]
    public class ShoppingCartController : SuperController
    {
        public IActionResult Cart()
        {
            return View();
        }
    }
}
