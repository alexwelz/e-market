<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="CartWeb.detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">t>

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
                                <select class="form-select form-select-sm" id="selectUnit" name="selectUnit" runat="server" required>
                                    <option value="-1" selected>Unit: Select</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6+</option>
                                    
                                </select>
                            </div>
              
                        <asp:Button ID="btnDetailAddToCart" runat="server" Text="Add to cart" Onclick="btnDetailAddToCart_Click" CssClass="btn btn-primary" style="background-color:tomato; color: white; font-weight: bold; border-color:dimgrey;" />

                      
                    </div>
                </div>

            </div>

        </center>
    </div>



    
</asp:Content>
