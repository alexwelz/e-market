<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CartWeb.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container"style="height: 90%;width:100%">
  

 <% if ((List<Domain.Item>)Session["filteredItems"] != null)
        {
            itemList = (List<Domain.Item>)Session["filteredItems"];
            Session.Remove("filteredItems");
        }
    %>

    <div class="row" style="margin-top: 50px; margin-left: 25px; margin-right:25px; margin-bottom: 50px;">

        <% foreach (Domain.Item item in itemList)
        { %>
        <div class="col-12 col-md-6 col-lg-4 mb-2">
            <div class="card" style="border-color:darkgray; height:100%;">
                <a href="<%: ResolveUrl("~/Detail.aspx?id=" + item.Id) %>">
                    <%--<img src="<%: item.Images[0] %>" class="card-img-top" style="max-height: 200px;  max-width:100%; display: flex;  justify-content: center; align-items: center;   overflow: hidden;" alt="...">--%>
                    <img src="<%: item.Images[0] %>" class="card-img-top" style="object-fit:scale-down; height: 25vh; width: 100%;"  alt="...">
                </a>
       
                <div class="card-body text-center" style="margin-bottom:20px;">
                    <center>
                    
                    <p class="card-text" style="font-size: 16px; color: black;"><strong><%: item.Brand.Descripcion%></strong></p>
                    <p class="card-title" style="font-size: 15px;"><%: item.Name %></p>
                    <p class="card-text" style="font-size: 12px;"><%: item.Description %></p>
                    <p class="card-text" style="font-size: 14px;">$ <%: item.Price %></p>
                    <div class="btn-group" role="group">
                        <a href="#" class="btn btn-primary" onclick="AddItemToCart(<%: item%>); return false;" style="background-color:tomato; color: white; font-weight: bold; border-color:dimgrey;">Add to cart</a>
                        <a href="<%: ResolveUrl("~/Detail.aspx?id=" + item.Id) %>" class="btn btn-outline-secondary" style="font-weight: bold; border-color:dimgrey;" title="Detail">+</a>
                    </div>
                    </center>
                </div>
                   
            </div>
        </div>
        <% } %>
    </div>
      
</div>


</asp:Content>



