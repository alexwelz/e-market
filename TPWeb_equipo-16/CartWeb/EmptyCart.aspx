<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmptyCart.aspx.cs" Inherits="CartWeb.EmptyCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
   <div class="row" style="margin-top: 5%; margin-bottom: 2%; justify-content: center;">
    <img src="emptycart.png" alt="empty cart" style="width:50%; height:50%; ">
       
      </div>
     
     
    <div class="container" style="text-align: center; margin-top: 1%; margin-bottom: 2%;">
        <h2>You have no items in your shopping cart.</h2>
    </div>


    <div class="btn-container" style="display:flex; justify-content: center;  padding-bottom: 40px; margin-bottom: 5%;">
     <a href="<%: ResolveUrl("~/Default.aspx") %>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color:dimgray; color: white; background-color:tomato;" >   Search items   </a>
        </div>

</asp:Content>
