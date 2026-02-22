<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="Mini_LibraryManagementSystem.AddMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style6 {
            width: 360px;
        }
        .auto-style7 {
        }
        .auto-style8 {
            height: 24px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu">
        <div class="title">
            <h3>Add new member | </h3>
        </div>
        <div class="container_member">
            <div class="mem_view">

                <asp:GridView ID="GridView1" runat="server" CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None" Height="120px" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
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
        <div class="mem_footer">
            
            <table class="auto-style1">
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label12" runat="server" Text="PaKaPaTa:"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtPkpt" CssClass="mem_txtbox" runat="server" Width="300px" Height="33px" MaxLength="6"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="Label17" runat="server" Text="Semester:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddSem" CssClass="mem_txtbox" runat="server" Width="300px" Height="33px">
                            <asp:ListItem Enabled>Choose Semester</asp:ListItem>
                                <asp:ListItem>First year (First Semester)</asp:ListItem>
                                <asp:ListItem>First year (Second Semester)</asp:ListItem>
                                <asp:ListItem>Second year (First Semester)</asp:ListItem>
                                <asp:ListItem>Second year (Second Semester)</asp:ListItem>
                                <asp:ListItem>Third year (First Semester)</asp:ListItem>
                                <asp:ListItem>Third year (Second Semester)</asp:ListItem>
                                <asp:ListItem>Fourth year (First Semester)</asp:ListItem>
                                <asp:ListItem>Fourth year (Second Semester)</asp:ListItem>
                                <asp:ListItem>Fifth year (First Semester)</asp:ListItem>
                                <asp:ListItem>Fifth year (Second Semester)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label11" runat="server" Text="Name:"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtName" CssClass="mem_txtbox" placeholder=" Enter student's name" runat="server" Width="300px" Height="33px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="Label18" runat="server" Text="Department:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddDept" CssClass="mem_txtbox" runat="server" Width="300px" Height="33px">
                            <asp:ListItem Enabled>Choose Department</asp:ListItem>
                                <asp:ListItem>CS</asp:ListItem>
                                <asp:ListItem>CT</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label13" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtEmail" CssClass="mem_txtbox" placeholder=" @gmail.com" runat="server" Width="300px" Height="33px" TextMode="Email"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="Label16" runat="server" Text="Section:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddSec" CssClass="mem_txtbox" runat="server" Width="300px" Height="33px">
                            <asp:ListItem Enabled>Choose Section</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">Phone no:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtPhone" CssClass="mem_txtbox" placeholder=" 09-*********" runat="server" Width="300px" Height="33px" MaxLength="11"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="Label15" runat="server" Text="Address:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" CssClass="mem_txtbox" runat="server" TextMode="MultiLine" Width="300px" Height="33px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8 pt-1" colspan="4" align="center">
                        <asp:Label ID="lblMesg" runat="server" ForeColor="Red" Height="18px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7 pt-2" colspan="4" align="center">
                        <asp:Button ID="btnSave" class="btn btn-sm btn-success me-1" runat="server" OnClick="btnSave_Click" Text="Save" Width="100px" Height="40px" />
                        <asp:Button ID="btnClear" runat="server" class="btn btn-sm btn-success me-1" Text="Clear" OnClick="btnCancel_Click" Width="100px" Height="40px" />
                        <asp:Button ID="btnUpdate" runat="server" class="btn btn-sm btn-success me-1" Text="Update"  Width="100px" OnClick="btnUpdate_Click" Height="40px" />
                        <asp:Button ID="btnDelete" runat="server" class="btn btn-sm btn-danger" Text="Delete" Width="100px" OnClick="btnDelete_Click" Height="40px" />
                    </td>
                </tr>
            </table>
            
        </div>
    </div>
</asp:Content>
