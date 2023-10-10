
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CartWeb.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <% if (currentCart != null)
      {
          foreach (Domain.ItemList currentList in currentCart.itemList)
          {
              if (currentList.Amount != 0)
              {

                  Domain.Item aux = currentList.AddedItem[0];
                  Domain.Item aux2 = aux;

          %>
    <!-- Mostrar los detalles de los elementos en el carrito de la sesión -->
    <div class="col-12 col-md-6 col-lg-4 mb-2">
        <div class="card">
            <!-- Puedes mostrar detalles del elemento del carrito, como nombre, cantidad, precio, etc. -->
            <div class="card-body">
                <h5 class="card-title"><%: aux.Brand + " " + aux.Name %></h5>
                <p class="card-text">Quantity: <%: currentList.Amount%></p>
                <p class="card-text">Price: $ <%: aux.Price %></p>
                <!-- Puedes agregar un botón para eliminar el elemento del carrito si es necesario -->
                <a href="#" class="btn btn-danger" onclick=" deleteToCurrent(<%: aux2 %>); return false;">Remove</a>
            </div>
        </div>
    </div>
     <%     }
                    else
                    {%> 

                        <h1>    CARRITO VACIO</h1>
                   <% }
             }
         }%>
</asp:Content>
