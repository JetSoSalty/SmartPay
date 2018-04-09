<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenerateBill.aspx.cs" Inherits="SmartPay.NWC.GenerateBill" %>

<%@ Register Assembly="Custom_Server_Control" Namespace="Custom_Server_Control" TagPrefix="cc1" %>


<%@ Register src="../UserControl.ascx" tagname="UserControl" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="payment" class="container-fluid text-center">
        <h3 class="margin">Generate your bill here</h3>
    </div>
    <div class="form-horizontal">
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label AssociatedControlID="FullName" runat="server" CssClass="col-md-2 control-label">Customer Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="FullName" placeholder="Enter Customer's Full Name" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FullName" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The customer's full name is required." />
            </div>
        </div>
        <div class="form-group">
            <%--User control used to display label , textbox and validation message--%>
            <uc1:UserControl ID="UserControl1" runat="server" />
            
        </div>

        <div class="form-group">
            <div class="col-md-10">
                <asp:Label runat="server" CssClass="col-md-2 control-label">Date</asp:Label>
                <cc1:CustomCalendar runat="server" ImageButtonImageUrl="../images/calendars/calendar_3.png"></cc1:CustomCalendar>
            </div>

        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="payment_click" Text="Generate Bill" CssClass="btn btn-outline-dark" />
            </div>
        </div>
        <div>
        </div>
    </div>
</asp:Content>
