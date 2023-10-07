<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CartWeb.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container-fluid" style="margin: 0; padding: 0; ">

        <div class="row">


            <div class="col-md-3" id="FilterPlace" style="margin: 0; padding: 0;background-color:grey;">

                <!-- Contenido del primer div -->
            </div>


            <div class="col-md-7" id="itemsNavigation">



                <div class="row justify-content-center">
                    <div class="col-12">
                        <h1>Items     </h1>
                    </div>
                </div>


                <div class="row row-cols-1 row-cols-md-4 g-4">
                    <% 
                        foreach (Domain.Item item in itemList)
                        {
                    %>
                    <div class="col-12 col-md-6 col-lg-4" style="margin-bottom:20px;">
                        <div class="card">
                            <a href="<%: ResolveUrl("~/Detail.aspx?id=" + item.Id) %>">
                                <img src="<%: item.Images[0] %>" class="card-img-top" style="max-height: 250px; width: 100%;" alt="...">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title"><%: item.Name %></h5>
                                <p class="card-text"><%: item.Description %></p>
                                <p class="card-text">$ <%: item.Price %></p>
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


        <div class="col-md-2" id="siderPublicity" style="margin: 0; padding: 0;background-color:grey;">
            <!-- Contenido del primer div -->
        </div>



        </div>
    </div>
</asp:Content>
