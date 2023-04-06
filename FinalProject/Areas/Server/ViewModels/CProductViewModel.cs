using FinalProject.Models;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace FinalProject.Areas.Server.ViewModels
{
    public class CProductViewModel
    {
        private TProduct _product;
        public TProduct product
        {
            get { return _product; }
            set { _product = value; }
        }
        public CProductViewModel()
        {
            _product = new TProduct();
        }
        [DisplayName("商品編號")]
        public int FId
        {
            get { return _product.FId; }
            set { _product.FId = value; }
        }
        [DisplayName("名稱")]
        [Required(ErrorMessage = "不可空白!")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FName
        {
            get { return _product.FName; }
            set { _product.FName = value; }
        }
        [DisplayName("時段編號")]
        [Required(ErrorMessage = "不可空白!")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public byte FPeriodId
        {
            get { return _product.FPeriodId; }
            set { _product.FPeriodId = value; }
        }
        [DisplayName("時段")]
        public string FPeriod { get; set; }
        [DisplayName("成本")]
        [Required(ErrorMessage = "不可空白!")]
        [RegularExpression(@"^\d+$", ErrorMessage = "{0}必須是正整數")]
        [Range(1, int.MaxValue, ErrorMessage = "{0}範圍為{1}到{2}。")]
        public decimal FCost
        {
            get { return _product.FCost; }
            set { _product.FCost = value; }
        }
        [DisplayName("售價")]
        [Required(ErrorMessage = "不可空白!")]
        [RegularExpression(@"^\d+$", ErrorMessage = "{0}必須是正整數")]
        [Range(1, int.MaxValue, ErrorMessage = "{0}範圍為{1}到{2}。")]
        public decimal FPrice
        {
            get { return _product.FPrice; }
            set { _product.FPrice = value; }
        }
        [DisplayName("庫存")]
        [Required(ErrorMessage = "不可空白!")]
        [RegularExpression(@"^\d+$", ErrorMessage = "{0}必須是正整數")]
        [Range(1, 1000, ErrorMessage = "{0}範圍為{1}到{2}。")]
        public int FStocks
        {
            get { return _product.FStocks; }
            set { _product.FStocks = value; }
        }
        [DisplayName("商品描述")]
        [Required(ErrorMessage = "不可空白!")]
        [StringLength(255, ErrorMessage = "{0}不可超過{1}字")]
        public string FDescription
        {
            get { return _product.FDescription; }
            set { _product.FDescription = value; }
        }
        [DisplayName("圖片")]
        public string FImagePath
        {
            get { return _product.FImagePath; }
            set { _product.FImagePath = value; }
        }
        [DisplayName("最少參加人數")]
        [Required(ErrorMessage = "不可空白!")]
        [RegularExpression(@"^\d+$", ErrorMessage = "必須是正整數")]
        [Range(1, byte.MaxValue, ErrorMessage = "{0}為{1}到{2}人。")]
        public byte FMinParticipants
        {
            get { return _product.FMinParticipants; }
            set { _product.FMinParticipants = value; }
        }
        [DisplayName("最多參加人數")]
        [Required(ErrorMessage = "不可空白!")]
        [RegularExpression(@"^\d+$", ErrorMessage = "必須是正整數")]
        [Range(1, byte.MaxValue, ErrorMessage = "{0}為{1}到{2}人。")]
        public byte FMaxParticipants
        {
            get { return _product.FMaxParticipants; }
            set { _product.FMaxParticipants = value; }
        }
        [DisplayName("集合地點")]
        [Required(ErrorMessage = "不可空白!")]
        [StringLength(100, ErrorMessage = "{0}不可超過{1}字")]
        public string FAssemblyPoint
        {
            get { return _product.FAssemblyPoint; }
            set { _product.FAssemblyPoint = value; }
        }
        [DisplayName("販售開始時間")]
        [Required(ErrorMessage = "不可空白!")]
        public DateTime FStartDate
        {
            get { return _product.FStartDate; }
            set { _product.FStartDate = value; }
        }
        public static DateTime _fStartDate = DateTime.Now;

        [DisplayName("販售截止時間")]
        [Required(ErrorMessage = "不可空白!")]
        public DateTime FEndDate
        {
            get { return _product.FEndDate; }
            set { _product.FEndDate = value; }
        }
        [DisplayName("供應商編號")]
        [Required(ErrorMessage = "不可空白!")]
        public int FProviderId
        {
            get { return _product.FProviderId; }
            set { _product.FProviderId = value; }
        }
        [DisplayName("供應商")]
        public string FProvider { get; set; }
        [DisplayName("商品標籤")]
        public string? FTag { get; set; }
        [DisplayName("備註")]
        [StringLength(255, ErrorMessage = "{0}不可超過{1}字")]
        public string? FRemark
        {
            get { return _product.FRemark; }
            set { _product.FRemark = value; }
        }
        [DisplayName("商品建立時間")]
        public DateTime FCreationDate
        {
            get { return _product.FCreationDate; }
            set { _product.FCreationDate = value; }
        }
        [DisplayName("商品更新時間")]
        public DateTime FLastUpdateDate
        {
            get { return _product.FLastUpdateDate; }
            set { _product.FLastUpdateDate = value; }
        }
        public IFormFile photo { get; set; }
    }
}
