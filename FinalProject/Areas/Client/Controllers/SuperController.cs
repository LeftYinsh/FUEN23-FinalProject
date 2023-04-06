using FinalProject.Areas.Client.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.DotNet.Scaffolding.Shared.Messaging;

namespace FinalProject.Areas.Client.Controllers
{
    [Area("Client")]
    public class SuperController : Controller
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);
            if (!HttpContext.Session.Keys.Contains(CDictionaryLogin.SK_LOGINED_CUSTOMER))
            {
                ViewData["alert"] = "請先登入會員";
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                {
                    controller = "Home",
                    action = "Index",
                }));
            }
        }
    }
}
