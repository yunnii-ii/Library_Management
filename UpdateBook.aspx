<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="UpdateBook.aspx.cs" Inherits="Mini_LibraryManagementSystem.UpdateBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 43px;
        }
        .auto-style2 {
            height: 40px;
        }
        .auto-style3 {
            width: 11px;
        }
        .auto-style4 {
        }
        .auto-style5 {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu">
        <div class="title">
            <h3>Update Book | 
                <asp:Button ID="btnQuit" runat="server" BackColor="White" BorderStyle="None" Height="15px" Width="21px" />
            </h3>
        </div>
        <div class="container2">
            <div class="textbox-container2">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <h5><b>Update book here!</b></h5>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtCode" CssClass="input"  placeholder=" Enter book's code number to update!" runat="server" Width="370px" Height="40px" MaxLength="4" OnTextChanged="txtCode_TextChanged"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
            <asp:TextBox ID="txtTitle" CssClass="input"  placeholder=" Title:" runat="server" Width="370px" Height="40px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style2">
            <asp:TextBox ID="txtAuthor" CssClass="input"  placeholder=" Author:" runat="server" Width="370px" Height="40px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style4">
            <asp:TextBox ID="txtDate" CssClass="input"  placeholder=" Publication_Date:" runat="server" Width="370px" Height="40px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
            <asp:TextBox ID="txtTotalPage" CssClass="input"  placeholder=" Total pages:" runat="server" Width="370px" Height="40px" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
            <asp:TextBox ID="txtPrice" CssClass="input"  placeholder=" Book's price:" runat="server" Width="370px" Height="40px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddStatus" CssClass="input" runat="server" Width="370px" Height="40px">
                            <asp:ListItem>Choose Status</asp:ListItem>
                            <asp:ListItem>Available</asp:ListItem>
                            <asp:ListItem>Not Available</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" align="center" height="30px">
                        <asp:Label ID="lblErrorMesg" runat="server" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lblMesg" runat="server" ForeColor="#00CC66"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="btn2" align="center">
                        <asp:Button ID="btnUpdate" class="btn btn-md btn-success me-1" Width="130px" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnClear" class="btn btn-md btn-success" Width="130px" runat="server" Text="Clear" OnClick="btnClear_Click"  />
                        
                    </td>
                </tr>
            </table>
        </div>

        <div class="gridview">
            
            <asp:GridView ID="GridView1" runat="server" Height="200px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            
        </div>
        </div>
    </div>
    <div class="footer">
        <h5>University of Computer Studies, Pyay</h5>
    </div>
</asp:Content>
