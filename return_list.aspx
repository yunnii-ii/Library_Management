<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="return_list.aspx.cs" Inherits="Mini_LibraryManagementSystem.return_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 140px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu">
        <div class="title">
            <h3>Check your borrow list! 
                <asp:Button ID="btnQuit" class="float-end me-3 mb-1" runat="server" BackColor="White" BorderStyle="None" Height="25px" OnClick="btnQuit_Click" Text="✖" Width="24px" />
            </h3>
        </div>

        <div class="book_list_container">
            <div class="book_list">
                <h4 align="center"><b>Borrrow list</b></h4>
                
                <div>
                    <h6 align="center">*******************************************************</h6>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2 mt-2"><b>Code Number:</b>&nbsp;</td>
                            <td><asp:Label ID="lblCode" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"><b>Student ID:</b>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblId" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"><b>Title:</b>&nbsp;</td>
                            <td><asp:Label ID="lblTitle" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"><b>Author:</b>&nbsp;</td>
                            <td><asp:Label ID="lblAuthor" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"><b>Date:</b>&nbsp;</td>
                            <td><asp:Label ID="lblDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>

                </div>
                
                <h6 align="center">*******************************************************</h6>
                <h5>Due Date:&nbsp;<asp:Label ID="lblDueDate" class="float-end" runat="server"></asp:Label>
                    </h5>
            </div>
        </div>
    </div>
    <div class="footer">
        <h5>University of Computer Studies, Pyay</h5>
    </div>
</asp:Content>
