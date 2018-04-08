using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPay.Models
{
    /*Since you're having a hard time I suggest creating stored procedure to do the basic DML statements then use linq to call them to do whatever*/
    public class LinqQueries
    {
        static ScotiaBankDataContext scotiaB = new ScotiaBankDataContext();// I have to keep this contaxt open in order to return table for bill view

        /*These are for nwc*/
        public static void Generate_bill(int customer_id, String name, DateTime Statement_date, DateTime Due_date, Decimal Bill_amt)//the generate bill stored procedure needs 
        {
            using ( NCBJDataContext ncb = new NCBJDataContext())
            {
                try
                {
                    //Calling stored procedure
                    ncb.Generate_Bill(customer_id, name, Statement_date, Due_date, Bill_amt);
                }
                catch (FormatException e)
                {
                    Console.WriteLine(e.Message);
                }
            }
                
        }

        public static void Recieve_Payments(int cust_id, int acct_num, Decimal Pay_amt, Decimal Acct_balance, DateTime Payment_date, String trans_type)
        {
            using (NCBJDataContext ncb = new NCBJDataContext())
            {
                try
                {
                    //calling stored procedure
                    ncb.Recieve_Payment(cust_id, acct_num, Pay_amt, Acct_balance, Payment_date, trans_type);
                }catch(FormatException e)
                {
                    Console.WriteLine(e.Message);
                }
            }
        }

        /*For customer*/
        public static void Cust_genbill(int customer_id, String name, DateTime Statement_date, DateTime Due_date, Decimal Bill_amt)
        {
            using (ScotiaBankDataContext scotia = new ScotiaBankDataContext())// these were created long ago using linq to sql  look for .dbml extensions
            {
                try
                {
                    //Calling stored procedure
                    scotia.Generate_Bill(customer_id, name, Statement_date, Due_date, Bill_amt);
                }
                catch (FormatException e)
                {
                    Console.WriteLine(e.Message);
                }
            }
        }

        public static void Make_payment(int cust_id, int acct_num, Decimal Pay_amt, Decimal Acct_balance, DateTime Payment_date, String trans_type)
        {
            using (ScotiaBankDataContext scotia = new ScotiaBankDataContext())
            {
                try
                {
                    //Calling stored procedure
                    scotia.Make_Payment(cust_id, acct_num, Pay_amt, Acct_balance, Payment_date, trans_type);
                }
                catch (FormatException e)
                {
                    Console.WriteLine(e.Message);
                }
            }
        }

        public static List<Bill> view_billArchive(int cust_id)
        {
            //Customer is an IEnumerable < Customer >
            //selecting all bills for a particular customer
            var query = (from bill in scotiaB.Bills
                    where bill.Customer_Cust_Id == cust_id 
                    select bill).ToList();
            return query;
        }
        
        /* put this section in code behind where needed*/
        public void put_this_in_code_behind(int customer_id)
        {
            //To use method to populate a gridview in a partial class(aka code behind) for example you can do something like this
            //get the bill
            var bills = view_billArchive(customer_id);

            //lets go through the bill records
            foreach (var bill in bills)
            {
                //here we can access each element if you want or...

            }
            /*Do this to populate a grid view */

           // gridview.Datasource = bills;
           // gridview.DataBind();
            }
    }
}