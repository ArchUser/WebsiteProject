<%@ Page Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="Departments.aspx.cs" Inherits="Departments" Title="Dorknozzle Departments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Dorknozzle Departments</h1>
  <asp:GridView id="departmentsGrid" runat="server"
      AllowPaging="True" PageSize="4" OnPageIndexChanging="departmentsGrid_PageIndexChanging" AllowSorting="True" OnSorting="departmentsGrid_Sorting">
  </asp:GridView>
</asp:Content>

