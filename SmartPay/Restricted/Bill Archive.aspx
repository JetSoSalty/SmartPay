<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bill Archive.aspx.cs" Inherits="SmartPay.Restricted.Bill_Archive" %>



<%@ Register src="../UserControl.ascx" tagname="UserControl" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h1>Bill Archive</h1>

             

        <%--User control used to display label , textbox and validation message--%>
        <uc1:UserControl ID="UserControl1" runat="server" />
      


        <asp:Button ID="searchbtn" runat="server" Text="Search" OnClick="searchbtn_Click" />

        <asp:GridView ID="BillArchive" runat="server"></asp:GridView>

    </div>

</asp:Content>
