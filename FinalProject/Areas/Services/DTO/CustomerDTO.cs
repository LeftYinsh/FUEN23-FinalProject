using System.ComponentModel.DataAnnotations;

namespace FinalProject.Areas.Services.DTO
{
    public class CustomerDTO
    {
        public int FId { get; set; }
        public string? FLastName { get; set; }
        public string? FFirstName { get; set; }
        public byte? FGender { get; set; }
        public string? FTel { get; set; }
        public string? FMobile { get; set; }
        public string? FEmail { get; set; }
        public string? FPassword { get; set; }
        
        public string? FBirthDate { get; set; }

        public DateTime FNewBirthDate { get; set; }
        public int FPoint { get; set; }
        //public bool FBlackList { get; set; }
        //public string? FRemark { get; set; }
        //public DateTime FCreationDate { get; set; }
        //public DateTime FLastUpdateDate { get; set; }
    }
}
