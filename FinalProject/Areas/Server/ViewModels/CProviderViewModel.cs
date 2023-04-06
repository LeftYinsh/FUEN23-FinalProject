using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace FinalProject.Areas.Server.ViewModels
{
    public class CProviderViewModel
    {
        [DisplayName("供應商編號")]
        public int FId { get; set; }
        [DisplayName("公司名稱")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FCompanyName { get; set; }
        [DisplayName("密碼")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        [RegularExpression("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{4,}$", ErrorMessage = "4個字元以上，最少要有1個數字，大寫與小寫字母")]
        public string FPassword { get; set; }
        [DisplayName("統一編號")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]


        public string FTaxId { get; set; }
        [DisplayName("傳真號碼")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]

        public string FFax { get; set; }
        [DisplayName("公司所有人")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]

        public string FOwnerName { get; set; }
        [DisplayName("所有人電話")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        [RegularExpression("^0[0-9]-\\d{7}$", ErrorMessage = "需要0開頭的九碼，ex:06-xxxxxxx")]

        public string FOwnerTel { get; set; }
        [DisplayName("所有人手機")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        [RegularExpression("^09\\d{8}$", ErrorMessage = "需要09開頭的十碼")]
        public string FOwnerMobile { get; set; }
        [DisplayName("所有人信箱")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        [RegularExpression("^.+@[^\\.].*\\.[a-z]{2,}$", ErrorMessage = "電子郵件地址中包含『@』等..")]
        public string FOwnerEmail { get; set; }
        [DisplayName("公司聯絡人")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        public string FContactName { get; set; }
        [DisplayName("聯絡人電話")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        [RegularExpression("^0[0-9]-\\d{7}$", ErrorMessage = "需要0開頭的九碼，ex:06-xxxxxxx")]
        public string FContactTel { get; set; }
        [DisplayName("聯絡人手機")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        [RegularExpression("^09\\d{8}$", ErrorMessage = "需要09開頭的十碼")]
        public string FContactMobile { get; set; }
        [DisplayName("聯絡人信箱")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        [RegularExpression("^.+@[^\\.].*\\.[a-z]{2,}$", ErrorMessage = "電子郵件地址中包含『@』等..")]
        public string FContactEmail { get; set; }
        [DisplayName("公司地址")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        public string FAddress { get; set; }
        [DisplayName("銀行名稱")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        public string FBankName { get; set; }
        [DisplayName("銀行分行名稱")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        public string FBankDivisionName { get; set; }
        [DisplayName("銀行帳號")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        public string FBankAccountNumber { get; set; }
        [DisplayName("銀行帳號戶名")]
        [Required(AllowEmptyStrings = true, ErrorMessage = "{0}不可為空白!")]
        public string FBankAccountName { get; set; }
        [DisplayName("黑名單")]
        public bool FBlackList { get; set; }
        [DisplayName("備註")]
        public string? FRemark { get; set; }
        [DisplayName("資料建立時間")]
        public DateTime FCreationDate { get; set; }
        [DisplayName("資料最近更新時間")]
        public DateTime FLastUpdateDate { get; set; }
    }
}
