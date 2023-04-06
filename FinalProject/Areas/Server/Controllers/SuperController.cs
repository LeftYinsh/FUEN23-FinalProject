using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using static FinalProject.Areas.Server.Models.CDictionary;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Areas.Server.Controllers
{
    [Area("Server")]
    public class SuperController : Controller
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);
            if ((!IsAdmin(this))&&(!IsProvider(this)))
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                {
                    controller = "Home",
                    action = "Login",
                }));
            }
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}
