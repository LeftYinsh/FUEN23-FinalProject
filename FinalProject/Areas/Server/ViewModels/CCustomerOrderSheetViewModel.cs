using System.ComponentModel;

namespace FinalProject.Areas.Server.ViewModels
{
    public class CCustomerOrderSheetViewModel
    {
        [DisplayName("訂單ID")]
        public int CustomerOrderSheetId { get; set; }

        [DisplayName("顧客ID")]
        public int CustomerId { get; set; }

        [DisplayName("訂購者姓氏")]
        public string OrderLastName { get; set; }

        [DisplayName("訂購者名稱")]
        public string OrderFirstName { get; set; }

        [DisplayName("優惠卷代碼")]
        public string? CouponCode { get; set; }

        [DisplayName("訂購日期")]
        public DateTime CreationDate { get; set; }

        [DisplayName("訂單確認日期")]
        public DateTime? CheckedDate { get; set; }

        [DisplayName("產品ID")]
        public int ProductId { get; set; }

        [DisplayName("供應商ID")]
        public int ProviderId { get; set; }

        [DisplayName("詳細訂單ID")]
        public int OrderDetailId { get; set; }

        [DisplayName("產品名稱")]
        public string ProductName { get; set; }

        [DisplayName("供應商名稱")]
        public string ProviderName { get; set; }
    }
}
