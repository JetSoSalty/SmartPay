using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartPay
{
    public partial class UserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public int GetCustID
        {
            get
            {

                return Convert.ToInt32(CustID.Text);
            }

            set
            {
                CustID.Text = value.ToString();
            }

        }
    }
}