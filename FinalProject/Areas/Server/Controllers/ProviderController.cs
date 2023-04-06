using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace FinalProject.Areas.Server.Controllers.Controllers
{
    [Area("Server")]
    public class ProviderController : SuperController
    {
        private readonly FinalProjectContext _context;
        public ProviderController(FinalProjectContext context)
        {
            _context = context;
        }
        public IActionResult List()
        {
            if (IsAdmin(this))
            {
                List<CProviderViewModel> model = new List<CProviderViewModel>();
                var datas = from t in _context.TProvider select t;
                foreach (var item in datas)
                {
                    model.Add(new CProviderViewModel()
                    {
                        FId = item.FId,
                        FCompanyName = item.FCompanyName,
                        FOwnerName = item.FOwnerName,
                        FContactName = item.FContactName,
                        FContactTel = item.FContactTel,
                        FContactMobile = item.FContactMobile,
                        FContactEmail = item.FContactEmail,
                        FAddress = item.FAddress,
                    });
                }
                return View(model);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        public IActionResult Create()
        {
            if (IsAdmin(this))
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        public IActionResult Create(TProvider p)
        {
            if (IsAdmin(this))
            {
                p.FCreationDate = DateTime.Now;
                p.FLastUpdateDate = DateTime.Now;
                _context.TProvider.Add(p);
                _context.SaveChanges();
                return RedirectToAction("List");
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (IsAdmin(this))
            {
                if (id != null)
                {
                    TProvider delProvider = _context.TProvider.FirstOrDefault(t => t.FId == id);
                    if (delProvider != null)
                    {
                        _context.TProvider.Remove(delProvider);
                        await _context.SaveChangesAsync();
                    }
                }
                return RedirectToAction("List");
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        public IActionResult Edit(int? id)
        {
            if (IsAdmin(this) && id != FetchProviderId(this))
            {
                return RedirectToAction("Edit", new { id = FetchProviderId(this) });
            }
            if (id != null)
            {
                TProvider x = _context.TProvider.FirstOrDefault(t => t.FId == id);
                if (x != null)
                {
                    CProviderViewModel p = new CProviderViewModel();
                    p.FId = x.FId;
                    p.FCompanyName = x.FCompanyName;
                    p.FPassword = x.FPassword;
                    p.FTaxId = x.FTaxId;
                    p.FFax = x.FFax;
                    p.FOwnerName = x.FOwnerName;
                    p.FOwnerTel = x.FOwnerTel;
                    p.FOwnerMobile = x.FOwnerMobile;
                    p.FOwnerEmail = x.FOwnerEmail;
                    p.FContactName = x.FContactName;
                    p.FContactTel = x.FContactTel;
                    p.FContactMobile = x.FContactMobile;
                    p.FContactEmail = x.FContactEmail;
                    p.FAddress = x.FAddress;
                    p.FBankName = x.FBankName;
                    p.FBankDivisionName = x.FBankDivisionName;
                    p.FBankAccountNumber = x.FBankAccountNumber;
                    p.FBankAccountName = x.FBankAccountName;
                    p.FBlackList = x.FBlackList;
                    p.FRemark = x.FRemark;
                    p.FCreationDate = x.FCreationDate;
                    p.FLastUpdateDate = x.FLastUpdateDate;

                    return View(p);
                }
            }
            return IsAdmin(this) ? RedirectToAction("List") : RedirectToAction("Details", new { id = FetchProviderId(this) });
        }

        [HttpPost]
        public async Task<IActionResult> Edit(CProviderViewModel p)
        {
            TProvider x = _context.TProvider.FirstOrDefault(t => t.FId == p.FId);
            if (x != null)
            {
                x.FCompanyName = p.FCompanyName;
                x.FPassword = p.FPassword;
                x.FTaxId = p.FTaxId;
                x.FFax = p.FFax;
                x.FOwnerName = p.FOwnerName;
                x.FOwnerTel = p.FOwnerTel;
                x.FOwnerMobile = p.FOwnerMobile;
                x.FOwnerEmail = p.FOwnerEmail;
                x.FOwnerName = p.FOwnerName;
                x.FContactTel = p.FContactTel;
                x.FContactMobile = p.FContactMobile;
                x.FContactEmail = p.FContactEmail;
                x.FAddress = p.FAddress;
                x.FBankName = p.FBankName;
                x.FBankDivisionName = p.FBankDivisionName;
                x.FBankAccountNumber = p.FBankAccountNumber;
                x.FBankAccountName = p.FBankAccountName;
                x.FBlackList = p.FBlackList;
                x.FRemark = p.FRemark;
                x.FLastUpdateDate = DateTime.Now;
                await _context.SaveChangesAsync();
            }
            return IsAdmin(this) ? RedirectToAction("List") : RedirectToAction("Details", new { id = FetchProviderId(this) });
        }


        public IActionResult Details(int? id)
        {
            if (IsAdmin(this) && id != FetchProviderId(this))
            {
                return RedirectToAction("Details", new { id = FetchProviderId(this) });
            }
            if (id != null)
            {
                List<CProviderViewModel> model = new List<CProviderViewModel>();
                var datas = from t in _context.TProvider
                            where t.FId == id
                            select t;
                foreach (var item in datas)
                {
                    model.Add(new CProviderViewModel()
                    {
                        FId = item.FId,
                        FCompanyName = item.FCompanyName,
                        FPassword = item.FPassword,
                        FTaxId = item.FTaxId,
                        FFax = item.FFax,
                        FOwnerName = item.FOwnerName,
                        FOwnerTel = item.FOwnerTel,
                        FOwnerMobile = item.FOwnerMobile,
                        FOwnerEmail = item.FOwnerEmail,
                        FContactName = item.FContactName,
                        FContactTel = item.FContactTel,
                        FContactMobile = item.FContactMobile,
                        FContactEmail = item.FContactEmail,
                        FAddress = item.FAddress,
                        FBankAccountName = item.FBankAccountName,
                        FBankDivisionName = item.FBankDivisionName,
                        FBankAccountNumber = item.FBankAccountNumber,
                        FBankName = item.FBankName,
                        FCreationDate = item.FCreationDate,
                        FLastUpdateDate = item.FCreationDate,
                        FBlackList = item.FBlackList,
                        FRemark = item.FRemark
                    });
                }
                return View(model[0]);
            }
            return RedirectToAction("List");
        }
    }
}
