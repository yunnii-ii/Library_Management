<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Issue_delete.aspx.cs" Inherits="Mini_LibraryManagementSystem.Issue_delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu bg-white">
        <div class="title">
            <h3>Issue Book | Delete </h3>
        </div>
        <div class="mt-3" align="center">

            <asp:TextBox ID="txtCodeNo" CssClass="delete-Box" runat="server" placeholder=" Enter book's code number." Width="300px" Height="32px" MaxLength="4"></asp:TextBox>

            <asp:Button ID="btnDel" class="btn btn-sm btn-danger mb-2" runat="server" Text="Delete" Width="60px" Height="32px" OnClick="btnDel_Click" />
            <div class="pe-5">

                <%--<asp:Label ID="lblMesg" runat="server" ForeColor="Red"></asp:Label>--%>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter code number!" ForeColor="Red" ControlToValidate="txtCodeNo"></asp:RequiredFieldValidator>

                <br />

            </div>

            <div class="gridview-del mt-3">

                <asp:GridView ID="GridView1" CssClass="gridviewclass" runat="server" Width="1230px" Height="101px" GridLines="None" CellPadding="4" ForeColor="#333333">
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
