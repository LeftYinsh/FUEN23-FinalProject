﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class TCustomerOrderSheet
    {
        public TCustomerOrderSheet()
        {
            TOrderDetail = new HashSet<TOrderDetail>();
        }

        public int FId { get; set; }
        public int FCustomerId { get; set; }
        public string FCouponCode { get; set; }
        public DateTime FCreationDate { get; set; }
        public DateTime? FCheckedDate { get; set; }
        public bool FOrderSheetCancel { get; set; }

        public virtual TCoupon FCouponCodeNavigation { get; set; }
        public virtual TCustomer FCustomer { get; set; }
        public virtual ICollection<TOrderDetail> TOrderDetail { get; set; }
    }
}