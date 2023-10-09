<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CartWeb.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container-fluid" style="margin: 0; padding: 0; ">

        <div class="row">


            <div class="col-md-2" style="margin: 2%; padding: 0;">

                <div id="FilterPlace" style="height:20%;border:1px solid #b6b6b6; border-radius: 10px;"> 
                     
        
            <div class="form-row" style="margin:1%;">
                <div class="form-group col-md-4">
                    <label for="ddlCategoria">Field</label>
                    <asp:DropDownList ID="ddlField" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlField_SelectedIndexChanged " AutoPostBack="true">
                       
                        <asp:ListItem Text="Codigo" Value="categoria1" />
                        <asp:ListItem Text="Nombre" Value="categoria2" />
                        <asp:ListItem Text="Precio" Value="categoria3" />
                        <asp:ListItem Text="Descripcion" Value="categoria3" />
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-4">
                    <label for="ddlEstado">Criterion:</label>
                    <asp:DropDownList ID="ddlCriterion" runat="server" CssClass="form-control">
                    
                       
                    </asp:DropDownList>
             
                </div>
                <div class="form-group col-md-3">
                    <label for="txtBusqueda">Búsqueda:</label>
                    <asp:TextBox ID="txtBusqueda" runat="server" CssClass="form-control" placeholder="Buscar..." />
                </div>
            </div>
            
    </div>
     
                <div id="leftPublicity" style="margin :2%;background-color:grey;height:75%">   

                </div>
                
            </div>


            <div class="col-md-8" id="itemsNavigation">



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


        <div class="col-md-1" id="siderPublicity" style="margin: 0; padding: 0;background-color:grey;">
            <!-- Contenido del primer div -->
        </div>



        </div>
    </div>
</asp:Content>
