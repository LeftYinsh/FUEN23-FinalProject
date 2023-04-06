using Azure;
using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;
using System;
using System.Data;
using System.Transactions;
using System.Drawing;


namespace FinalProject.Areas.Server.Controllers.Controllers
{
	[Area("Server")]
	public class ProductController : SuperController
    {
        private readonly FinalProjectContext _context;
        IWebHostEnvironment _environment;

        public ProductController(FinalProjectContext context, IWebHostEnvironment p)
        {
            _environment = p;
            _context = context;
        }
        public IActionResult List()
        {
            List<CProductViewModel> model = new List<CProductViewModel>();
            var datas = (from product in _context.TProduct
                         join period in _context.TPeriod on product.FPeriodId equals period.FId
                         join provider in _context.TProvider on product.FProviderId equals provider.FId
                         where IsAdmin(this) ? !product.FRemoved : !product.FRemoved & (provider.FId == FetchProviderId(this))
                         select new
                         {
                             product = product,
                             FPeriod = period.FDescription,
                             FProvider = provider.FCompanyName,
                         }).ToList();
            foreach (var item in datas)
            {
                model.Add(new CProductViewModel()
                {
                    product = item.product,
                    FPeriod = item.FPeriod,
                    FProvider = item.FProvider,
                });
            }
            return View(model);
        }

        public IActionResult Details(int? id)
        {
            if (id != null)
            {
                List<CProductViewModel> model = new List<CProductViewModel>();
                var datas = (from product in _context.TProduct
                             join period in _context.TPeriod on product.FPeriodId equals period.FId
                             join provider in _context.TProvider on product.FProviderId equals provider.FId
                             where IsAdmin(this) ? product.FId == id : product.FId == id & (provider.FId == FetchProviderId(this))
                             select new
                             {
                                 FId = product.FId,
                                 FName = product.FName,
                                 FPeriod = period.FDescription,
                                 FCost = product.FCost,
                                 FPrice = product.FPrice,
                                 FStocks = product.FStocks,
                                 FDescription = product.FDescription,
                                 FImagePath = product.FImagePath,
                                 FMinParticipants = product.FMinParticipants,
                                 FMaxParticipants = product.FMaxParticipants,
                                 FAssemblyPoint = product.FAssemblyPoint,
                                 FStartDate = product.FStartDate,
                                 FEndDate = product.FEndDate,
                                 FProvider = provider.FCompanyName,
                                 FRemark = product.FRemark,
                                 FCreationDate = product.FCreationDate,
                                 FLastUpdateDate = product.FLastUpdateDate
                             }).ToList();
                if (datas.Count > 0)
                {
                    foreach (var item in datas)
                    {
                        var tagDatas = (from productTag in _context.TProductsTag
                                        join product in _context.TProduct on productTag.FProductId equals product.FId
                                        join tag in _context.TTag on productTag.FTagId equals tag.FId
                                        where product.FId == item.FId
                                        select tag.FDescription).ToList();
                        model.Add(new CProductViewModel()
                        {
                            FId = item.FId,
                            FName = item.FName,
                            FPeriod = item.FPeriod,
                            FCost = item.FCost,
                            FPrice = item.FPrice,
                            FStocks = item.FStocks,
                            FDescription = item.FDescription,
                            FImagePath = item.FImagePath,
                            FMinParticipants = item.FMinParticipants,
                            FMaxParticipants = item.FMaxParticipants,
                            FAssemblyPoint = item.FAssemblyPoint,
                            FStartDate = item.FStartDate,
                            FEndDate = item.FEndDate,
                            FProvider = item.FProvider,
                            FRemark = item.FRemark,
                            FCreationDate = item.FCreationDate,
                            FLastUpdateDate = item.FLastUpdateDate
                        });
                        
                        if(tagDatas.Count > 0)
                        {
                            string temp = "";
                            foreach (var tagItem in tagDatas)
                            {
                                temp += $"{tagItem}、";
                            }
                            model[0].FTag = temp.Substring(0, temp.Length - 1);
                        }
                    }
                    return View(model[0]);
                }
            }
            return RedirectToAction("List");
        }
        public IActionResult Create()
        {
            var tpDatas = (from tp in _context.TProvider
                           where (IsAdmin(this) ? true : tp.FId == FetchProviderId(this))
                           select new
                           {
                               tp.FId,
                               tp.FCompanyName,
                           }).ToList();
            ViewBag.tpDatas = tpDatas;
            return View();
        }

        [HttpPost]
        public IActionResult Create(CProductViewModel vm)
        {
            TProduct p = new TProduct();
            if (vm.photo != null)
            {
                string photoName = Guid.NewGuid().ToString() + ".jpg";
                string path = _environment.WebRootPath + "/images/" + photoName;
                p.FImagePath = photoName;
                vm.photo.CopyTo(new FileStream(path, FileMode.Create));
            }
            p.FName = vm.FName;
            p.FPeriodId = vm.FPeriodId;
            p.FCost = vm.FCost;
            p.FPrice = vm.FPrice;
            p.FStocks = vm.FStocks;
            p.FDescription = vm.FDescription;
            p.FMinParticipants = vm.FMinParticipants;
            p.FMaxParticipants = vm.FMaxParticipants;
            p.FAssemblyPoint = vm.FAssemblyPoint;
            p.FStartDate = vm.FStartDate;
            p.FEndDate = vm.FEndDate;
            p.FProviderId = vm.FProviderId;
            p.FRemark = vm.FRemark;
            p.FRemoved = false;
            p.FCreationDate = DateTime.Now;
            p.FLastUpdateDate = DateTime.Now;
            _context.TProduct.Add(p);
            _context.SaveChanges();
            return RedirectToAction("List");
        }
        public async Task<IActionResult> Delete(int? id)
        {
            if (id != null)
            {
                TProduct RemovedProduct = (IsAdmin(this) ? _context.TProduct.FirstOrDefault(t => t.FId == id) : _context.TProduct.FirstOrDefault(t => t.FId == id && t.FProvider.FId == FetchProviderId(this)));
                if (RemovedProduct != null)
                {
                    RemovedProduct.FRemoved = true;
                    await _context.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }
        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                TProduct p = _context.TProduct.FirstOrDefault(t => t.FId == id);
                if (p != null)
                {
                    TProvider pv = _context.TProvider.FirstOrDefault(t => t.FId == p.FProviderId);
                    TPeriod pd = _context.TPeriod.FirstOrDefault(t => t.FId == p.FPeriodId);
                    CProductViewModel vm = new CProductViewModel();
                    vm.FId = p.FId;
                    vm.FName = p.FName;
                    vm.FPeriodId = p.FPeriodId;
                    vm.FCost = p.FCost;
                    vm.FPrice = p.FPrice;
                    vm.FStocks = p.FStocks;
                    vm.FDescription = p.FDescription;
                    vm.FImagePath = p.FImagePath;
                    vm.FMinParticipants = p.FMinParticipants;
                    vm.FMaxParticipants = p.FMaxParticipants;
                    vm.FAssemblyPoint = p.FAssemblyPoint;
                    vm.FStartDate = p.FStartDate;
                    vm.FEndDate = p.FEndDate;
                    vm.FProviderId = p.FProviderId;
                    vm.FRemark = p.FRemark;
                    vm.FCreationDate = p.FCreationDate;
                    vm.FLastUpdateDate = p.FLastUpdateDate;
                    vm.FProvider = pv.FCompanyName;
                    vm.FPeriod = pd.FDescription;
                    return View(vm);
                }
            }
            return RedirectToAction("List");
        }

        [HttpPost]
        public async Task<IActionResult> Edit(CProductViewModel vm)
        {
            TProduct p = _context.TProduct.FirstOrDefault(t => t.FId == vm.FId);
            if (p != null)
            {
                if (vm.photo != null)
                {
                    string photoName = Guid.NewGuid().ToString() + ".jpg";
                    string path = _environment.WebRootPath + "/images/" + photoName;
                    p.FImagePath = photoName;
                    vm.photo.CopyTo(new FileStream(path, FileMode.Create));
                }
                p.FCost = vm.FCost;
                p.FPrice = vm.FPrice;
                p.FStocks = vm.FStocks;
                p.FDescription = vm.FDescription;
                p.FMinParticipants = vm.FMinParticipants;
                p.FMaxParticipants = vm.FMaxParticipants;
                p.FAssemblyPoint = vm.FAssemblyPoint;
                p.FStartDate = vm.FStartDate;
                p.FEndDate = vm.FEndDate;
                p.FRemark = vm.FRemark;
                p.FLastUpdateDate = DateTime.Now;
                await _context.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }
    }
}
