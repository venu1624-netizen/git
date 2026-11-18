<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentManagementDB.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }

        .login-box {
            width: 350px;
            margin: 100px auto;
            padding: 25px;
            background: white;
            border: 1px solid #ccc;
        }

        input {
            width: 95%;
            padding: 10px;
            margin: 10px 0;
        }

        .btn {
            background: blue;
            color: white;
            border: none;
            cursor: pointer;
        }</style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="login-box">
                                                        
        <h2>Admin Login</h2>
        <h1>Venugopal saravanabava</h1>

        <asp:Label ID="lblMessage" runat="server"
            ForeColor="Red"></asp:Label>

        <br />

        Username:
        <asp:TextBox ID="txtUserName" runat="server">
        </asp:TextBox>

        Password:
        <asp:TextBox ID="txtPassword" runat="server"
            TextMode="Password">
        </asp:TextBox>

        <asp:Button ID="btnLogin" runat="server"
            Text="Login"
            CssClass="btn"
            OnClick="btnLogin_Click" />
                 </div>

    </form>
</body>
</html>
