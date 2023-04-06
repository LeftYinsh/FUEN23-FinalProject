using FinalProject.Models;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace FinalProject.Areas.Server.ViewModels
{
    public class CCustomerViewModel
    {
        private TCustomer _customer;
        public TCustomer customer
        {
            get { return _customer; }
            set { _customer = value; }
        }
        public CCustomerViewModel()
        {
            _customer = new TCustomer();
        }
        [DisplayName("會員編號")]
        public int FCustomerId
        {
            get { return _customer.FId; }
            set { _customer.FId = value; }
        }
        [DisplayName("姓氏")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FLastName
        {
            get { return _customer.FLastName; }
            set { _customer.FLastName = value; }
        }
        [DisplayName("名字")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FFirstName
        {
            get { return _customer.FFirstName; }
            set { _customer.FFirstName = value; }
        }
        [DisplayName("性別")]
        public string FGender { get; set; }
        [DisplayName("性別編號")]
        public byte FGenderId
        {
            get { return _customer.FGender; }
            set { _customer.FGender = value; }
        }
        [DisplayName("電話號碼")]
        [RegularExpression("^0[0-9]\\d{7}d?$", ErrorMessage = "需要0開頭的九或十碼")]
        [Required(ErrorMessage = "{0}不可為空白!")]

        public string FTel
        {
            get { return _customer.FTel; }
            set { _customer.FTel = value; }
        }
        [DisplayName("手機號碼")]
        [RegularExpression("^09\\d{8}$", ErrorMessage = "需要09開頭的十碼")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        public string FMobile
        {
            get { return _customer.FMobile; }
            set { _customer.FMobile = value; }
        }
        [DisplayName("電子信箱")]
        //[RegularExpression("^.+@[^\\.].*\\.[a-z]{2,}$", ErrorMessage = "電子郵件地址中包含『@』等..")]
        [EmailAddress]
        [Required(ErrorMessage = "{0}不可為空白!")]
        public string FEmail
        {
            get { return _customer.FEmail; }
            set { _customer.FEmail = value; }
        }
        [DisplayName("密碼")]
        [RegularExpression("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{4,}$", ErrorMessage = "4個字元以上，最少要有1個數字，大寫與小寫字母")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        public string FPassword
        {
            get { return _customer.FPassword; }
            set { _customer.FPassword = value; }
        }
        [DisplayName("生日")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        public DateTime FBirthDate
        {
            get { return _customer.FBirthDate; }
            set { _customer.FBirthDate = value; }
        }
        [DisplayName("點數")]
        [Required(ErrorMessage = "{0}最少0")]
        public int FPoint
        {
            get { return _customer.FPoint; }
            set { _customer.FPoint = value; }
        }
        [DisplayName("黑名單")]

        public bool FBlackList
        {
            get { return _customer.FBlackList; }
            set { _customer.FBlackList = value; }
        }
        [DisplayName("備註")]
        public string? FRemark
        {
            get { return _customer.FRemark; }
            set { _customer.FRemark = value; }
        }
        [DisplayName("資料建立日期")]
        //[DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        public DateTime FCreationDate
        {
            get { return _customer.FCreationDate; }
            set { _customer.FCreationDate = value; }
        }
        [DisplayName("資料更新日期")]
        //[DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]

        public DateTime FLastUpdateDate
        {
            get { return _customer.FLastUpdateDate; }
            set { _customer.FLastUpdateDate = value; }
        }
    }
}
