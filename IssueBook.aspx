<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="IssueBook.aspx.cs" Inherits="Mini_LibraryManagementSystem.IssueBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 360px;
        }
        .auto-style5 {
            width: 360px;
            height: 30px;
        }
        .auto-style6 {
            height: 30px;
        }
        .auto-style9 {
            height: 30px;
        }
        .auto-style14 {
            width: 145px;
            height: 30px;
        }
        .auto-style15 {
            width: 145px;
        }
        .auto-style16 {
            width: 170px;
            height: 30px;
        }
        .auto-style17 {
            width: 170px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu bg-white">
        <div class="title">
            <h3>Issue Book | </h3>
        </div>
        <div style="overflow-y:auto; width: 100%; height: 600px; margin-top: 1px; padding-bottom: 250px; background-color: white;">

            <asp:GridView ID="GridView1" runat="server" Height="100px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
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
                <td class="auto-style14">
                    <asp:Label ID="Label1" runat="server" Text="Code No:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtCode" CssClass="issue_txtbox" placeholder=" Enter issue book's code number" runat="server" Width="300px" Height="33px" MaxLength="4" OnTextChanged="txtCode_TextChanged"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label5" runat="server" Text="Title:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtTitle" CssClass="issue_txtbox" placeholder=" Enter book's title" runat="server" Width="300px" Height="33px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtName" CssClass="issue_txtbox" placeholder=" Enter student name" runat="server" Width="300px" Height="33px"></asp:TextBox>
                </td>
                <td class="auto-style17">
                    <asp:Label ID="Label6" runat="server" Text="Author:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAuthor" CssClass="issue_txtbox" placeholder=" Enter author name" runat="server" Width="300px" Height="33px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="Label3" runat="server" Text="Contact:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtContact" CssClass="issue_txtbox" placeholder=" 09-*********" runat="server" Width="300px" Height="33px" MaxLength="11"></asp:TextBox>
                </td>
                <td class="auto-style17">
                    <asp:Label ID="Label7" runat="server" Text="Issue Date:"></asp:Label>
                </td>
                <td>
                    <%--<a href="Issue_update.aspx"><input type="button" class="issue_btn btn btn-sm btn-success" Width="130px" value="Update"/></a>
                    <a href="Issue_delete.aspx"><input type="button" class="issue_btn btn btn-sm btn-success" Width="130px" value="Delete"/></a>--%>
                    <asp:TextBox ID="txtIssueDate" runat="server" Height="33px" Width="300px" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtEmail" CssClass="issue_txtbox" placeholder=" @gmail.com" runat="server" Width="300px" Height="33px" TextMode="Email"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label8" runat="server" Text="Return Date:"></asp:Label>
                </td>
                <td class="auto-style9">
                    <%--<asp:TextBox ID="TextBox8" CssClass="issue_txtbox" runat="server" Width="300px" Height="25px"></asp:TextBox>--%>
                    <asp:TextBox ID="txtReturnDate" runat="server" Height="33px" TextMode="Date" Width="300px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="4" align="center">
                    <asp:Label ID="lblMesg1" runat="server" ForeColor="#339933"></asp:Label>
                    <asp:Label ID="lblMesg2" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="4" align="center">
                    <asp:Button ID="btnSave" class="btn btn-sm btn-success me-1" runat="server" Text="Save" Width="100px" OnClick="btnSave_Click" Height="40px" />
                    <asp:Button ID="btnClear" class="btn btn-sm btn-success me-1" runat="server" Text="Clear" Width="100px" OnClick="btnClear_Click" Height="40px" />
                    <asp:Button ID="btnUpdate" class="btn btn-sm btn-success me-1" runat="server" Text="Update" Width="100px" Height="40px" OnClick="btnUpdate_Click"  />
                    <asp:Button ID="btnDelete" class="btn btn-sm btn-danger" runat="server" Text="Delete" Width="100px" Height="40px" OnClick="btnDelete_Click"  />
                    <%--<a href="Issue_update.aspx"><input type="button" class="issue_btn btn btn-sm btn-success" Width="130px" value="Update"/></a>
                    <a href="Issue_delete.aspx"><input type="button" class="issue_btn btn btn-sm btn-success" Width="130px" value="Delete"/></a>--%>
                </td>
            </tr>
        </table>
        
    </div>
</asp:Content>
