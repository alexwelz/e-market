<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="CartWeb.detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div id="carouselExampleDark" class="carousel carousel-dark slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="<%:item.Images[0]%>" class="d-block w-75" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="<%:item.Images[1]%>" class="d-block w-75" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="<%:item.Images[2]%>" class="d-block w-75" alt="...">
                </div>
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
    </center>




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
