﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class TCoupon
    {
        public TCoupon()
        {
            TCustomerOrderSheet = new HashSet<TCustomerOrderSheet>();
        }

        public int FSid { get; set; }
        public string FCode { get; set; }
        public DateTime FStartDate { get; set; }
        public DateTime FEndDate { get; set; }
        public byte FRatio { get; set; }
        public int FAvailableTimes { get; set; }
        public int FUsedTimes { get; set; }

        public virtual ICollection<TCustomerOrderSheet> TCustomerOrderSheet { get; set; }
    }
}