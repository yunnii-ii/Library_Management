<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ReturnBook.aspx.cs" Inherits="Mini_LibraryManagementSystem.ReturnBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style15 {
            width: 160px;
            height: 35px;
        }
        .auto-style16 {
            width: 360px;
            height: 35px;
        }
        .auto-style17 {
            height: 35px;
        }
        .auto-style18 {
            width: 145px;
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu bg-white">
        <div class="title">
            <h3>Return Book | <asp:Button ID="btnQuit" runat="server" Text="" Width="45px" style="margin-left: 950px;" BackColor="White" BorderColor="White" BorderStyle="None" Height="24px"/></h3>
        </div>
        <div style="overflow-y:scroll; height: 600px; margin-top: 1px; padding-bottom: 250px; background-color: white;">

            <asp:GridView ID="GridView1" runat="server" Height="100px" HorizontalAlign="Center" Width="1230px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                <td class="auto-style18">
                    <asp:Label ID="Label1" runat="server" Text="Code No:"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtCode" CssClass="issue_txtbox" placeholder=" Enter return book's code number" runat="server" Width="300px" Height="33px" OnTextChanged="TextBox1_TextChanged" MaxLength="4"></asp:TextBox>
                </td>
                <td class="auto-style15">
                    <asp:Label ID="Label4" runat="server" Text="Name:"></asp:Label>
                </td>
                <td class="auto-style17">
                    
                    <asp:TextBox ID="txtName" CssClass="issue_txtbox" placeholder=" Enter student's name" runat="server" Width="300px" Height="33px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="Label2" runat="server" Text="Title:"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtTitle" CssClass="issue_txtbox" placeholder=" Enter book's title" runat="server" Width="300px" Height="33px"></asp:TextBox>
                </td>
                <td class="auto-style15">
                    <asp:Label ID="Label5" runat="server" Text="PaKaPaTa:" ></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtPkpt" CssClass="issue_txtbox" placeholder="" runat="server" Width="300px" Height="33px" MaxLength="6"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="Label3" runat="server" Text="Author:"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtAuthor" CssClass="issue_txtbox" placeholder=" Enter author name" runat="server" Width="300px" Height="33px"></asp:TextBox>
                </td>
                <td class="auto-style15">
                    <%--<input type="date" class="issue_txtbox">--%>
                    <asp:Label ID="Label8" runat="server" Text="Borrow Date:"></asp:Label>
                </td>
                <td class="auto-style17">
                    <%--<input type="date" class="issue_txtbox">--%>
                    <asp:TextBox ID="txtBorrowDate" runat="server" Height="33px" Width="300px" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="Label6" runat="server" Text="Contact:"></asp:Label>
                </td>
                <td class="auto-style16">
                    
                    <asp:TextBox ID="txtContact" placeholder=" 09-*********" CssClass="issue_txtbox" runat="server" Width="300px" Height="33px" MaxLength="11"></asp:TextBox>
                </td>
                <td class="auto-style15">
                    <asp:Label ID="Label9" runat="server" Text="Return Date:"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtReturnDate" runat="server" Height="33px" Width="300px" TextMode="Date"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="4" height="30px" align="center">
                    <asp:Label ID="lblMesg" runat="server" ForeColor="#339933"></asp:Label>
                    <asp:Label ID="lblMesg1" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblMesg2" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="4" align="center">
                    <asp:Button ID="btnSave" class="btn btn-sm btn-success me-1" runat="server" Text="Save" Width="100px" OnClick="btnSave_Click" Height="40px" />
                    <asp:Button ID="btnClear" class="btn btn-sm btn-success me-1" runat="server" Text="Clear" Width="100px" OnClick="btnClear_Click" Height="40px" />
                    <asp:Button ID="btnReload" class="btn btn-sm btn-success me-1" runat="server" OnClick="btnReload_Click" Text="Reload" Height="40px" Width="100px" />
                    <asp:Button ID="btnDelete" class="btn btn-sm btn-danger" runat="server" Text="Reset Data" Width="100px" OnClick="btnDelete_Click" Height="40px" />
                </td>
            </tr>
        </table>
        
    </div>
</asp:Content>
