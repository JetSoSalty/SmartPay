using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartPay.Models;

namespace SmartPay.Restricted
{
    public partial class Bill_View : System.Web.UI.Page
    {
        public int Bill_id { get; set; }
        public int Cust_id { get; set; }
        public String Cust_name { get; set; }
        public DateTime StatementDate { get; set; }
        public DateTime Due_date { get; set; }
        public float amt { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            int x = 0;
            Bill_View bill = new Bill_View();
            bill.Bill_id = 134;
            
            if (Int32.TryParse(Session["Cust_num"].ToString(), out x))
            {
                bill.Cust_id = x;
            }

            bill.Cust_name = Session["Firstname"].ToString();
            bill.StatementDate = DateTime.Today;
            bill.Due_date = DateTime.Now.AddDays(28);
            bill.amt = 15000.00F;
        }
    }
}