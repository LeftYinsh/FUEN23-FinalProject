namespace FinalProject.Areas.Services.DTO
{
    public class ShoppingCartDTO
    {
        public int FSid { get; set; }
        public int FProductId { get; set; }
        public string? FName { get; set; }
        public string? FTravelDate { get; set; }
        public string? FPeriod { get; set; }
        public int? FPurchaseQuantity { get; set; }
        public decimal? FPrice { get; set;}
        public string? FImagePath { get; set; }
    }
}
