namespace FinalProject.Areas.Services.DTO
{
    public class ProductDTO
    {
        public int FProductId { get; set; }
        public string? FName { get; set; }
        public decimal? FPrice { get; set; }
        public string? FPeriod { get; set; }
        public string? FDescription { get; set;}
        public string? FImagePath { get; set; }
    }
}
