namespace FinalProject.Areas.Services.DTO
{
    public class OrderDetailDTO
    {
		public int FId { get; set; }
		public int FProductId { get; set; }
        public string? FName { get; set; }
        public string? FTravelDate { get; set; }
        public string? FPeriod { get; set; }
        public int? FPurchaseQuantity { get; set; }
        public decimal? FPrice { get; set; }
        public string? FImagePath { get; set; }
        public string? FCouponCode { get; set; }
    }
}
