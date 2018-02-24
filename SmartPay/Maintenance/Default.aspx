<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartPay.Maintenance.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Maintain users and roles</h1>
    (Only users associated with the Admin role can access this page)
    <div class="row">
         <div class="col-sm-12 table-responsive">

             <asp:GridView ID="grdUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" 
                 ItemType="SmartPay.Models.ApplicationUser" SelectMethod="grdUsers_GetData" 
                 CssClass="table table-bordered table-striped table-dark table-condensed"
                 OnPreRender="GridView_PreRender">
                 <Columns>
                    <asp:BoundField HeaderText="User Name" DataField="UserName" />
                    <asp:BoundField HeaderText="Email" DataField="Email" />
                    <asp:TemplateField HeaderText="Roles">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Role" Text=""></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="true" />
                </Columns>
             </asp:GridView>
         </div>
     <div class="col-sm-6">
            <asp:DetailsView ID="dvUsers" runat="server" DataKeyNames="Id" 
                AutoGenerateRows="false" CssClass="table table-bordered table-striped table-dark table-condensed" 
                SelectMethod="dvUsers_GetItem" UpdateMethod="dvUsers_UpdateItem" 
                InsertMethod="dvUsers_InsertItem" DeleteMethod="dvUsers_DeleteItem">
                <Fields>
                    <asp:BoundField HeaderText="Email" DataField="Email" />
                    <asp:CommandField ShowEditButton="true" ShowInsertButton="true" 
                        ShowDeleteButton="true" />
                </Fields>
            </asp:DetailsView>
        </div>
    </div>
     <div class="row">
        <div class="col-sm-6">
            <h2>Roles</h2>
            <asp:GridView ID="grdRoles" runat="server" DataKeyNames="Id" 
                AutoGenerateColumns="false" SelectMethod="grdRoles_GetData"
                CssClass="table table-bordered table-striped table-dark table-condensed" 
                OnPreRender="GridView_PreRender">
                <Columns>
                    <asp:BoundField HeaderText="Role Name" DataField="Name" />
                    <asp:CommandField ShowSelectButton="true" />
                </Columns>
            </asp:GridView>
            <asp:DetailsView ID="dvRoles" runat="server" DataKeyNames="Id" 
                AutoGenerateRows="false" CssClass="table table-bordered table-striped table-dark table-condensed" 
                SelectMethod="dvRoles_GetItem" UpdateMethod="dvRoles_UpdateItem" 
                InsertMethod="dvRoles_InsertItem" DeleteMethod="dvRoles_DeleteItem">
                <Fields>
                    <asp:BoundField HeaderText="Role Name" DataField="Name" />
                    <asp:CommandField ShowEditButton="true" ShowInsertButton="true" 
                        ShowDeleteButton="true" />
                </Fields>
            </asp:DetailsView>
        </div>
        <div class="col-sm-6">
            <h2>Add Roles to User</h2>
            <div class="form-group">
                <label class="control-label">Select a user:</label>
                <asp:DropDownList ID="ddlUsers" runat="server" 
                    SelectMethod="grdUsers_GetData" DataValueField="Id"
                    DataTextField="UserName" CssClass="form-control">
                </asp:DropDownList> 
            </div>
            <div class="form-group">
                <label class="control-label">Add one or more roles:</label>
                <asp:ListBox ID="lstRoles" runat="server" SelectionMode="Multiple" 
                    SelectMethod="grdRoles_GetData" DataValueField="Id"
                    DataTextField="Name" CssClass="form-control"></asp:ListBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnAddRoles" runat="server" Text="Add Roles" 
                CssClass="btn btn-default" OnClick="btnAddRoles_Click" />
            </div>
        </div>
    </div>
</asp:Content>
