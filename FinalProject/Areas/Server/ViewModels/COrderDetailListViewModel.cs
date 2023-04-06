using System.ComponentModel;

namespace FinalProject.Areas.Server.ViewModels
{
    public class COrderDetailListViewModel
    {
        public int OrderID { get; set; }
        public string CustomerLastName { get; set; }
        public string CustomerFirstName { get; set; }
        public string TravelName { get; set; }
        public DateTime? OrderCheckedDate { get; set; }

    }
}
