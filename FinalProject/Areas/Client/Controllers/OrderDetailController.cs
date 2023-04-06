using Microsoft.AspNetCore.Mvc;

namespace FinalProject.Areas.Client.Controllers
{
    [Area("Client")]
	[Route("OrderDetail")]
	public class OrderDetailController : SuperController
    {
        public IActionResult OrderDetail()
        {
            return View();
        }
    }
}
