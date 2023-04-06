using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Areas.Server.Controllers.Controllers
{
    [Area("Server")]
    public class CustomerOrderSheetController : Controller
    {
        private readonly FinalProjectContext _context;
        public CustomerOrderSheetController(FinalProjectContext context)
        {
            _context = context;
        }

        public IActionResult ListUnchecked()
        {
            List<CCustomerOrderSheetViewModel> model = new List<CCustomerOrderSheetViewModel>();
            var datas = (from CustomerOrderSheet in _context.TCustomerOrderSheet
                         join Customer in _context.TCustomer on CustomerOrderSheet.FCustomerId equals Customer.FId
                         join OrderDetail in _context.TOrderDetail on CustomerOrderSheet.FId equals OrderDetail.FCustomerOrderSheetId
                         join Product in _context.TProduct on OrderDetail.FProductId equals Product.FId
                         join Provider in _context.TProvider on Product.FProviderId equals Provider.FId
                         //where CustomerOrderSheet.FCheckedDate == null && CustomerOrderSheet.FOrderSheetCancel == false
                         //where (LoginType == 1 ? !product.FRemoved : !product.FRemoved & (provider.FId == LoginID))
                         where IsAdmin(this) ? CustomerOrderSheet.FCheckedDate == null & CustomerOrderSheet.FOrderSheetCancel == false : CustomerOrderSheet.FCheckedDate == null & CustomerOrderSheet.FOrderSheetCancel == false & Provider.FId == FetchProviderId(this)
                         select new
                         {
                             CustomerOrderSheetId = CustomerOrderSheet.FId,
                             CustomerId = Customer.FId,
                             OrderLastName = Customer.FLastName,
                             OrderFirstName = Customer.FFirstName,
                             CreationDate = CustomerOrderSheet.FCreationDate,
                             CheckedDate = CustomerOrderSheet.FCheckedDate,
                             CouponCode = CustomerOrderSheet.FCouponCode
                         }).ToList();
            foreach (var item in datas)
            {
                model.Add(new CCustomerOrderSheetViewModel()
                {
                    CustomerOrderSheetId = item.CustomerOrderSheetId,
                    CustomerId = item.CustomerId,
                    OrderLastName = item.OrderLastName,
                    OrderFirstName = item.OrderFirstName,
                    CreationDate = item.CreationDate,
                    CheckedDate = item.CheckedDate,
                    CouponCode = item.CouponCode
                });
            }
            return View(model);
        }

        public IActionResult ListChecked()
        {
            List<CCustomerOrderSheetViewModel> model = new List<CCustomerOrderSheetViewModel>();
            var datas = (from CustomerOrderSheet in _context.TCustomerOrderSheet
                         join Customer in _context.TCustomer on CustomerOrderSheet.FCustomerId equals Customer.FId
                         join OrderDetail in _context.TOrderDetail on CustomerOrderSheet.FId equals OrderDetail.FCustomerOrderSheetId
                         join Product in _context.TProduct on OrderDetail.FProductId equals Product.FId
                         join Provider in _context.TProvider on Product.FProviderId equals Provider.FId
                         //where CustomerOrderSheet.FCheckedDate != null && CustomerOrderSheet.FOrderSheetCancel == false
                         where IsAdmin(this) ? CustomerOrderSheet.FCheckedDate != null & CustomerOrderSheet.FOrderSheetCancel == false : CustomerOrderSheet.FCheckedDate != null & CustomerOrderSheet.FOrderSheetCancel == false & Provider.FId == FetchProviderId(this)
                         select new
                         {
                             CustomerOrderSheetId = CustomerOrderSheet.FId,
                             CustomerId = Customer.FId,
                             OrderLastName = Customer.FLastName,
                             OrderFirstName = Customer.FFirstName,
                             CreationDate = CustomerOrderSheet.FCreationDate,
                             CheckedDate = CustomerOrderSheet.FCheckedDate,
                             CouponCode = CustomerOrderSheet.FCouponCode
                         }).ToList();
            foreach (var item in datas)
            {
                model.Add(new CCustomerOrderSheetViewModel()
                {
                    CustomerOrderSheetId = item.CustomerOrderSheetId,
                    CustomerId = item.CustomerId,
                    OrderLastName = item.OrderLastName,
                    OrderFirstName = item.OrderFirstName,
                    CreationDate = item.CreationDate,
                    CheckedDate = item.CheckedDate,
                    CouponCode = item.CouponCode
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
            return RedirectToAction("ListUnchecked");
        }

        public IActionResult DetailsUnchecked(int? id)
        {
            List<CCustomerOrderSheetViewModel> model = new List<CCustomerOrderSheetViewModel>();
            if (id != null)
            {
                var datas = (from CustomerOrderSheet in _context.TCustomerOrderSheet
                             join Customer in _context.TCustomer on CustomerOrderSheet.FCustomerId equals Customer.FId
                             join OrderDetail in _context.TOrderDetail on CustomerOrderSheet.FId equals OrderDetail.FCustomerOrderSheetId
                             join Product in _context.TProduct on OrderDetail.FProductId equals Product.FId
                             join Provider in _context.TProvider on Product.FProviderId equals Provider.FId
                             where CustomerOrderSheet.FId == id
                             select new
                             {
                                 OrderLastName = Customer.FLastName,
                                 OrderFirstName = Customer.FFirstName,
                                 ProductName = Product.FName,
                                 ProviderName = Provider.FCompanyName,
                                 CouponCode = CustomerOrderSheet.FCouponCode,
                                 CreationDate = CustomerOrderSheet.FCreationDate,
                                 CheckedDate = CustomerOrderSheet.FCheckedDate,
                                 CustomerId = Customer.FId,
                                 ProductId = Product.FId,
                                 ProviderId = Provider.FId,
                                 CustomerOrderSheetId = CustomerOrderSheet.FId,
                                 OrderDetailId = OrderDetail.FId
                             }
                             ).ToList();
                foreach (var data in datas)
                {
                    model.Add(new CCustomerOrderSheetViewModel()
                    {
                        OrderLastName = data.OrderLastName,
                        OrderFirstName = data.OrderFirstName,
                        ProductName = data.ProductName,
                        ProviderName = data.ProviderName,
                        CouponCode = data.CouponCode,
                        CreationDate = data.CreationDate,
                        CheckedDate = data.CheckedDate,
                        CustomerId = data.CustomerId,
                        ProductId = data.ProductId,
                        ProviderId = data.ProviderId,
                        CustomerOrderSheetId = data.CustomerOrderSheetId,
                        OrderDetailId = data.OrderDetailId
                    });
                }

                return View(model[0]);
            }
            return RedirectToAction("ListUnchecked");
        }

        public IActionResult DetailsChecked(int? id)
        {
            List<CCustomerOrderSheetViewModel> model = new List<CCustomerOrderSheetViewModel>();
            if (id != null)
            {
                var datas = (from CustomerOrderSheet in _context.TCustomerOrderSheet
                             join Customer in _context.TCustomer on CustomerOrderSheet.FCustomerId equals Customer.FId
                             join OrderDetail in _context.TOrderDetail on CustomerOrderSheet.FId equals OrderDetail.FCustomerOrderSheetId
                             join Product in _context.TProduct on OrderDetail.FProductId equals Product.FId
                             join Provider in _context.TProvider on Product.FProviderId equals Provider.FId
                             where CustomerOrderSheet.FId == id
                             select new
                             {
                                 OrderLastName = Customer.FLastName,
                                 OrderFirstName = Customer.FFirstName,
                                 ProductName = Product.FName,
                                 ProviderName = Provider.FCompanyName,
                                 CouponCode = CustomerOrderSheet.FCouponCode,
                                 CreationDate = CustomerOrderSheet.FCreationDate,
                                 CheckedDate = CustomerOrderSheet.FCheckedDate,
                                 CustomerId = Customer.FId,
                                 ProductId = Product.FId,
                                 ProviderId = Provider.FId,
                                 CustomerOrderSheetId = CustomerOrderSheet.FId,
                                 OrderDetailId = OrderDetail.FId
                             }
                             ).ToList();
                foreach (var data in datas)
                {
                    model.Add(new CCustomerOrderSheetViewModel()
                    {
                        OrderLastName = data.OrderLastName,
                        OrderFirstName = data.OrderFirstName,
                        ProductName = data.ProductName,
                        ProviderName = data.ProviderName,
                        CouponCode = data.CouponCode,
                        CreationDate = data.CreationDate,
                        CheckedDate = data.CheckedDate,
                        CustomerId = data.CustomerId,
                        ProductId = data.ProductId,
                        ProviderId = data.ProviderId,
                        CustomerOrderSheetId = data.CustomerOrderSheetId,
                        OrderDetailId = data.OrderDetailId
                    });
                }

                return View(model[0]);
            }
            return RedirectToAction("ListChecked");
        }

        public IActionResult UncheckOrderCancel(int? id)
        {
            {
                if (id != null)
                {
                    TCustomerOrderSheet x = _context.TCustomerOrderSheet.FirstOrDefault(t => t.FId == id);
                    if (x != null)
                        x.FOrderSheetCancel = true;
                    _context.SaveChangesAsync();
                }
                return RedirectToAction("ListUnchecked");
            }
        }

        public IActionResult CheckedOrderCancel(int? id)
        {
            {
                if (id != null)
                {
                    TCustomerOrderSheet x = _context.TCustomerOrderSheet.FirstOrDefault(t => t.FId == id);
                    if (x != null)
                        x.FOrderSheetCancel = true;
                    _context.SaveChangesAsync();
                }
                return RedirectToAction("ListChecked");
            }
        }

        public IActionResult ListCanceled()
        {
            List<CCustomerOrderSheetViewModel> model = new List<CCustomerOrderSheetViewModel>();
            var datas = (from CustomerOrderSheet in _context.TCustomerOrderSheet
                         join Customer in _context.TCustomer on CustomerOrderSheet.FCustomerId equals Customer.FId
                         join OrderDetail in _context.TOrderDetail on CustomerOrderSheet.FId equals OrderDetail.FCustomerOrderSheetId
                         join Product in _context.TProduct on OrderDetail.FProductId equals Product.FId
                         join Provider in _context.TProvider on Product.FProviderId equals Provider.FId
                         //where CustomerOrderSheet.FOrderSheetCancel == true
                         where IsAdmin(this) ? CustomerOrderSheet.FOrderSheetCancel == true : CustomerOrderSheet.FOrderSheetCancel == true & Provider.FId == FetchProviderId(this)
                         select new
                         {
                             CustomerOrderSheetId = CustomerOrderSheet.FId,
                             CustomerId = Customer.FId,
                             OrderLastName = Customer.FLastName,
                             OrderFirstName = Customer.FFirstName,
                             CreationDate = CustomerOrderSheet.FCreationDate,
                             CheckedDate = CustomerOrderSheet.FCheckedDate,
                             CouponCode = CustomerOrderSheet.FCouponCode
                         }).ToList();
            foreach (var item in datas)
            {
                model.Add(new CCustomerOrderSheetViewModel()
                {
                    CustomerOrderSheetId = item.CustomerOrderSheetId,
                    CustomerId = item.CustomerId,
                    OrderLastName = item.OrderLastName,
                    OrderFirstName = item.OrderFirstName,
                    CreationDate = item.CreationDate,
                    CheckedDate = item.CheckedDate,
                    CouponCode = item.CouponCode
                });
            }
            return View(model);
        }

        public IActionResult DetailsCanceled(int? id)
        {
            List<CCustomerOrderSheetViewModel> model = new List<CCustomerOrderSheetViewModel>();
            if (id != null)
            {
                var datas = (from CustomerOrderSheet in _context.TCustomerOrderSheet
                             join Customer in _context.TCustomer on CustomerOrderSheet.FCustomerId equals Customer.FId
                             join OrderDetail in _context.TOrderDetail on CustomerOrderSheet.FId equals OrderDetail.FCustomerOrderSheetId
                             join Product in _context.TProduct on OrderDetail.FProductId equals Product.FId
                             join Provider in _context.TProvider on Product.FProviderId equals Provider.FId
                             where CustomerOrderSheet.FId == id
                             select new
                             {
                                 OrderLastName = Customer.FLastName,
                                 OrderFirstName = Customer.FFirstName,
                                 ProductName = Product.FName,
                                 ProviderName = Provider.FCompanyName,
                                 CouponCode = CustomerOrderSheet.FCouponCode,
                                 CreationDate = CustomerOrderSheet.FCreationDate,
                                 CheckedDate = CustomerOrderSheet.FCheckedDate,
                                 CustomerId = Customer.FId,
                                 ProductId = Product.FId,
                                 ProviderId = Provider.FId,
                                 CustomerOrderSheetId = CustomerOrderSheet.FId,
                                 OrderDetailId = OrderDetail.FId
                             }
                             ).ToList();
                foreach (var data in datas)
                {
                    model.Add(new CCustomerOrderSheetViewModel()
                    {
                        OrderLastName = data.OrderLastName,
                        OrderFirstName = data.OrderFirstName,
                        ProductName = data.ProductName,
                        ProviderName = data.ProviderName,
                        CouponCode = data.CouponCode,
                        CreationDate = data.CreationDate,
                        CheckedDate = data.CheckedDate,
                        CustomerId = data.CustomerId,
                        ProductId = data.ProductId,
                        ProviderId = data.ProviderId,
                        CustomerOrderSheetId = data.CustomerOrderSheetId,
                        OrderDetailId = data.OrderDetailId
                    });
                }

                return View(model[0]);
            }
            return RedirectToAction("ListCanceled");
        }
    }
}
