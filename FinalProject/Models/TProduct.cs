﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class TProduct
    {
        public TProduct()
        {
            TOrderDetail = new HashSet<TOrderDetail>();
            TProductReport = new HashSet<TProductReport>();
            TProductReview = new HashSet<TProductReview>();
            TProductsTag = new HashSet<TProductsTag>();
            TShoppingCart = new HashSet<TShoppingCart>();
        }

        public int FId { get; set; }
        public string FName { get; set; }
        public byte FPeriodId { get; set; }
        public decimal FCost { get; set; }
        public decimal FPrice { get; set; }
        public int FStocks { get; set; }
        public string FDescription { get; set; }
        public string FImagePath { get; set; }
        public byte FMinParticipants { get; set; }
        public byte FMaxParticipants { get; set; }
        public string FAssemblyPoint { get; set; }
        public DateTime FStartDate { get; set; }
        public DateTime FEndDate { get; set; }
        public int FProviderId { get; set; }
        public bool FRemoved { get; set; }
        public string FRemark { get; set; }
        public DateTime FCreationDate { get; set; }
        public DateTime FLastUpdateDate { get; set; }

        public virtual TPeriod FPeriod { get; set; }
        public virtual TProvider FProvider { get; set; }
        public virtual ICollection<TOrderDetail> TOrderDetail { get; set; }
        public virtual ICollection<TProductReport> TProductReport { get; set; }
        public virtual ICollection<TProductReview> TProductReview { get; set; }
        public virtual ICollection<TProductsTag> TProductsTag { get; set; }
        public virtual ICollection<TShoppingCart> TShoppingCart { get; set; }
    }
}