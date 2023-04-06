using FinalProject.Areas.Client.Models;
using Microsoft.AspNetCore.Mvc;

namespace FinalProject.Areas.Client.Controllers
{
    [Area("Client")]
    [Route("Customer")]
    public class CustomersController : SuperController
	{
        public IActionResult Index()
        {
            return View();
        }
	}
}
