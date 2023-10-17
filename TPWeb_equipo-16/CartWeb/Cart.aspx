<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CartWeb.Cart"   maintainScrollPositionOnPostback="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
    <div class="row align-items-center">
        <div class="col">
            <h1 style="margin-top: 2%; margin-bottom: 2%;">Your cart</h1>
        </div>
        <div class="col-auto">
            <a href="<%: ResolveUrl("~/Default.aspx?") %>" class="btn btn-light" style="background-color:tomato; color:white; font-weight:bold; border-color:dimgray"> Back </a>
        </div>
    </div>
</div>   
    
    
    
    
 
    <div class="table-responsive">
    <table class="table cart-items" style="text-align: center; vertical-align: middle; width:70% ; margin-left: 15%; margin-right:15%;">
        <thead>
            <tr>
                <th scope="col" style="color: dimgrey; width: 50%;">Product</th>
                <th scope="col" style="width: 50%;"></th>
                <th scope="col" style="color: dimgrey; width: 50%; font:100;">Price</th>
                <th scope="col" style="color: dimgrey; width: 40%;">Amount</th>
                <th scope="col" style="color: dimgrey; width: 50%;">Subtotal</th>
                <th scope="col" style="color: dimgrey; width: 30%;"></th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="repeaterItems" runat="server">
                <ItemTemplate>
                    <tr>
                        <td> 
                            <asp:Image ID="imgItem" runat="server" ImageUrl='<%# (Eval("item.Images[0].Url").ToString() == "FailedLoad") ? "descarga.png" : (Eval("item.Images[0].Url").ToString() == "EmptyImage") ? "emptyImage.jpg" : Eval("item.Images[0].Url") %>' CssClass="card-img-top" style="object-fit: scale-down; height: 25vh; width: 50%" alt="Image" />  
                         </td>
                        <td>
                            <%# Eval("item.Name") %><br />
                           <p style="color:dimgray; font-size:small;"> <%# Eval("item.Brand.Descripcion") %></p>
                            
                        </td>

                        <td style="font-weight: bold;">$<%# Eval("item.Price") %></td>
                        <td><div style="margin-top:6%; font-size: 20px;  margin-left:7%;">
                             <div class="btn-group">
                                <asp:Button ID="btnDash" runat="server" Text="-" OnClick="btnDash_Click" CommandArgument='<%# Eval("item.ItemCode") %>'
                                    UseSubmitBehavior="false"
                                    class="btn btn-outline-secondary" style="font-weight: bold; border-color: white;  font-size: 25px; " />
                                <span style="font-size: 25px; vertical-align:middle;  "><%#Eval("Amount")%></span>
                                 <asp:Button ID="btnPlus" runat="server" Text="+" OnClick="btnPlus_Click" CommandArgument='<%# Eval("item.ItemCode") %>'
                                    UseSubmitBehavior="false"
                                    class="btn btn-outline-secondary" style="font-weight: bold; border-color: white; font-size: 25px; " />
                                
                            </div>
                            </div>
                        </td>
                        <td style="font-weight: bold;">$<%# Eval("SubTotal")  %> </td>
                        <td>
                            <asp:LinkButton ID="btnDeleteFromCart" runat="server" OnClick="btnDeleteFromCart_Click" CommandArgument='<%# Eval("item.ItemCode") %>' UseSubmitBehavior="false" OnClientClick="return confirm('Are you sure you want to delete this Item?');">
                            <i class="bi bi-trash-fill text-danger"></i>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
        </div>
          



    <center>
        <div style="padding-top: 1%; padding-bottom: 1%; background-color: tomato; color: white;">
            <h2>Total products amount :<%:currentCart.TotalProducts.ToString() %></h2>
            <h2>Total price of your purchase : $<%:currentCart.Total.ToString() %></h2>
            <div>
                <asp:LinkButton ID="orderFinalizePurchase" runat="server" OnClick="orderFinalizePurchase_Click" CommandArgument='<%# Eval("item.ItemCode") %>' UseSubmitBehavior="false">
                           <a class="btn btn-warning text-light text-decoration-none" href="FinalizePurchase.aspx"><strong>Buy</strong></a>
                </asp:LinkButton>
            </div>

        </div>
    </center>
</asp:Content>
