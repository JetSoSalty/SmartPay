<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bill_View.aspx.cs" Inherits="SmartPay.Restricted.Bill_View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="paymentview" class="container-fluid text-center">
        <h3 class="margin">Your Bill</h3>
    </div>
    <div class="container-fluid">
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>
</asp:Content>
