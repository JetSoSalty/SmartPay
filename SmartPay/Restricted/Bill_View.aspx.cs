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
            int x;

        protected void Page_Load(object sender, EventArgs e)
        {
            //your linq select code or whatever here...
            if (Int32.TryParse(Session["Customer_ID"].ToString(), out x))
            {
                var bills = Models.LinqQueries.view_billArchive(x);
                BillViewGV.DataSource = bills;
                BillViewGV.DataBind();
            }

        }

        protected void PayBill_Click(object sender, EventArgs e)
        {
            decimal amount = 15000.00m;
            DateTime Payment_date = DateTime.Now;
            int acct_num = Models.LinqQueries.get_User_acct(x);
            Decimal Acct_balance = Models.LinqQueries.get_user_balance(x);
            int lime_balance = Models.LinqQueries.get_lime_balance(1);
            Models.LinqQueries.Make_payment(x, acct_num, amount, Acct_balance, Payment_date, "WTDRW");
            Models.LinqQueries.Recieve_Payments(1, 1, amount, lime_balance, Payment_date, "DEP");
            //rebinding after refresh
            var bills = Models.LinqQueries.view_billArchive(x);
            BillViewGV.DataSource = bills;
            BillViewGV.DataBind();
        }
    }
}