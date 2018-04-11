using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SmartPay.Models
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        public WebService()
        {
            //Uncomment the following line if using designed components  
            //InitializeComponent();  
        }
        [WebMethod]
        public int DaysUntil(DateTime date)
        {
            return DaysUntilDate(date.Month, date.Day);
        }
        private int DaysUntilDate(int month, int day)
        {
            DateTime targetDate;
            targetDate = DateTime.Parse(DateTime.Today.Year.ToString()
            + "/" + month.ToString() + "/" + day.ToString());
            if (DateTime.Today > targetDate)
            {
                targetDate = targetDate.AddYears(1);
            }
            TimeSpan timeUntil = targetDate - DateTime.Today;
            return timeUntil.Days;
        }
    }
}
