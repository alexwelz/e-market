<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="CartWeb.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

        <div class="container text-center">
    <div class="row justify-content-center">
        <div class="col-12">
            <h1>     Items     </h1>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        
        <% 
            foreach (Domain.Item item in itemList)
            {
        %>       
            <div class="col">
                <div class="card">
                      <a href="<%: ResolveUrl("~/Detail.aspx?id=" + item.Id) %>">
                      <img src="<%: item.Images[0] %>" class="card-img-top" alt="...">
                      </a>
                      <div class="card-body">
                         <h5 class="card-title"><%: item.Name %></h5> 
                        <p class="card-text"><%: item.Description %></p>
                        <p class="card-text"> $ <%: item.Price %></p>
                        <div class="btn-group" role="group">
                          <a href="#" class="btn btn-primary" onclick="Addtocart(<%: item.Id %>); return false;">Add to cart</a>
                          <a href="<%: ResolveUrl("~/Detail.aspx?id=" + item.Id) %>" class="btn btn-secondary">+</a>
                             </div>     
                    </div>
                </div>
            </div>
          <%  } %>
           
        </div>
        </div>
</asp:Content>
