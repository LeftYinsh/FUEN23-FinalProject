namespace FinalProject.Areas.Services.DTO
{
    public class AddToCartDTO
    {
        public int FSid { get; set; }
        public int FCustomerId { get; set; }
        public int FProductId { get; set;}
        public int FPurchaseQuantity { get; set; }
        public DateTime FTravelDate { get; set; }
    }
}
