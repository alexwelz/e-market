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

            <button type="submit" value="Order purchase" class="btn btn-primary" id="liveAlertBtn" style="background-color: green; margin-bottom: 50px;"><strong>Order purchase</strong></button>
            <a class="btn btn-secondary text-light text-decoration-none" href="Cart.aspx" style="margin-bottom: 50px;"><strong>Back</strong></a>
            <div id="liveAlertPlaceholder"></div>
            <input type="hidden" name="_next" value="https://localhost:44394/Default.aspx"></input>
            <input type="hidden" name="_captcha" value="false"></input>


            <p style="color:red"><strong>Data Mail: cartproyect@gmail.com Password: TPWeb_equipo-16</strong></p>
        </div>

        <script>

            /*====================== alter Email ===========================*/
            const alertPlaceholder = document.getElementById('liveAlertPlaceholder');

            const appendAlert = (message, type) => {
                const alertDiv = document.createElement('div');
                alertDiv.classList.add('alert', `alert-${type}`, 'alert-dismissible', 'fade', 'show');
                alertDiv.innerHTML = `
    <div>${message}</div>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  `;

                alertPlaceholder.appendChild(alertDiv);

                setTimeout(() => {
                    alertDiv.classList.remove('show');
                    setTimeout(() => {
                        alertDiv.remove();
                    }, 1000);
                }, 5000);
            };

            const alertTrigger = document.getElementById('liveAlertBtn');

            if (alertTrigger) {
                alertTrigger.addEventListener('click', () => {
                    const nameInput = document.querySelector('input[name="name"]');
                    const lastNameImput = document.querySelector('input[name="lastName"]');
                    const typeDocumentSelect = document.querySelector('select[name="typeDocument"]');
                    const numberImput = document.querySelector('input[name="number"]');
                    const emailInput = document.querySelector('input[name="Email"]');


                    if (nameInput.value === '') {
                        appendAlert('Please enter your name.', 'danger');
                    } else if (lastNameImput.value === '') {
                        appendAlert('Please enter your last name.', 'danger');
                    } else if (typeDocumentSelect.value === '-1') {
                        appendAlert('Please enter your select option', 'danger');
                    } else if (numberImput.value === '') {
                        appendAlert('Please enter your document number.', 'danger');
                    } else if (emailInput.value === '') {
                        appendAlert('Please enter your email address. Example: example@gmail.com', 'danger');
                    } else {
                        appendAlert('The order has been successfully shipped!', 'success');
                    }
                });
            }


        </script>

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
