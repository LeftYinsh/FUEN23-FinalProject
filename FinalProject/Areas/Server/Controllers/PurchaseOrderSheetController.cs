using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Controllers
{
    [Area("Server")]
    public class PurchaseOrderSheetController : Controller
    {
        public IActionResult List()
        {
            return View();
        }
    }
}
