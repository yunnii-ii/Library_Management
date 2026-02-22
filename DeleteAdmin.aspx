<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DeleteAdmin.aspx.cs" Inherits="Mini_LibraryManagementSystem.DeleteAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu bg-white">
        <div class="title">
            <h3>Admin | Delete</h3>
        </div>
        <div class="mt-3" align="center">

            <asp:TextBox ID="txtNo" CssClass="delete-Box" runat="server" placeholder=" Enter user id number." Width="300px" Height="32px" MaxLength="4"></asp:TextBox>

            <asp:Button ID="btnDel" class="btn btn-sm btn-danger mb-2" runat="server" Text="Delete" Width="60px" Height="32px" OnClick="btnDel_Click" />
            <div class="pe-5">

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter user id!" ForeColor="Red" style="font-family: Roboto ;" ControlToValidate="txtNo" Height="22px"></asp:RequiredFieldValidator>


            </div>

            <div class="gridview-del">

                <asp:GridView ID="GridView1" CssClass="gridviewclass" runat="server" Width="100%" Height="140px" GridLines="None" CellPadding="4" ForeColor="#333333">
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
    <div class="footer bg-white">
       <h5>University of Computer Studies, Pyay</h5>
    </div>
</asp:Content>
