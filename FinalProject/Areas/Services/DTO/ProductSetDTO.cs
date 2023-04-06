namespace FinalProject.Areas.Services.DTO
{
    public class ProductSetDTO
    {
        public int FId { get; set; }
        public int FCustomerId { get; set; }
        public string? FName { get; set; }
        public int? FPurchaseQuantity { get; set; }
        public decimal? FPrice { get; set; }
        public string? FImagePath { get; set; }
        public byte? FPeriodId { get; set; }
        public DateTime? FTravelDate { get; set; }
        public bool? FPeriod1 { get; set; }
        public bool? FPeriod2 { get; set; }
        public bool? FPeriod3 { get; set; }
    }
}
