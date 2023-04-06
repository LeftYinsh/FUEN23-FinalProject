using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;
using System;
using System.Data;
using Microsoft.CodeAnalysis;
using Microsoft.Extensions.Hosting;

namespace FinalProject.Areas.Server.Controllers.Controllers
{
    [Area("Server")]
    public class ManagerReportController : SuperController
    {
        private readonly FinalProjectContext _context;
        public ManagerReportController(FinalProjectContext context)
        {
            _context = context;
        }

        public IActionResult List()
        {
            List<CManagerReportViewModel> model = new List<CManagerReportViewModel>();
            var datas = (from productReport in _context.TProductReport
                         join orderDetail in _context.TOrderDetail on productReport.FOrderDetailId equals orderDetail.FId
                         join customerSheet in _context.TCustomerOrderSheet on orderDetail.FCustomerOrderSheetId equals customerSheet.FId
                         join customer in _context.TCustomer on customerSheet.FCustomerId equals customer.FId
                         join product in _context.TProduct on orderDetail.FProductId equals product.FId
                         join provider in _context.TProvider on product.FProviderId equals provider.FId
                         where !product.FRemoved
                         select new
                         {
                             ReportID = productReport.FId,
                             ProductName = product.FName,
                             ProductProvider = provider.FCompanyName,
                             ReportContent = productReport.FReportContent,
                             CreateDateTime = productReport.FCreationDate
                         }).ToList();
            foreach (var item in datas)
            {
                model.Add(new CManagerReportViewModel()
                {
                    ReportID = item.ReportID,
                    ProductName = item.ProductName,
                    ProductProvider = item.ProductProvider,
                    ReportContent = item.ReportContent,
                    CreateDateTime = item.CreateDateTime
                });
            }
            return View(model);
        }

        public IActionResult Details(int? id)
        {
            List<CManagerReportViewModel> model = new List<CManagerReportViewModel>();
            if (id != null)
            {
                var datas = (from productReport in _context.TProductReport
                             join orderDetail in _context.TOrderDetail on productReport.FOrderDetailId equals orderDetail.FId
                             join customerSheet in _context.TCustomerOrderSheet on orderDetail.FCustomerOrderSheetId equals customerSheet.FId
                             join customer in _context.TCustomer on customerSheet.FCustomerId equals customer.FId
                             join product in _context.TProduct on orderDetail.FProductId equals product.FId
                             join provider in _context.TProvider on product.FProviderId equals provider.FId
                             where productReport.FId == id
                             select new
                             {
                                 ReportID = productReport.FId,
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
                                 ReportContent = productReport.FReportContent,
                                 CreateDateTime = productReport.FCreationDate
                             }).ToList();
                foreach (var item in datas)
                {
                    model.Add(new CManagerReportViewModel()
                    {
                        ReportID = item.ReportID,
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
                        ReportContent = item.ReportContent,
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
