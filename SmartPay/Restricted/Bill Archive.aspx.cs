using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartPay.Restricted
{
    public partial class Bill_Archive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }

        protected void searchbtn_Click(object sender, EventArgs e)
        {

            int customer_id;
            
            customer_id = Convert.ToInt32(UserControl1.GetCustID);
            //To use method to populate a gridview in a partial class(aka code behind) for example you can do something like this
            //get the bill
            var bills = Models.LinqQueries.view_billArchive(customer_id);

            //lets go through the bill records
            foreach (var bill in bills)
            {
                //here we can access each element if you want or...

            }
            /*Do this to populate a grid view */

            BillArchive.DataSource = bills;
            BillArchive.DataBind();
        }
    }
}