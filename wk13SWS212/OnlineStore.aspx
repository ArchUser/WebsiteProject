<%@ Page Language="C#" MasterPageFile="Dorknozzle.master" AutoEventWireup="true" CodeFile="OnlineStore.aspx.cs" Inherits="OnlineStore" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:panel id="Panel1" runat="server" Width="160px" Height="104px">
<br />Search:
<asp:TextBox id="txtSearch" runat="server"></asp:TextBox>
<asp:CheckBox id="chkDescription" runat="server" Width="152px" Text="Description"></asp:CheckBox><br />
<asp:Button id="btnFind" runat="server" Text="Find" OnClick="btnFind_Click"></asp:Button>&nbsp;
<asp:Button id="btnShowAll" runat="server" Text="Show All"></asp:Button><br />
<asp:Label id="lblMessage" runat="server" Width="152px" ForeColor="Red" Font-Size="XX-Small"></asp:Label></asp:panel>
<asp:panel id="pnlShowItems" runat="server">
	<h4>Our Products:</h4>
    <asp:Label ID="lblSearchWord" runat="server" Text="&nbsp;" CssClass="searchWord"></asp:Label>
	
	<asp:DataList id="dlItems" runat="server" Width="472px" OnEditCommand="AddToCart" DataKeyField="ItemID" >
		<ItemTemplate>
		<table border="0" cellspacing="0" cellpadding="4">
		<tr>
		<td valign="top" align="center">
		    <img alt="" width="120" height="120" src='<%# "images/Store/" + Eval("ImageURL") %>' />
		</td>
		<td>
		    <h5><%# Eval("ItemName") %></h5>
			<div><%# Eval("Description") %></div><br />
			Cost: $<%# Eval("Cost") %><br /><br /><asp:Button id="btnAddToCart" runat="server" Text="Add To Cart" CommandName="Edit" />
		</td>
		</tr>
		<tr>
		<td colspan="2"><hr />
		</td>
		</tr>
		</table>
		</ItemTemplate>
	</asp:DataList></asp:panel>
<asp:panel id="pnlShowCart" runat="server">
	<h4>Shopping&nbsp;Cart</h4>
	<asp:DataGrid id="dgCart" runat="server" Width="100%" OnEditCommand="dgCart_Edit" DataKeyField="CartID"
	OnUpdateCommand="dgCart_Update" OnDeleteCommand="dgCart_Delete" OnCancelCommand="dgCart_Cancel"
	CellPadding="3" GridLines="None" AutoGenerateColumns="False" >
	<ItemStyle Font-Size="10pt" Font-Names="arial"></ItemStyle>
	<HeaderStyle Font-Size="10pt" Font-Names="arial" Font-Bold="True" ForeColor="White" BackColor="#003366"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="ItemName" ReadOnly="True" HeaderText="Product Name"></asp:BoundColumn>
		<asp:TemplateColumn HeaderText="Picture">
			<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
			<ItemStyle HorizontalAlign="Center"></ItemStyle>
			<ItemTemplate>
				<img alt="" id="myImage" src='images/store/<%# Eval("ImageURL") %>' height="50" width="50" >
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Quantity">
			<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
			<ItemStyle HorizontalAlign="Center"></ItemStyle>
			<ItemTemplate>
			    <%# Eval("Quantity") %>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:TextBox id="txtQuantity" Text='<%# Eval("Quantity") %>' runat="server" Width="50" />
			</EditItemTemplate>
		</asp:TemplateColumn>
		<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Save" HeaderText="Modify" CancelText="Cancel"
				EditText="Change"></asp:EditCommandColumn>
		<asp:TemplateColumn HeaderText="Cost">
			<HeaderStyle HorizontalAlign="Right"></HeaderStyle>
			<ItemStyle HorizontalAlign="Right"></ItemStyle>
			<ItemTemplate>
				<asp:Label ID="Label1" runat="server" Text='<%# Eval("Cost") %>'>
				</asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Remove">
			<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
			<ItemStyle HorizontalAlign="Center"></ItemStyle>
			<ItemTemplate>
				<asp:LinkButton ID="LinkButton1" runat="server" Text="Delete" CommandName="Delete" CausesValidation="false"></asp:LinkButton>
				</ItemTemplate>
		</asp:TemplateColumn>
    </Columns>
    </asp:DataGrid>
	<p style="text-align:right;"><b>Total:
	<asp:Label id="lblTotal" runat="server"></asp:Label></b></p>
	<p style="text-align:right;">
	<asp:LinkButton id="lbContinue" runat="server" Text="Continue Shopping" OnClick="lbContinue_Click"></asp:LinkButton>&nbsp;|
	<asp:LinkButton id="lbCheckOut" runat="server" Text="Checkout" OnClick="lbCheckOut_Click"></asp:LinkButton></p>
</asp:panel>
</asp:Content>

