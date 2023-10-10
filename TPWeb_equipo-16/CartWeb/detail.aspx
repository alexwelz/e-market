<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="CartWeb.detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <center>
            <div class="row" style="margin-top: 10%; margin-bottom: 10%">
                <div class="col-md-8">


                    <div id="carouselExampleDark" class="carousel carousel-dark slide">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <%
                                bool first = true;
                                for (int i = 0; i < item.Images.Count(); i++)
                                {
                                    if (first)
                                    {
                                        first = false; %>
                            <div class="carousel-item active">
                                <img src="<%:item.Images[i]%>" class="d-block w-100" style="object-fit:scale-down; height: 50vh; width: 100%;"  alt="">
                            </div>
                            <%}
                                else
                                {%>

                            <div class="carousel-item ">
                                <img src="<%:item.Images[i]%>" class="d-block w-100" style="object-fit:scale-down; height: 50vh; width: 100%;" alt="">
                            </div>
                            <% }

                                } %>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="col-md-4" id="descriptionPlace" style="background-color: white; display:flex; align-items:center; justify-content:center;">
                    <div id="DatosdelItem" >
                     
                            <h3 id="lblName" runat="server"></h3>
                            <p><strong id="lblBrand" runat="server" style="font-size: 12px; color: dimgray;"></strong></p>
                            <p id="lblDescription" runat="server"></p>
                            <p><strong id="lblPrice" runat="server" style="font-size: 24px;"></strong></p>

                            <div class="mb-3">
                                <select class="form-select form-select-sm" id="selectUnit" name="selectUnit">
                                    <option value="-1" selected>Unit: Select</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6+</option>
                                    
                                </select>
                            </div>
                           <a href="#" class="btn btn-primary" onclick="AddItemToCart(<%: item%>); return false;" style="background-color:tomato; color: white; font-weight: bold; border-color:dimgrey;">Add to cart</a>
                      
                    </div>
                </div>

            </div>

        </center>
    </div>



    <%-- 
    
     <div id="Global">
        <center>
            <div class="row" style="height: 80%; width: 35%; border: 1px solid black; margin-top: 20%; margin-bottom: 20%;">
                <div class="col-md-3" id="imagenPlace" style="margin: 0; padding: 0;">
                    <div id="imagenContainer" style="height: 50%;">

                        <img src="https://cdn11.bigcommerce.com/s-h47f2g/images/stencil/1280x1280/attribute_rule_images/10159719_source_1667584203.jpg" style="max-width: 100%; height: auto; transform: translate(150%,0);" />

                    </div>
                </div>
            <div class="col-md-" id="descriptionPlace" style="margin: 0; padding: 0; background-color: grey;">
                <div id="DatosdelItem" style="height: 50%;">
                    <br />
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                    <br />
                </div>
            </div>
            </div>
        </center>
    </div>
    --%>
</asp:Content>
