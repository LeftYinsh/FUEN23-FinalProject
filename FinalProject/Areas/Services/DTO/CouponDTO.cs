using System.ComponentModel.DataAnnotations;

namespace FinalProject.Areas.Services.DTO
{
    public class CouponDTO
    {
        public int FSid { get; set; }
        public string? FCode { get; set; }
        public DateTime FStartDate { get; set; }
        public DateTime FEndDate { get; set; }
        public byte FRatio { get; set; }
        public int FAvailableTimes { get; set; }
        public int FUsedTimes { get; set; }
    }
}
