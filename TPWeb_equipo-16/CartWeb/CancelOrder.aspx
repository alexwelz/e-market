<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CancelOrder.aspx.cs" Inherits="CartWeb.CancelOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:50px;">

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="name" class="form-label">Name</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="name" placeholder="Name">
                </div>
            </div>
            <div class="col-md-6">
                <label for="lastName" class="form-label">Last name</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="lastName" placeholder="Last name">
                </div>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="typeDocument" class="form-label">Type of Document</label>
                <div class="input-group">
                    <select class="form-select" id="typeDocument">
                        <option value="DNI">DNI</option>
                        <option value="Passport">Passport</option>
                        <option value="identificationCard">identification card</option>
                    </select>
                </div>
            </div>
            <div class="col-md-6">
                <label for="documentNumber" class="form-label">Document number</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="documentNumber" placeholder="Number">
                </div>
            </div>
        </div>

        <div class="mb-3">
            <label for="emailAdress" class="form-label">Email adress</label>
            <div class="input-group">
                <input type="email" class="form-control" id="emailAdress" placeholder="Email">
            </div>
        </div>

         <label for="reasonRegret" class="form-label">Reason for regret</label>
                <div class="input-group" style="margin-bottom:20px;">
                    <select class="form-select" id="reasonRegret">
                        <option value="-1" selected>Select option</option>
                        <option value="1">I made a mistake when making the purchase</option>
                        <option value="2">For late delivery</option>
                        <option value="3">No discount/promotion applied</option>
                        <option value="4">No discount coupon applied</option>
                        <option value="5">My order arrived incomplete</option>
                    </select>
                </div>

        <div class="mb-3">
            <label for="orderNumber" class="form-label">Order number</label>
            <div class="input-group">
                <input type="order" class="form-control" id="orderNumber" placeholder="Order (PENDING)">
            </div>
        </div>

        <div class="mb-3">
            <label for="comments" class="form-label">Comments</label>
            <div class="input-group">
                <textarea class="form-control" id="comments" rows="3" placeholder="Your Message"></textarea>
            </div>
        </div>
        <button type="submit" class="btn btn-primary" style="background-color: green; margin-bottom:50px;"><strong>Send</strong></button>

    </div>



</asp:Content>
