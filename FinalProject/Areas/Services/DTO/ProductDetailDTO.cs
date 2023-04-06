namespace FinalProject.Areas.Services.DTO
{
    public class ProductDetailDTO
    {
        public int FProductId { get; set; }
        public string? FName { get; set; }
        public decimal? FPrice { get; set; }
        public string? FPeriod { get; set; }
        public string? FDescription { get; set; }
        public string? FImagePath { get; set; }
        public byte? FMinParticipants { get; set; }
        public byte? FMaxParticipants { get; set; }
        public string? FAssemblyPoint { get; set; }
        public DateTime? FStartDate { get; set; }
        public DateTime? FEndDate { get; set;}
        public string? FProvider { get; set; }
        public string? FRemark { get; set; }
    }
}
