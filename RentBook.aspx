<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RentBook.aspx.cs" Inherits="Mini_LibraryManagementSystem.RentBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 25px;
        }
        .auto-style3 {
        }
        .auto-style5 {
            width: 360px;
        }
        .auto-style6 {
            height: 25px;
            width: 360px;
        }
        .auto-style9 {
            width: 145px;
        }
        .auto-style10 {
            height: 25px;
            width: 145px;
        }
        .auto-style11 {
            width: 160px;
        }
        .auto-style12 {
            height: 25px;
            width: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu bg-white">
        <div class="title">
            <h3>Rent Book | <asp:Button ID="btnQuit" runat="server" Text="" Width="45px" style="margin-left: 950px;" BackColor="White" BorderColor="White" BorderStyle="None" Height="24px"/></h3>
        </div>
        <div style="overflow-y:auto; width:100%; height: 600px; margin-top: 1px; padding-bottom: 250px; background-color: white;">

            <asp:GridView ID="GridView1" runat="server" Height="100px" HorizontalAlign="Center" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
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
    <div class="issue_footer bg-white">
        
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="Label1" runat="server" Text="Code No:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtCode" CssClass="issue_txtbox" placeholder=" Enter book's code number" runat="server" Height="33px" OnTextChanged="txtCode_TextChanged" Width="300px" MaxLength="4"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label5" runat="server" Text="Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" CssClass="issue_txtbox" placeholder=" Enter student's name" runat="server" Height="33px" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="Label2" runat="server" Text="Title:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtTitle" CssClass="issue_txtbox" placeholder=" Enter book's title" runat="server" Height="33px" Width="300px"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label7" runat="server" Text="PaKaPaTa:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPkpt" CssClass="issue_txtbox" placeholder=" " runat="server" Height="33px" Width="300px" MaxLength="6"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="Label3" runat="server" Text="Author:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtAuthor" CssClass="issue_txtbox" placeholder=" Enter author name" runat="server" Height="33px" Width="300px"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    <asp:Label ID="Label4" runat="server" Text="Borrow Date:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtDate" CssClass="issue_txtbox" runat="server" Height="33px" TextMode="Date" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="Label6" runat="server" Text="Contact:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtContact" CssClass="issue_txtbox" placeholder=" 09-*********" runat="server" Height="33px" Width="301px" MaxLength="11"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label8" runat="server" Text="Due Date:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDueDate" CssClass="issue_txtbox" runat="server" Height="33px" TextMode="Date" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="4" align="center">
                    <asp:Label ID="lblMesg" runat="server" ForeColor="#339933" Height="18px"></asp:Label>
                    <asp:Label ID="lblMesg1" runat="server" ForeColor="Red" Height="18px"></asp:Label>
                    <asp:Label ID="lblMesg2" runat="server" ForeColor="Red" Height="18px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3 pt-1" colspan="4" align="center">
                    <asp:Button ID="btnSave" class="btn btn-sm btn-success me-1" runat="server" OnClick="btnSave_Click" Text="Save" Width="100px" Height="40px" />
                    <asp:Button ID="btnClear" class="btn btn-sm btn-success me-1" runat="server" OnClick="btnClear_Click" Text="Clear" Width="100px" Height="40px" />
                    <asp:Button ID="btnViewList" class="btn btn-sm btn-success me-1" runat="server" Text="View List" Width="100px" Height="40px" OnClick="btnViewList_Click" />
                    <asp:Button ID="btnReload" class="btn btn-sm btn-success" runat="server" OnClick="btnReload_Click" Text="Reload" Width="100px" Height="40px" />
                </td>
            </tr>
        </table>
        
        
    </div>
</asp:Content>
