<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="UpdateAdmin.aspx.cs" Inherits="Mini_LibraryManagementSystem.UpdateAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 350px;
        }
        .auto-style3 {
            width: 125px;
        }
        .auto-style4 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu">
        <div class="title">
            <h3>Admin | Update 
                <asp:Button ID="Button1" runat="server" BackColor="White" BorderColor="White" BorderStyle="None" Width="43px" />
            </h3>
        </div>
        <div style="overflow-y:auto; height: 600px; width:100%; margin-top: 1px; padding-bottom: 250px; background-color: white;">

            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
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
        <div class="admin_footer">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label6" runat="server" Text="ID:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtId" runat="server" OnTextChanged="txtId_TextChanged" Width="300px" Height="33px"></asp:TextBox>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Phone no:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" CssClass="issue_txtbox" placeholder=" 09-*********" runat="server" Width="300px" Height="33px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtName" CssClass="issue_txtbox" runat="server" Width="300px" Height="33px"></asp:TextBox>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" Text="Password:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" CssClass="issue_txtbox" placeholder=" 8 characters or numbers" runat="server" Width="300px" autocomplete="new-password" TextMode="Password" MaxLength="8" Height="33px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEmail" CssClass="issue_txtbox" placeholder=" @gmail.com" runat="server" Width="300px" Height="33px" TextMode="Email"></asp:TextBox>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label5" runat="server" Text="Re_password:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCfPassword" CssClass="issue_txtbox" placeholder=" Confirm your password." runat="server" Width="300px" autocomplete="new-password" TextMode="Password" MaxLength="8" Height="33px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="issue_btn" colspan="4" align="center">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtCfPassword" ControlToValidate="txtPassword" ErrorMessage="Password and confirm password must be the same." ForeColor="Red" Height="15px" Width="400px"></asp:CompareValidator>
                        <asp:CheckBox ID="chkShowPassword" class="float-end" runat="server" Height="15px" Text="&nbsp;show password" />
                        <br />
                        <asp:Label ID="lblMesg" runat="server" ForeColor="Red" Height="15px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="issue_btn pt-1" colspan="4" align="center">
                        <asp:Button ID="btnUpdate" class="btn btn-sm btn-success" runat="server" Text="Update" Width="120px" Height="40px" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnClear" class="btn btn-sm btn-success ms-1" runat="server" Text="Clear" Width="120px" Height="40px" OnClick="btnClear_Click" />
                        <asp:Button ID="btnBack" class="btn btn-sm btn-success ms-1" runat="server" Text="Back" Width="120px" Height="40px" OnClick="btnBack_Click" />
                    </td>
                </tr>
            </table>

        </div>
    </div>

    <script type="text/javascript">
        function togglePasswordVisibility() {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var CpasswordField = document.getElementById('<%= txtCfPassword.ClientID %>');
            var checkbox = document.getElementById('<%= chkShowPassword.ClientID %>');

            if (checkbox.checked) {
                passwordField.type = "text";
                CpasswordField.type = "text";
            }
            else {
                passwordField.type = "password";
                CpasswordField.type = "password";
            }
        }

        // Attach the function to the checkbox's change event
        document.getElementById('<%= chkShowPassword.ClientID %>').addEventListener('change', togglePasswordVisibility);
</script>
</asp:Content>
