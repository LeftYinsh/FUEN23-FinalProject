using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using FinalProject.Areas.Server.Models;
using FinalProject.Areas.Server.ViewModels;
using static FinalProject.Models.CGlobalParameters;
using Microsoft.EntityFrameworkCore;
using System.Runtime.Intrinsics.X86;
using FinalProject.Areas.Client.Models;

namespace FinalProject.Areas.Server.Controllers.Controllers
{
    [Area("Server")]
    public class CouponController : SuperController
    {
        private readonly FinalProjectContext _context;

        public CouponController(FinalProjectContext context)
        {
            _context = context;
        }

        public IActionResult List()
        {
            List<CCouponViewModel> model = new List<CCouponViewModel>();
            var datas = from t in _context.TCoupon select t;
            foreach (var item in datas)
            {
                model.Add(new CCouponViewModel()
                {
                    FSid = item.FSid,
                    FCode = item.FCode,
                    FStartDate = item.FStartDate,
                    FEndDate = item.FEndDate,
                    FRatio = item.FRatio,
                    FAvailableTimes = item.FAvailableTimes,
                    FUsedTimes = item.FUsedTimes
                });
            }
            return View(model);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(CCouponViewModel vm)
        {
            TCoupon p = new TCoupon();
            if (IsAdmin(this))
            {
                p.FCode = vm.FCode;
                p.FStartDate = vm.FStartDate;
                p.FEndDate = vm.FEndDate;
                p.FRatio = vm.FRatio;
                p.FAvailableTimes = vm.FAvailableTimes;
                p.FUsedTimes = vm.FUsedTimes;
                _context.TCoupon.Add(p);
            }
            _context.SaveChanges();
            return RedirectToAction("List");
        }


        public IActionResult Edit(int? id)
        {
            if (id != null)
            {
                TCoupon p = _context.TCoupon.FirstOrDefault(t => t.FSid == id);
                if (p != null)
                {
                    CCouponViewModel vm = new CCouponViewModel();
                    vm.FSid = p.FSid;
                    vm.FCode = p.FCode;
                    vm.FStartDate = p.FStartDate;
                    vm.FEndDate = p.FEndDate;
                    vm.FRatio = p.FRatio;
                    vm.FAvailableTimes = p.FAvailableTimes;
                    vm.FUsedTimes = p.FUsedTimes;
                    return View(vm);
                }
            }
            return RedirectToAction("List");
        }

        [HttpPost]
        public IActionResult Edit(CCouponViewModel vm)
        {
            TCoupon p = _context.TCoupon.FirstOrDefault(t => t.FSid == vm.FSid);
            if (p != null)
            {
                p.FStartDate = vm.FStartDate;
                p.FEndDate = vm.FEndDate;
                p.FRatio = vm.FRatio;
                p.FAvailableTimes = vm.FAvailableTimes;
                p.FUsedTimes = vm.FUsedTimes;
            }
            _context.SaveChanges();
            return RedirectToAction("List");
        }
        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                TCoupon delCoupon = _context.TCoupon.FirstOrDefault(t => t.FSid == id);
                if (delCoupon != null)
                {
                    _context.TCoupon.Remove(delCoupon);
                    _context.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }
    }
}
