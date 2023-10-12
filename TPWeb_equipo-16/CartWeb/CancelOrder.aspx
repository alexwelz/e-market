<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CancelOrder.aspx.cs" Inherits="CartWeb.CancelOrder" %>

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

            <label for="reasonRegret" class="form-label">Reason for regret</label>
            <div class="input-group" style="margin-bottom: 20px;">
                <select class="form-select" id="reasonRegret" name="reasonRegret" required>
                    <option value="-1" selected>Select option</option>
                    <option value="I made a mistake when making the purchase">I made a mistake when making the purchase</option>
                    <option value="For late delivery">For late delivery</option>
                    <option value="No discount/promotion applied">No discount/promotion applied</option>
                    <option value="No discount coupon applied">No discount coupon applied</option>
                    <option value="My order arrived incomplete">My order arrived incomplete</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="orderNumber" class="form-label">Order number</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="orderNumber" placeholder="Purchase order " name="orderNumber" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="comments" class="form-label">Comments</label>
                <div class="input-group">
                    <textarea class="form-control" id="comments" cols="30" rows="10" placeholder="Your Message" name="comments" style=" resize: none;" required></textarea>
                </div>
            </div>

            <button type="submit" value="Send Message"class="btn btn-primary" id="liveAlertBtn" style="background-color: green; margin-bottom: 50px;"><strong>Send Message</strong></button>
            <a class="btn btn-secondary text-light text-decoration-none"  href="Default.aspx" style="margin-bottom:50px;"><strong>Back</strong></a>
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
                const reasonRegretSelect = document.querySelector('select[name="reasonRegret"]');
                const orderNumberImput = document.querySelector('input[name="orderNumber"]');
                const messageTextarea = document.querySelector('textarea[name="comments"]');

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
                } else if (reasonRegretSelect.value === '-1') {
                    appendAlert('Please enter your select option', 'danger');
                } else if (orderNumberImput.value === '') {
                    appendAlert('Please enter the order number.', 'danger');
                } else if (messageTextarea.value === '') {
                    appendAlert('Please enter your message.', 'danger');
                } else {
                    appendAlert('The mail was sent successfully!', 'success');
                }
            });
        }


    </script>

</asp:Content>