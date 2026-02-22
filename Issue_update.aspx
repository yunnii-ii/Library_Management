<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Issue_update.aspx.cs" Inherits="Mini_LibraryManagementSystem.Issue_update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
        .auto-style2 {
            width: 91px;
        }
        .auto-style6 {
            width: 95px;
            height: 35px;
        }
        .auto-style19 {
            height: 35px;
        }
        .auto-style20 {
            width: 145px;
            height: 35px;
        }
        .auto-style21 {
            width: 360px;
            height: 35px;
        }
        .auto-style22 {
            width: 160px;
            height: 35px;
        }
        .auto-style26 {
            width: 100px;
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu bg-white">
        <div class="title">
            <h3>Issue Book | Update <asp:Button ID="btnQuit" runat="server" Text="" Width="35px" style="margin-left: 900px;" BackColor="White" BorderColor="White" BorderStyle="None" Height="20px" OnClick="btnQuit_Click"/></h3>
        </div>
        <div style="overflow-y:auto; width: 100%; height: 600px; margin-top: 1px; padding-bottom: 250px; background-color: white;">

            <asp:GridView ID="GridView1" runat="server" Height="100px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                <td class="auto-style20">
                    <asp:Label ID="Label1" runat="server" Text="Code No:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtCode" CssClass="issue_txtbox" placeholder=" Enter issue book's code number" runat="server" Width="300px" Height="33px" MaxLength="4" OnTextChanged="txtCode_TextChanged"></asp:TextBox>
                </td>
                <td class="auto-style22">
                    <asp:Label ID="Label5" runat="server" Text="Title:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtTitle" CssClass="issue_txtbox" placeholder=" Enter book's title" runat="server" Width="300px" Height="33px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtName" CssClass="issue_txtbox" placeholder=" Enter student name" runat="server" Width="300px" Height="33px"></asp:TextBox>
                </td>
                <td class="auto-style22">
                    <asp:Label ID="Label6" runat="server" Text="Author:"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtAuthor" CssClass="issue_txtbox" placeholder=" Enter author name" runat="server" Width="300px" Height="33px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label3" runat="server" Text="Contact:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtContact" CssClass="issue_txtbox" placeholder=" 09-*********" runat="server" Width="300px" Height="33px" MaxLength="11"></asp:TextBox>
                </td>
                <td class="auto-style22">
                    <asp:Label ID="Label7" runat="server" Text="Issue Date:"></asp:Label>
                </td>
                <td class="auto-style19">
                    <%--<asp:TextBox ID="TextBox8" CssClass="issue_txtbox" runat="server" Width="300px" Height="25px"></asp:TextBox>--%>
                    <asp:TextBox ID="txtIssueDate" runat="server" Height="33px" TextMode="Date" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtEmail" CssClass="issue_txtbox" placeholder=" @gmail.com" runat="server" Width="300px" Height="33px" TextMode="Email"></asp:TextBox>
                </td>
                <td class="auto-style22">
                    <asp:Label ID="Label8" runat="server" Text="Return Date:"></asp:Label>
                </td>
                <td class="auto-style26">
                    <%--<asp:TextBox ID="TextBox8" CssClass="issue_txtbox" runat="server" Width="300px" Height="25px"></asp:TextBox>--%>
                    <asp:TextBox ID="txtReturnDate" runat="server" Height="33px" Width="300px" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="4" align="center">
                    <asp:Label ID="lblMesg1" runat="server" ForeColor="#339933" Height="15px"></asp:Label>
                    <asp:Label ID="lblMesg2" runat="server" ForeColor="Red" Height="15px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 pt-1" colspan="4" align="center">
                    <asp:Button ID="btnUpdate" class="btn btn-sm btn-success me-1" runat="server" Text="Update" Width="100px" Height="40px" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnClear" class="btn btn-sm btn-success" runat="server" Text="Clear" Width="100px" Height="40px" OnClick="btnClear_Click"/>
                </td>
            </tr>
        </table>
        
    </div>
</asp:Content>
