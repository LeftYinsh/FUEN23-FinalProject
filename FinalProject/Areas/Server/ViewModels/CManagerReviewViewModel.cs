using System.ComponentModel;

namespace FinalProject.Areas.Server.ViewModels
{
    public class CManagerReviewViewModel
    {
        [DisplayName("評論編號")]
        public int ReviewID { get; set; }

        [DisplayName("供應商編號")]
        public int ProductProviderID { get; set; }

        [DisplayName("供應商名稱")]
        public string ProductProvider { get; set; }

        [DisplayName("供應商電話")]
        public string ProductProviderTel { get; set; }

        [DisplayName("供應商手機")]
        public string ProductProviderMobile { get; set; }

        [DisplayName("供應商信箱")]
        public string ProductProviderEmail { get; set; }

        [DisplayName("商品編號")]
        public int ProductID { get; set; }

        [DisplayName("商品名稱")]
        public string ProductName { get; set; }

        [DisplayName("商品描述")]
        public string ProductDescription { get; set; }

        [DisplayName("集合地點")]
        public string ProductPoint { get; set; }

        [DisplayName("備註")]
        public string ProductRemark { get; set; }

        [DisplayName("會員編號")]
        public int CustomerID { get; set; }

        [DisplayName("會員姓氏")]
        public string CustomerLastName { get; set; }

        [DisplayName("會員名字")]
        public string CustomerFirstName { get; set; }

        [DisplayName("會員電話")]
        public string CustomerTel { get; set; }

        [DisplayName("會員手機")]
        public string CustomerMobile { get; set; }

        [DisplayName("會員信箱")]
        public string CustomerEmail { get; set; }

        [DisplayName("評分")]
        public int ReviewScore { get; set; }

        [DisplayName("評論內容")]
        public string ReviewContent { get; set; }
        [DisplayName("評論時間")]
        public DateTime CreateDateTime { get; set; }
    }
}
