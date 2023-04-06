using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Areas.Server.Controllers.Controllers
{
    [Area("Server")]
    public class CustomerController : SuperController
    {
        private readonly FinalProjectContext _context;
        public CustomerController(FinalProjectContext context)
        {
            _context = context;
        }

        public IActionResult List()
        {
            if (IsAdmin(this))
            {
                List<CCustomerViewModel> model = new List<CCustomerViewModel>();
                var datas = (from customer in _context.TCustomer
                             join gender in _context.TGender on customer.FGender equals gender.FId
                             select new
                             {
                                 FCustomerId = customer.FId,
                                 customer.FLastName,
                                 customer.FFirstName,
                                 FGender = gender.FDescription,
                                 customer.FTel,
                                 customer.FMobile,
                                 customer.FEmail,
                                 customer.FPassword,
                                 customer.FBirthDate
                             }).ToList();
                foreach (var item in datas)
                {
                    model.Add(new CCustomerViewModel()
                    {
                        FCustomerId = item.FCustomerId,
                        FLastName = item.FLastName,
                        FFirstName = item.FFirstName,
                        FGender = item.FGender,
                        FTel = item.FTel,
                        FMobile = item.FMobile,
                        FEmail = item.FEmail,
                        FPassword = item.FPassword,
                        FBirthDate = item.FBirthDate
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
        public IActionResult Create(TCustomer p)
        {
            if (IsAdmin(this))
            {
                p.FCreationDate = DateTime.Now;
                p.FLastUpdateDate = DateTime.Now;
                _context.TCustomer.Add(p);
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
                    TCustomer delCustomer = _context.TCustomer.FirstOrDefault(t => t.FId == id);
                    if (delCustomer != null)
                    {
                        _context.TCustomer.Remove(delCustomer);
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
            if (IsAdmin(this))
            {
                if (id != null)
                {
                    TCustomer x = _context.TCustomer.FirstOrDefault(t => t.FId == id);
                    if (x != null)
                    {
                        CCustomerViewModel p = new CCustomerViewModel();
                        p.FCustomerId = x.FId;
                        p.FLastName = x.FLastName;
                        p.FFirstName = x.FFirstName;
                        p.FGenderId = x.FGender;
                        p.FTel = x.FTel;
                        p.FMobile = x.FMobile;
                        p.FEmail = x.FEmail;
                        p.FPassword = x.FPassword;
                        p.FBirthDate = x.FBirthDate;
                        p.FPoint = x.FPoint;
                        p.FRemark = x.FRemark;
                        p.FBlackList = x.FBlackList;
                        p.FCreationDate = x.FCreationDate;
                        p.FLastUpdateDate = x.FLastUpdateDate;

                        return View(p);
                    }
                }
                return RedirectToAction("List");
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        public async Task<IActionResult> Edit(CCustomerViewModel p)
        {
            if (IsAdmin(this))
            {
                TCustomer x = _context.TCustomer.FirstOrDefault(t => t.FId == p.FCustomerId);
                if (x != null)
                {
                    x.FFirstName = p.FFirstName;
                    x.FLastName = p.FLastName;
                    x.FTel = p.FTel;
                    x.FMobile = p.FMobile;
                    x.FEmail = p.FEmail;
                    x.FPassword = p.FPassword;
                    x.FBirthDate = p.FBirthDate;
                    x.FPoint = p.FPoint;
                    x.FRemark = p.FRemark;
                    x.FBlackList = p.FBlackList;
                    x.FLastUpdateDate = DateTime.Now;
                    await _context.SaveChangesAsync();
                }
                return RedirectToAction("List");
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        public IActionResult Details(int? id)
        {
            if (IsAdmin(this))
            {
                if (id != null)
                {
                    List<CCustomerViewModel> model = new List<CCustomerViewModel>();
                    var datas = (from customer in _context.TCustomer
                                 join gender in _context.TGender on customer.FGender equals gender.FId
                                 where customer.FId == id
                                 select new
                                 {
                                     FCustomerId = customer.FId,
                                     customer.FLastName,
                                     customer.FFirstName,
                                     FGender = gender.FDescription,
                                     customer.FTel,
                                     customer.FMobile,
                                     customer.FEmail,
                                     customer.FPassword,
                                     customer.FBirthDate,
                                     customer.FPoint,
                                     customer.FBlackList,
                                     customer.FRemark,
                                     customer.FCreationDate,
                                     customer.FLastUpdateDate
                                 }).ToList();
                    foreach (var item in datas)
                    {
                        model.Add(new CCustomerViewModel()
                        {
                            FCustomerId = item.FCustomerId,
                            FLastName = item.FLastName,
                            FFirstName = item.FFirstName,
                            FGender = item.FGender,
                            FTel = item.FTel,
                            FMobile = item.FMobile,
                            FEmail = item.FEmail,
                            FPassword = item.FPassword,
                            FBirthDate = item.FBirthDate,
                            FPoint = item.FPoint,
                            FBlackList = item.FBlackList,
                            FRemark = item.FRemark,
                            FCreationDate = item.FCreationDate,
                            FLastUpdateDate = item.FLastUpdateDate
                        });
                    }
                    return View(model[0]);
                }
                return RedirectToAction("List");
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
    }
}
