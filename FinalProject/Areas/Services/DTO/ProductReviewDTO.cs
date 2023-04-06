namespace FinalProject.Areas.Services.DTO
{
    public class ProductReviewDTO
    {
        public int FId { get; set; }
        public int? FOrderDetailId { get; set; }
		public byte? FScore { get; set; }
        public string? FCreationDate { get; set; }
        public string? FReviewContent { get; set; }
        public string? FLastName { get; set; }
        public string? FFirstName { get; set; }
        public int? FProductId { get; set; }
    }
}
