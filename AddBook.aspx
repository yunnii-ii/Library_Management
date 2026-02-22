 <%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="Mini_LibraryManagementSystem.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
        }
        .auto-style4 {
            width: 200px;
        }
        .auto-style5 {
            width: 200px;
            height: 42px;
        }
        .auto-style6 {
            height: 42px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu">
        <div class="title">
            <h3>Add Book | </h3>
        </div>
        <%-- <tr>
                    <td class="auto-style3" colspan="2" align="center">
                        <div class="btn-group btn-group-md mt-2">
                            <asp:Button ID="btnUpdate" class="btn btn-md btn-success" runat="server" Text="Update" Width="185px" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnDelete" class="btn btn-md btn-success" runat="server" Text="Delete" Width="185px" OnClick="btnDelete_Click" />
                        </div>
                    </td>
                </tr>--%>
        <div class="container2">
            <div class="textbox-container">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3" colspan="2">
                        <h5><b>Add new book here!</b></h5>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <label>Code:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCode" CssClass="input"  placeholder=" Create book's code number" runat="server" Width="275px" Height="30px" MaxLength="4" ></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
            <label>Title:</label></td>
                    <td>
            <asp:TextBox ID="txtTitle" CssClass="input"  placeholder=" Enter book's title" runat="server" Width="275px" Height="30px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style4">
            <label>Author:</label></td>
                    <td>
            <asp:TextBox ID="txtAuthor" CssClass="input"  placeholder=" Enter author name" runat="server" Width="275px" Height="30px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style4">
            <label>Date:</label></td>
                    <td>
            <asp:TextBox ID="txtDate" CssClass="input"  placeholder=" Enter publication date" runat="server" Width="275px" Height="30px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
            <label>Pages:</label></td>
                    <td class="auto-style6">
            <asp:TextBox ID="txtTotalPage" CssClass="input" runat="server" Width="275px" Height="30px" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
            <label>Price:</label></td>
                    <td>
            <asp:TextBox ID="txtPrice" CssClass="input"  placeholder=" Enter book's price" runat="server" Width="275px" Height="30px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
            <label>Status:</label></td>
                    <td>
                        <asp:DropDownList ID="ddStatus" CssClass="input" runat="server" Width="275px" Height="30px">
                            <asp:ListItem>Choose status</asp:ListItem>
                            <asp:ListItem>Available</asp:ListItem>
                            <asp:ListItem>Not available</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="2" height="45px" align="center">
                        <asp:Label ID="lblMesg" runat="server" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lblMesg2" runat="server" ForeColor="#339933"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="btn1" colspan="2" align="center">
                            <asp:Button ID="btnAdd" class="btn btn-md btn-success me-1" runat="server" Text="Save" Width="130px" OnClick="btnAdd_Click" />                       
                            <asp:Button ID="btnClear" class="btn btn-md btn-success" runat="server" Text="Clear" Width="130px" OnClick="btnClear_Click" />
                        
                    </td>
                </tr>
                <%-- <tr>
                    <td class="auto-style3" colspan="2" align="center">
                        <div class="btn-group btn-group-md mt-2">
                            <asp:Button ID="btnUpdate" class="btn btn-md btn-success" runat="server" Text="Update" Width="185px" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnDelete" class="btn btn-md btn-success" runat="server" Text="Delete" Width="185px" OnClick="btnDelete_Click" />
                        </div>
                    </td>
                </tr>--%>
            </table>
                <div style="height: 50px; margin-top: 50px; " align="center">

                    <asp:Button ID="btnReload" runat="server" class="btn bg-white" OnClick="btnReload_Click" Text=" ⟳ Refresh" Width="350px" Height="35px"/>

                </div>
        </div>

            <div class="gridview">

                <asp:GridView ID="GridView1" runat="server" CellPadding="4" BorderColor="White" ForeColor="#333333" Height="200px" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField />
                    </Columns>
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
