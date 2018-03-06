CREATE PROCEDURE [dbo].[Make_Payment]
	@customerid int,
	@payment_amt int,
	@acct_balance int
AS
BEGIN TRANSACTION
	UPDATE Accounts SET Acct_balance = @acct_balance - @payment_amt where cust_number = @customerid
COMMIT TRANSACTION
RETURN 0
