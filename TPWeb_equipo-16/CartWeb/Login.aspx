<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CartWeb.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top: 50px;">
        <center>

        <%if (Session["UserName"] == null && Session["Programa"]==null  )
            { %>

        <div class="row mb-3" style="width:50%;"  >
        <div>
            <label for="user" class="form-label"></label>
            <div class="input-group">
                <asp:TextBox runat="server" ID="theUser" style="border-color:dimgrey;" CssClass="form-control" placeholder="User" required></asp:TextBox>
            </div>
        </div>
            <span style="margin-right: 10px;"></span>
        <div>
            <label for="password" class="form-label"></label>
            <div class="input-group">
                <asp:TextBox runat="server" ID="thePassword" style="border-color:dimgrey;" TextMode="Password" CssClass="form-control" placeholder="Password" required></asp:TextBox>
            </div>
        </div>
    </div>
    <asp:Button Text="Log in" runat="server" OnClick="liveAlertBtn_Click" CssClass="btn btn-primary" ID="liveAlertBtn" style="background-color: tomato; margin-bottom: 50px; margin-top: 20px" />
    <a class="btn btn-secondary text-light text-decoration-none" href="Default.aspx" style="margin-bottom: 50px; margin-top: 20px"><strong>Back</strong></a>

      </center>
    </div>
    <%}
        else if ((string)Session["UserName"] != "Maxi" || (string)Session["Password"] != "Programa")
            {
            %>
         
         <div class="container" style="margin-top: 50px;">
              <center>
                  <hr />
                  <br />
                   <h1>Loged Failed,please retry!</h1>
                  <%if ((string)Session["UserName"] != "Maxi" || (string)Session["Password"] != "Programa")
                    {%>
                     <h2>(User: Maxi - Password: Programa)</h2>

                  <%} %>
                 
                  <div style=" background-image: url('https://img.freepik.com/vector-gratis/ilustracion-concepto-advertencia_114360-1551.jpg?w=740&t=st=1697494241~exp=1697494841~hmac=a1a0626298f44e95e01e7054650da9578f4a18b7d9fdf881f34cc9be21a8de9a');background-size: cover;width: 300px;height: 200px;">  </div>           
                  <br />
                  <asp:Button Text="Retry" runat="server"  OnClick="retryLogtBtn_Click" CssClass="btn btn-primary" ID="retryLog" style="background-color: tomato; margin-bottom: 50px; margin-top: 20px" />
                  <br />
                  <hr />
              </center>
          </div>
                    
        <%   }
        else 
        {%>
     <div class="container" style="margin-top: 50px;">
         <center>
             <hr />
             <br />
             <h1>Welcome again! <%:(string)Session["UserName"]%> ,you are loged</h1>
             <h2>Let go home to see whats news</h2>
             <div style=" background-image: url('https://acad.xlri.ac.in/evening/images/login.svg');background-size: cover;width: 300px;height: 200px;">  </div>
             
             <asp:Button Text="Home" runat="server"  OnClick="btnRedirect_Click" CssClass="btn btn-primary" ID="Button1" style="background-color:tomato; margin-bottom: 50px; margin-top: 20px" />
              <asp:Button Text="Logout" runat="server"  OnClick="retryLogtBtn_Click" CssClass="btn btn-secondary text-light text-decoration-none" ID="Logout" style="margin-bottom: 50px; margin-top: 20px" />
             <br />
             <hr />
         </center>
     </div>
    <%}%>

</asp:Content>
