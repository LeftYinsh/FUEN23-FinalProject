using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Areas.Server.Controllers.Controllers
{
    [Area("Server")]
    public class ManagerReviewController : SuperController
    {
        private readonly FinalProjectContext _context;

        public ManagerReviewController(FinalProjectContext context)
        {
            _context = context;
        }
        public IActionResult List()
        {
            List<CManagerReviewViewModel> model = new List<CManagerReviewViewModel>();
            var datas = (from productReview in _context.TProductReview
                         join orderDetail in _context.TOrderDetail on productReview.FOrderDetailId equals orderDetail.FId
                         join product in _context.TProduct on orderDetail.FProductId equals product.FId
                         join provider in _context.TProvider on product.FProviderId equals provider.FId
                         where !product.FRemoved
                         select new
                         {
                             ReviewID = productReview.FId,
                             ProductName = product.FName,
                             ProductProvider = provider.FCompanyName,
                             ReviewContent = productReview.FReviewContent,
                             ReviewScore = productReview.FScore,
                             CreateDateTime = productReview.FCreationDate
                         }).ToList();
            foreach (var item in datas)
            {
                model.Add(new CManagerReviewViewModel()
                {
                    ReviewID = item.ReviewID,
                    ProductName = item.ProductName,
                    ProductProvider = item.ProductProvider,
                    ReviewContent = item.ReviewContent,
                    ReviewScore = item.ReviewScore,
                    CreateDateTime = item.CreateDateTime
                });
            }
            return View(model);
        }


        public IActionResult Details(int? id)
        {
            List<CManagerReviewViewModel> model = new List<CManagerReviewViewModel>();
            if (id != null)
            {
                var datas = (from productReview in _context.TProductReview
                             join orderDetail in _context.TOrderDetail on productReview.FOrderDetailId equals orderDetail.FId
                             join customerSheet in _context.TCustomerOrderSheet on orderDetail.FCustomerOrderSheetId equals customerSheet.FId
                             join customer in _context.TCustomer on customerSheet.FCustomerId equals customer.FId
                             join product in _context.TProduct on orderDetail.FProductId equals product.FId
                             join provider in _context.TProvider on product.FProviderId equals provider.FId
                             where productReview.FId == id
                             select new
                             {
                                 ReviewID = productReview.FId,
                                 ProductProviderID = provider.FId,
                                 ProductProvider = provider.FCompanyName,
                                 ProductProviderTel = provider.FContactTel,
                                 ProductProviderMobile = provider.FContactMobile,
                                 ProductProviderEmail = provider.FContactEmail,
                                 ProductID = product.FId,
                                 ProductName = product.FName,
                                 ProductDescription = product.FDescription,
                                 ProductPoint = product.FAssemblyPoint,
                                 ProductRemark = product.FRemark,
                                 CustomerID = customer.FId,
                                 CustomerLastName = customer.FLastName,
                                 CustomerFirstName = customer.FFirstName,
                                 CustomerTel = customer.FTel,
                                 CustomerMobile = customer.FMobile,
                                 CustomerEmail = customer.FEmail,
                                 ReviewScore = productReview.FScore,
                                 ReviewContent = productReview.FReviewContent,
                                 CreateDateTime = productReview.FCreationDate
                             }).ToList();
                foreach (var item in datas)
                {
                    model.Add(new CManagerReviewViewModel()
                    {
                        ReviewID = item.ReviewID,
                        ProductProviderID = item.ProductProviderID,
                        ProductProvider = item.ProductProvider,
                        ProductProviderTel = item.ProductProviderTel,
                        ProductProviderMobile = item.ProductProviderMobile,
                        ProductProviderEmail = item.ProductProviderEmail,
                        ProductID = item.ProductID,
                        ProductName = item.ProductName,
                        ProductDescription = item.ProductDescription,
                        ProductPoint = item.ProductPoint,
                        ProductRemark = item.ProductRemark,
                        CustomerID = item.CustomerID,
                        CustomerLastName = item.CustomerLastName,
                        CustomerFirstName = item.CustomerFirstName,
                        CustomerTel = item.CustomerTel,
                        CustomerMobile = item.CustomerMobile,
                        CustomerEmail = item.CustomerEmail,
                        ReviewScore = item.ReviewScore,
                        ReviewContent = item.ReviewContent,
                        CreateDateTime = item.CreateDateTime
                    });
                }
                return View(model[0]);
            }
            return RedirectToAction("List");
        }

        public ActionResult Delete(int? id)
        {
            if (id != null)
            {
                TProductReview delReview = _context.TProductReview.FirstOrDefault(t => t.FId == id);
                if (delReview != null)
                {
                    _context.TProductReview.Remove(delReview);
                    _context.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }
    }
}
