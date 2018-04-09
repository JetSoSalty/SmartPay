<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserControl.ascx.cs" Inherits="SmartPay.UserControl" %>

<asp:Label ID="CustNumberlbl" AssociatedControlID="CustID" runat="server" CssClass="col-md-2 control-label">Customer ID Number</asp:Label>
<div class="col-md-10">
    <asp:TextBox ID="CustID" placeholder="Enter Customer's ID Number" CssClass="form-control" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="CustIDRfv" runat="server" ControlToValidate="CustID" Display="Dynamic"
        CssClass="text-danger" ErrorMessage="The Customer's ID is required." />
</div>
