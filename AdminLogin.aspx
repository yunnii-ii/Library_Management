<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Mini_LibraryManagementSystem.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        width: 170px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" id="content" autocomplete="off" >
            <div class="login">
                <h4>Admin Login</h4>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                            </td>
                            <td>
                    <asp:TextBox ID="txtName" class="textBox" placeholder=" Enter your name" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                            </td>
                            <td>
                    <asp:TextBox ID="txtEmail" class="textBox" placeholder="@gmail.com" runat="server" TextMode="Email"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
                            </td>
                            <td>
                    <asp:TextBox ID="txtPassword" class="textBox" placeholder=" Enter your password" runat="server" TextMode="Password" autocomplete="new-password" MaxLength="8"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please fill require field." ForeColor="Red" Height="15px"></asp:RequiredFieldValidator>
                                
                                <asp:CheckBox ID="chkShowPassword" class="float-end" runat="server" Height="18px" OnCheckedChanged="CheckBox1_CheckedChanged" Text="&nbsp;show password" />
                                
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Height="15px"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="txtLogin" class="btn btn-md btn-outline-success mt-2 me-1" runat="server" Text="Login" OnClick="txtLogin_Click" Width="200px" />
                                <asp:Button ID="btnCancel" class="btn btn-md btn-outline-success mt-2" runat="server" Text="Cancel" Width="200px" OnClick="btnCancel_Click" />
                            </td>
                        </tr>
                </table>
                <br />
            </div>
            
        </div>

<script type="text/javascript">
        function togglePasswordVisibility()
        {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var checkbox = document.getElementById('<%= chkShowPassword.ClientID %>');

            if (checkbox.checked)
            {
                passwordField.type = "text";
            }
            else
            {
                passwordField.type = "password";
            }
        }

    // Attach the function to the checkbox's change event
    document.getElementById('<%= chkShowPassword.ClientID %>').addEventListener('change', togglePasswordVisibility);
</script>
</asp:Content>
