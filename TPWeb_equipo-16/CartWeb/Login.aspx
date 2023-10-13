<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CartWeb.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--  <div class="container" style="margin-top: 50px;">

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="user" class="form-label">User</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="user" placeholder="User name" name="user" required>
                </div>
            </div>
            <div class="col-md-6">
                <label for="password" class="form-label">Password</label>
                <div class="input-group">
                    <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
                </div>
            </div>
        </div>
       <button type="submit" value="Log in" class="btn btn-primary text-center" id="liveAlertBtn" style="background-color: tomato; color: white; font-weight: bold; border-color: dimgray; margin-bottom: 50px; margin-left:27.5%;"><strong>Log in</strong></button>
        <a class="btn btn-secondary text-light text-decoration-none text-center" href="Default.aspx" style="margin-bottom: 50px; margin-left:2px;"><strong>Back</strong></a>
    </div>--%>

    <div class="container" style="margin-top: 50px;">



        <div class="row mb-3">
            <div class="col-md-6">
                
                    <label for="user" class="form-label">User name</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="user" placeholder="User" name="user" required>
                    </div>
                
            </div>
            <div class="col-md-6">
                <label for="password" class="form-label">Password</label>
                <div class="input-group">
                    <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
                </div>
            </div>
        </div>

        <button type="submit" value="Send Message" class="btn btn-primary" id="liveAlertBtn" style="background-color: green; margin-bottom: 50px; margin-top:20px;"><strong>Log in</strong></button>
        <a class="btn btn-secondary text-light text-decoration-none" href="Default.aspx" style="margin-bottom: 50px; margin-top:20px;"><strong>Back</strong></a>
        <div id="liveAlertPlaceholder"></div>


        <script>
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
                    const userInput = document.querySelector('input[name="user"]');
                    const passwordImput = document.querySelector('input[name="password"]');

                    if (userInput.value === '') {
                        appendAlert('Please enter your user name.', 'danger');
                    } else if (passwordImput.value === '') {
                        appendAlert('Please enter your password.', 'danger');
                    } 
                });
            }

        </script>

    </div>


</asp:Content>
