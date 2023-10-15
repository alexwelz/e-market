<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FinalizePurchase.aspx.cs" Inherits="CartWeb.FinalizePurchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form action="https://formsubmit.co/e7c674b30a5e1e5cfd2246a1f59c28c2" method="POST">
        <div class="container" style="margin-top: 50px;">

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="name" class="form-label">Name</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="name" placeholder="Name" name="name" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="lastName" class="form-label">Last name</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="lastName" placeholder="Last name" name="lastName" required>
                    </div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="typeDocument" class="form-label">Type of Document</label>
                    <div class="input-group">
                        <select class="form-select" id="typeDocument" name="typeDocument" required>
                            <option value="-1" selected>Select option</option>
                            <option value="DNI">DNI</option>
                            <option value="Passport">Passport</option>
                            <option value="identificationCard">identification card</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="documentNumber" class="form-label">Document number</label>
                    <div class="input-group">
                        <input type="number" class="form-control" id="documentNumber" placeholder="Number" name="number" required>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <label for="emailAdress" class="form-label">Email adress</label>
                <div class="input-group">
                    <input type="email" class="form-control" id="emailAdress" placeholder="Email" name="Email" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="purchaseOrder" class="form-label">Purchase order</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="purchaseOrder" name="purchaseOrder" readonly>
                </div>
            </div>    
            
            <div class="mb-3">
                <label for="txtSummary" class="form-label">Purchase summary</label>
                <div class="input-group">
                      <textarea class="form-control" ID="txtSummary" cols="30" rows="10" name="PurchaseSummary" style="resize: none; margin-bottom:20px;" readonly>
    <% Response.Write(descriptionTextBlock()); %>
</textarea>   
                </div>
            </div>

            <asp:button runat="server" Text="Order purchase" type="submit" value="Order purchase" class="btn btn-primary" id="liveAlertBtn" style="background-color: green; margin-bottom: 50px;" OnClientClick="return confirm('Are you sure you want to confirm the order?');"></asp:button>

            <a class="btn btn-secondary text-light text-decoration-none" href="Cart.aspx" style="margin-bottom: 50px;"><strong>Back</strong></a>
            <div id="liveAlertPlaceholder"></div>
            <input type="hidden" name="_next" value="https://localhost:44394/Default.aspx"></input>
            <input type="hidden" name="_captcha" value="false"></input>

        </div>

        <script>

            function randomValue() {
                var caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                var randomValue = '';
                for (var i = 0; i < 6; i++) {
                    var indiceAleatorio = Math.floor(Math.random() * caracteres.length);
                    randomValue += caracteres.charAt(indiceAleatorio);
                }
                return randomValue;
            }

            var purchaseOrderImput = document.getElementById("purchaseOrder");
            purchaseOrderImput.value = randomValue();
        </script>
</asp:Content>
