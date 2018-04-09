using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartPay.Restricted
{
    public partial class View_transaction_log : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScotiaBankDataContext dbcontext = new ScotiaBankDataContext();
            TransGV.DataSource = dbcontext.transaction_histories;
            TransGV.DataBind();
        }
    }
}