
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CartWeb.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <center>
           <h1> Your Purchase : </h1>
       </center>
    <div id="Cartsumay" style="width:70%;margin-left:15%;" >   
     <div class="row" style="margin-top: 100px; margin-left: 50px; margin-right:50px; margin-bottom: 100px;border-color: dimgray">

<asp:Repeater ID="repeaterItems" runat="server">
    <ItemTemplate>
      
        <div class="col-12 col-md-6 col-lg-4 mb-2">
            <div class="card" style="border-color: darkgray; height: 100%;">
                <a href="<%# ResolveUrl("~/Detail.aspx?id=" + Eval("item.Id")) %>">
                    <img src="<%# Eval("item.Images[0]") %>" class="card-img-top" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="...">
                </a>
                <div class="card-body text-center" style="margin-bottom: 20px;">
                    <center>
                        <p class="card-text" style="font-size: 16px; color: black;"><strong><%#Eval("item.Brand.Descripcion")%></strong></p>
                        <p class="card-title" style="font-size: 15px;"><%#Eval("item.Name")%></p>
                        <p class="card-text" style="font-size: 12px;"><%#Eval("item.Description")%></p>
                        <p class="card-text" style="font-size: 14px;">$ <%#Eval("item.Price")%></p>
                        <p class="card-text" style="font-size: 14px;">Amount : x<%#Eval("Amount")%></p> 
                        <div>   
                       <asp:Button ID="btnDeleteFromCart" runat="server" Text="Delete" OnClick="btnDeleteFromCart_Click" CommandArgument='<%# Eval("item.ItemCode") %>'
                            UseSubmitBehavior="false"
                        style="background-color: tomato; color: white; font-weight: bold; border-color: dimgray"/>
                       <asp:Button ID="btnModify" runat="server" Text="Modify" OnClick="btnModify_Click" CommandArgument='<%# Eval("item.ItemCode") %>'
                            UseSubmitBehavior="false"
                        style="background-color: tomato; color: white; font-weight: bold; border-color: dimgray"/>
                                  
                    </center>
                     
                </div>
            </div>
        </div>
     
    </ItemTemplate>

 
</asp:Repeater>
         </div>
 </div>
    <center>
       <div>
        <h2> Total products amount :<%:currentCart.TotalProducts.ToString() %></h2>
           <h2>Total price of your purchase : $<%:currentCart.Total.ToString() %></h2>
       </div>
    </center>
</asp:Content>
