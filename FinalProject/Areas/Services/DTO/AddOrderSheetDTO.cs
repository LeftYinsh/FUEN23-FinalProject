namespace FinalProject.Areas.Services.DTO
{
    public class AddOrderSheetDTO
    {
        // customerordersheet
        public int FId { get; set; }
        public int? FCustomerId { get; set; }
        public string? FCouponCode { get; set; }
        public DateTime? FCreationDate { get; set; }
        public DateTime? FCheckedDate { get; set; }
        public bool? FOrderSheetCancel { get; set; }
    }
}
