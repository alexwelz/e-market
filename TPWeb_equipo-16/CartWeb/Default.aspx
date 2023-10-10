<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CartWeb.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
  

    <% if (itemList == null || (List<Domain.Item>)Session["filteredItems"] != null)
    { 
        itemList = (List<Domain.Item>)Session["filteredItems"]; 
    }  
    %>

    <div class="row" style="margin-top: 50px; margin-left: 25px; margin-right:25px;">
        <% foreach (Domain.Item item in itemList)
        { %>
        <div class="col-12 col-md-6 col-lg-4 mb-2">
            <div class="card">
                <a href="<%: ResolveUrl("~/Detail.aspx?id=" + item.Id) %>">
                    <img src="<%: item.Images[0] %>" class="card-img-top" style="width: 100%; max-width: var(--max); height: calc(var(--max)); object-fit: cover;" alt="...">
                </a>
                <div class="card-body">
                    <h5 class="card-title"><%: item.Name %></h5>
                    <p class="card-text"><%: item.Description %></p>
                    <p class="card-text">$ <%: item.Price %></p>
                    <div class="btn-group" role="group">
                        <a href="#" class="btn btn-primary" onclick="Addtocart(<%: item.Id %>); return false;" style="background-color: green; color: white;">Add to cart</a>
                       <a href="<%: ResolveUrl("~/Detail.aspx?id=" + item.Id) %>" class="btn btn-secondary" style="font-size: 20px;" title="Detail"><strong>+</strong></a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>


</asp:Content>
