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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //your linq select code or whatever here...

            ScotiaBankDataContext dbcontext = new ScotiaBankDataContext();
            BillViewGV.DataSource = dbcontext.Bills;
            BillViewGV.DataBind();
        }
    }
}