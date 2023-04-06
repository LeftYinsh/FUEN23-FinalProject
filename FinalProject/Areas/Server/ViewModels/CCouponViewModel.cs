using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace FinalProject.Areas.Server.ViewModels
{
    public class CCouponViewModel
    {
        [DisplayName("系統編號")]
        public int FSid { get; set; }

        [DisplayName("優惠券代碼")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        [StringLength(10, MinimumLength = 10, ErrorMessage = "長度要正好10個字元。")]
        public string FCode { get; set; }

        [DisplayName("使用開始時間")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        public DateTime FStartDate { get; set; }

        [DisplayName("使用截止時間")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        public DateTime FEndDate { get; set; }

        [DisplayName("折扣幅度（%）")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        [Range(typeof(string), "1", "100", ErrorMessage = "{0}的範圍是{1}到{2}。")]

        public byte FRatio { get; set; }

        [DisplayName("可使用次數")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        public int FAvailableTimes { get; set; }

        [DisplayName("已使用次數")]
        [Required(ErrorMessage = "{0}不可為空白!")]
        public int FUsedTimes { get; set; }
    }
}
