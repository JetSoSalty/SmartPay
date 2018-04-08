<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bill Archive.aspx.cs" Inherits="SmartPay.Restricted.Bill_Archive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h1> Bill Archive</h1>
        <asp:Label ID="CustLbl" runat="server" Text="Customer ID"></asp:Label>
        <asp:TextBox ID="cust_ID" runat="server"></asp:TextBox><asp:Button ID="searchbtn" runat="server" Text="Search" OnClick="searchbtn_Click" />
      
         <asp:GridView ID="BillArchive" runat="server"></asp:GridView>

    </div>

</asp:Content>
