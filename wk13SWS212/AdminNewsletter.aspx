<%@ Page Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="AdminNewsletter.aspx.cs" Inherits="AdminNewsletter" Title="Dorknozzle Admin Newsletter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Create Newsletter</h1>
  <asp:Label ID="resultLabel" runat="server" ForeColor="Red"/>
  <br />To:<br />
  <asp:TextBox ID="toTextBox" runat="server" />
  <br />Subject:<br />
  <asp:TextBox ID="subjectTextBox" runat="server" />
  <br />Introduction:<br />
  <asp:TextBox ID="introTextBox" runat="server"
      TextMode="MultiLine" Width="300" Height="100" />
  <br />Employee Of The Month:<br />
  <asp:TextBox ID="employeeTextBox" runat="server" />
  <br />Featured Event:<br />
  <asp:TextBox ID="eventTextBox" runat="server" />
  <br />
  <asp:Button ID="sendNewsletterButton" runat="server"
      Text="Send Newsletter" OnClick="sendNewsletterButton_Click" />
</asp:Content>

