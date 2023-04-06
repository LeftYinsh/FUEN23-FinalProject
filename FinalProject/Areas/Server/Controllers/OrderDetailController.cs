using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Areas.Server.Controllers.Controllers
{
    [Area("Server")]
    public class OrderDetailController : Controller
    {
        private readonly FinalProjectContext _context;
        public OrderDetailController(FinalProjectContext context)
        {
            _context = context;
        }
        public IActionResult ListUnchecked()
        {
            FinalProjectContext db = new FinalProjectContext();
            List<COrderDetailListViewModel> model = new List<COrderDetailListViewModel>();
            var datas = (from OrderDetail in db.TOrderDetail
                         join Product in db.TProduct on OrderDetail.FProductId equals Product.FId
                         join CustomerOrderSheet in db.TCustomerOrderSheet on OrderDetail.FCustomerOrderSheetId equals CustomerOrderSheet.FId
                         join Customer in db.TCustomer on CustomerOrderSheet.FCustomerId equals Customer.FId
                         where CustomerOrderSheet.FCheckedDate == null
                         select new
                         {
                             OrderID = OrderDetail.FId,
                             CustomerLastName = Customer.FLastName,
                             CustomerFirstName = Customer.FFirstName,
                             ProductName = Product.FName,
                             OrderCheckedDate = CustomerOrderSheet.FCheckedDate

                         }).ToList();
            foreach (var data in datas)
            {
                model.Add(new COrderDetailListViewModel()
                {
                    OrderID = data.OrderID,
                    CustomerLastName = data.CustomerLastName,
                    CustomerFirstName = data.CustomerFirstName,
                    TravelName = data.ProductName,
                    OrderCheckedDate = data.OrderCheckedDate
                });
            }


            return View(model);
        }

        public IActionResult ListChecked()
        {
            FinalProjectContext db = new FinalProjectContext();
            List<COrderDetailListViewModel> model = new List<COrderDetailListViewModel>();
            var datas = (from OrderDetail in db.TOrderDetail
                         join Product in db.TProduct on OrderDetail.FProductId equals Product.FId
                         join CustomerOrderSheet in db.TCustomerOrderSheet on OrderDetail.FCustomerOrderSheetId equals CustomerOrderSheet.FId
                         join Customer in db.TCustomer on CustomerOrderSheet.FCustomerId equals Customer.FId
                         where CustomerOrderSheet.FCheckedDate != null
                         select new
                         {
                             OrderID = OrderDetail.FId,
                             CustomerLastName = Customer.FLastName,
                             CustomerFirstName = Customer.FFirstName,
                             TravelName = Product.FName,
                             OrderCheckedDate = CustomerOrderSheet.FCheckedDate

                         }).ToList();
            foreach (var data in datas)
            {
                model.Add(new COrderDetailListViewModel()
                {
                    OrderID = data.OrderID,
                    CustomerLastName = data.CustomerLastName,
                    CustomerFirstName = data.CustomerFirstName,
                    TravelName = data.TravelName,
                    OrderCheckedDate = data.OrderCheckedDate
                });
            }


            return View(model);
        }

        public IActionResult Confirm(int? id)
        {
            if (id != null)
            {
                TCustomerOrderSheet x = _context.TCustomerOrderSheet.FirstOrDefault(t => t.FId == id);
                if (x != null)
                    x.FCheckedDate = DateTime.Now;
                _context.SaveChangesAsync();
            }
            return RedirectToAction("List_uncheck");
        }
    }
}
