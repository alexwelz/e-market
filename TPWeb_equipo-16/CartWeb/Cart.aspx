<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CartWeb.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <center>
        <h1 style="margin-top: 2%; margin-bottom: 2%;">  Cart  </h1>
    </center>
    
   

   <asp:Repeater ID="repeaterItems" runat="server">
    <ItemTemplate>
        <div class="col-12 mb-2">
            <div class="card" style="border-color: darkgray; height: 100%; display: flex; flex-direction: column;">
                <div class="col-12 col-md-12" style="display: flex;">
                    <div class="col-12 col-md-4">
                        <img src="<%# Eval("item.Images[0]") %>" class="card-img-top" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="...">
                    </div>
                    <div class="col-12 col-md-8">
                        <div class="card-body"  style="display: flex; Flex-wrap: wrap;">
                            <p class="card-title" style="margin-top:7%; font-size: 30px;  margin-left:8%;"><%#Eval("item.Name")%></p>
                            <p class="card-text" style="margin-top:7%; font-size: 25px; margin-left:8%; color: black;"><strong><%#Eval("item.Brand.Descripcion")%></strong></p>
                            <p class="card-text" style="margin-top:7%; font-size: 20px;  margin-left:8%;">$ <%#Eval("item.Price")%></p>
                            <div style="margin-top:6%; font-size: 20px;  margin-left:7%;">
                                <asp:Button ID="btnPlus" runat="server" Text="+" OnClick="btnPlus_Click" CommandArgument='<%# Eval("item.ItemCode") %>'
                                    UseSubmitBehavior="false"
                                    class="btn btn-outline-secondary" style="font-weight: bold; border-color: white; font-size: 30px; " />
                                <span style="font-size: 25px; font-weight: bold; "><%#Eval("Amount")%></span>
                                <asp:Button ID="btnDash" runat="server" Text="-" OnClick="btnDash_Click" CommandArgument='<%# Eval("item.ItemCode") %>'
                                    UseSubmitBehavior="false"
                                    class="btn btn-outline-secondary" style="font-weight: bold; border-color: white;  font-size: 30px; " />
                            </div>
                            <div style="margin-top:7%; font-size: 20px;  margin-left:8%;">
                                <asp:LinkButton ID="btnDeleteFromCart" runat="server" OnClick="btnDeleteFromCart_Click" CommandArgument='<%# Eval("item.ItemCode") %>' UseSubmitBehavior="false">
                                    <i class="bi bi-trash-fill text-danger"></i> 
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>







    <center>
        <div style="padding-top:1%; padding-bottom:1%; background-color:tomato; color:white;">
            <h2>Total products amount :<%:currentCart.TotalProducts.ToString() %></h2>
            <h2>Total price of your purchase : $<%:currentCart.Total.ToString() %></h2>
            <a class="btn btn-warning text-light text-decoration-none"  href="FinalizePurchase.aspx"><strong>Buy</strong></a>
        </div>
    </center>
</asp:Content>
