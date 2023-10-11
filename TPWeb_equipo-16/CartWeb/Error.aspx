<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="CartWeb.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <div class="row" style="margin-top: 2%; margin-bottom: 2%; justify-content: center;">
    <img src="tomato.jpg" alt="Error" style="width:70%; height:70%; ">
      </div>

    <div class="btn-container" style="display:flex; justify-content: center;  padding-bottom: 40px;">
     <a href="<%: ResolveUrl("~/Default.aspx") %>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color:dimgray; color: white; background-color:tomato;">   Go home   </a>
        </div>
    
</asp:Content>
 

