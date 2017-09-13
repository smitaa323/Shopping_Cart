<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDisplay.aspx.cs" Inherits="WebApplication9.ProductDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" OnRowCommand="Gridview_row_Command" CellPadding="3" CellSpacing="2" >
                <Columns>
                    <asp:BoundField DataField="Product_Id" HeaderText="Product_Id" />
                    <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" />
                    <asp:BoundField Datafield="Price" HeaderText="Price" />
                     <asp:TemplateField HeaderText="AddToCart">
                        <ItemTemplate>
                            <asp:Button Text="MoveToCart" runat="server" CommandName="AddToCart" CommandArgument="<%#Container.DataItemIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
               
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<asp:Button ID="Button2" runat="server" Height="34px" Text="CheckOut" Width="77px" style="margin-left: 115px; margin-right: 0px; margin-top: 18px" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Height="35px" OnClick="Button3_Click" style="margin-left: 324px" Text="Admin" Width="118px" />
            <br />
        </div>
    </form>
</body>
</html>
