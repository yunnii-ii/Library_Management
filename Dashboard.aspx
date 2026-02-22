<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Mini_LibraryManagementSystem.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="menu bg-white">
                <div class="title">
                    <h3>Dashboard | Books</h3>
                </div>
                <div class="title-item-container">
                    <div class="title-item">
                        <div class="title-item-parts" style="background-color: rgb(23, 129, 28);">
                            <div class="item-head" style="background-color: darkgreen;" align="center">
                                <span>All Books</span>
                            </div>
                            <div class="item-body" align="center">
                            <br />
                                <asp:Label ID="lblGreen" CssClass="dash_label" runat="server" Text="Label" ForeColor="White"></asp:Label>
                            </div>
                        </div>
                        <div class="title-item-parts" style="background-color: rgb(21, 21, 134);">
                            <div class="item-head" style="background-color: rgb(25, 25, 94);" align="center">
                                <span>Available</span>
                            </div>
                            <div class="item-body" align="center">
                            <br />
                                <asp:Label ID="lblBlue" CssClass="dash_label" runat="server" Text="Label" ForeColor="White"></asp:Label>

                            </div>
                        </div>
                    <div class="title-item-parts" style="background-color: rgb(203, 21, 21);">
                        <div class="item-head" style="background-color: rgb(123, 23, 23);" align="center">
                            <span>Issued</span>
                        </div>
                        <div class="item-body" align="center">
                            <br />
                            <asp:Label ID="lblPurple" CssClass="dash_label" runat="server" Text="Label" ForeColor="White"></asp:Label>
                        </div>
                    </div>
                    <div class="title-item-parts" style="background-color: gray">
                        <div class="item-head" style="background-color: rgb(68, 64, 64);" align="center">
                            <span>Rent Books</span>
                        </div>
                        <div class="item-body" align="center">
                            <br />
                            <asp:Label ID="lblGray" CssClass="dash_label" runat="server" Text="Label" ForeColor="White"></asp:Label>

                        </div>
                    </div>
                    <div class="title-item-parts" style="background-color: purple;">
                        <div class="item-head" style="background-color: rgb(82, 20, 82);" align="center">
                            <span>Return Books</span>
                        </div>
                        <div class="item-body" align="center">
                            <br />
                            <asp:Label ID="lblRed" CssClass="dash_label" runat="server" Text="Label" ForeColor="White"></asp:Label>

                        </div>
                    </div>
                    <div class="title-item-parts" style="background-color: rgb(32, 140, 176);">
                        <div class="item-head" style="background-color: rgb(30, 76, 91);" align="center">
                            <span>Members</span>
                        </div>
                        <div class="item-body" align="center">
                            <br />
                            <asp:Label ID="lblLightblue" CssClass="dash_label" runat="server" Text="" ForeColor="White"></asp:Label>

                        </div>
                    </div>
                </div>
                </div>
            </div>
    <div class="Author-container bg-white">
                    <div class="Author-Title"><h5 style="color: gray; font-family: Calibri; font-size: 23px;"><b>Poster</b></h5></div>
                <div class="Author">
                    <div class="Author-item-container">
                        <div class="Author-items">
                            <div class="Author-item-parts">
                                <img src="Image/b38.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b16.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b17.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b18.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b19.jpg" />
                            </div>
                        </div>
                    </div>

                    <div class="Author-item-container">
                        <div class="Author-items">
                            <div class="Author-item-parts">
                                <img src="Image/b2.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b9.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b20.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b21.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b22.jpg" />
                            </div>
                        </div>
                    </div>

                    <div class="Author-item-container">
                        <div class="Author-items">
                            <div class="Author-item-parts">
                                <img src="Image/b3.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b10.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b23.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b24.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b41.jpg" />
                            </div>
                        </div>
                    </div>

                    <div class="Author-item-container">
                        <div class="Author-items">
                            <div class="Author-item-parts">
                                <img src="Image/b4.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b11.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b25.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b42.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b43.jpg" />
                            </div>
                        </div>
                    </div>

                    <div class="Author-item-container">
                        <div class="Author-items">
                            <div class="Author-item-parts">
                                <img src="Image/b5.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b12.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b26.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b44.png" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b31.jpg" />
                            </div>
                        </div>
                    </div>
                    <div class="Author-item-container">
                        <div class="Author-items">
                            <div class="Author-item-parts">
                                <img src="Image/b6.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b13.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b27.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b28.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b32.jpg" />
                            </div>
                        </div>
                    </div>
                    <div class="Author-item-container">
                        <div class="Author-items">
                            <div class="Author-item-parts">
                                <img src="Image/b7.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b14.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b29.png" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b33.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b34.jpg" />
                            </div>
                        </div>
                    </div>
                    <div class="Author-item-container">
                        <div class="Author-items">
                            <div class="Author-item-parts">
                                <img src="Image/b8.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b15.jpg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b30.png" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b37.jpeg" />
                            </div>
                            <div class="Author-item-parts">
                                <img src="Image/b39.jpg" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <div class="footer">
                <h5>University of Computer Studies, Pyay
                    
                </h5>
            </div>
</asp:Content>
