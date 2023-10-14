<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CartWeb.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <center>
        <h1  margin-top: 5%;">  Cart  </h1>
    </center>
    
    <div id="Cartsumay" style="margin-left: 20%; margin-top: 3%;">
        <%-- <div class="row" style="margin-top: 100px; margin-left: 50px; margin-right: 50px; margin-bottom: 100px; border-color: dimgray"> --%>
       

            <asp:Repeater ID="repeaterItems" runat="server">
                <ItemTemplate>

                        <div class="col-12 col-md-6 col-lg-4 mb-2">
                           
                        <div class="card" style="border-color: darkgray; height:100%;">
                            <div class="row g-0">
                            <div class="col-md-4">
                                <img src="<%# Eval("item.Images[0]") %>" class="card-img-top" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="...">
                            </div>
                       
                            <div class="col-md-8">
                            <div class="card-body">                                
                                    <p class="card-title" style="font-size: 16px;"><%#Eval("item.Name")%></p> 
                                    <p class="card-text" style="font-size: 15px; color: black;"><strong><%#Eval("item.Brand.Descripcion")%></strong></p>
                                    <p class="card-text" style="font-size: 14px;">$ <%#Eval("item.Price")%></p>
                                  
                                    <div>
                                        <asp:Button ID="btnPlus" runat="server" Text="+" OnClick="btnPlus_Click" CommandArgument='<%# Eval("item.ItemCode") %>'
                                            UseSubmitBehavior="false"
                                           class="btn btn-outline-secondary" style="font-weight: bold; border-color: white " />

                                        <span style="font-size: 15px; font-weight: bold; "><%#Eval("Amount")%></span>
                                        <asp:Button ID="btnDash" runat="server" Text="-" OnClick="btnDash_Click" CommandArgument='<%# Eval("item.ItemCode") %>'
                                            UseSubmitBehavior="false"
                                            class="btn btn-outline-secondary" style="font-weight: bold; border-color: white " />


                                    </div>
                                    
                                  <div>                                     
                                       <asp:LinkButton ID="btnDeleteFromCart" runat="server" OnClick="btnDeleteFromCart_Click" CommandArgument='<%# Eval("item.ItemCode") %>' UseSubmitBehavior="false">
                               <i class="bi bi-trash-fill"></i> Eliminar
</asp:LinkButton>
                                    </div>

                      

                            </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </ItemTemplate>


            </asp:Repeater>
        <%-- </div>  --%>
    </div>
    <center>
        <div>
            <h2>Total products amount :<%:currentCart.TotalProducts.ToString() %></h2>
            <h2>Total price of your purchase : $<%:currentCart.Total.ToString() %></h2>
        </div>
    </center>
</asp:Content>
