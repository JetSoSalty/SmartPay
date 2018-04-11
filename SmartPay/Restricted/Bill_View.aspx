<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bill_View.aspx.cs" Inherits="SmartPay.Restricted.Bill_View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="paymentview" class="container-fluid text-center">
        <h3 class="margin">Your Bill</h3>
    </div>
    <div class="container-fluid">
        <!-- Some type of view here -->
        <asp:GridView ID="BillViewGV" CssClass="table table-bordered table-responsive table-hover table-striped" runat="server"></asp:GridView>

        <div class="col-md-10">
            <asp:Button runat="server" Text="Pay Bill" CssClass="btn btn-outline-primary" OnClick="PayBill_Click" />
        </div>
    </div>
</asp:Content>
