using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPay.Models
{
    public class Bill_Generation
    {
        public int Bill_id { get; set; }
        public int Cust_id { get; set; }
        public String Cust_name { get; set; }
        public DateTime StatementDate { get; set; }
        public DateTime Due_date { get; set; }
        public float amt { get; set; }
    }
}