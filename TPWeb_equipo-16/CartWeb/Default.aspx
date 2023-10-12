<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CartWeb.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container"style="height: 90%;width:100%">
  
<asp:Repeater ID="myRepeater" runat="server" OnItemCommand="myRepeater_ItemCommand">
    <ItemTemplate>
        <div class="col-12 col-md-6 col-lg-4 mb-2">
            <div class="card" style="border-color: darkgray; height: 100%;">
                <a href="<%# ResolveUrl("~/Detail.aspx?id=" + Eval("Id")) %>">
                    <img src="<%# Eval("Images[0]") %>" class="card-img-top" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="...">
                </a>
                <div class="card-body text-center" style="margin-bottom: 20px;">
                    <center>
                        <p class="card-text" style="font-size: 16px; color: black;"><strong><%# Eval("Brand.Descripcion") %></strong></p>
                        <p class="card-title" style="font-size: 15px;"><%# Eval("Name") %></p>
                        <p class="card-text" style="font-size: 12px;"><%# Eval("Description") %></p>
                        <p class="card-text" style="font-size: 14px;">$ <%# Eval("Price") %></p>
                        <div class="btn-group" role="group">
                            <asp:Button runat="server" Text="Add To Cart" ID="btnAddToCart" CommandName="AddToCart" OnCommand="btnAddToCart_Click" CommandArgument='<%# Eval("ItemCode") %>'
                                class="btn btn-outline-light" UseSubmitBehavior="false" 
                                style="background-color: tomato; color: white; font-weight: bold; border-color: dimgray" />
                            <a href="<%# ResolveUrl("~/Detail.aspx?id=" + Eval("Id")) %>" class="btn btn-outline-secondary" style="font-weight: bold; border-color: dimgray;" title="Detail">+</a>
                        </div>
                    </center>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
      
    
      
</div>
   <div style="width:100%; background-color:red; color:yellow;">
	<h1>ACULATION</h1>
	
	<%if(currentCart == null){%>
		<h1>0</h1>
	<%}
		else{%>
		
			<h1><%:currentCart.itemList.Count().ToString()%></h1>
		
		
		<% } %>
</div>


  
</asp:Content>



