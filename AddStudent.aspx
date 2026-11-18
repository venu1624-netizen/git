<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="StudentManagementDB.AddStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Student</title>
    <style>
        body {
            font-family: Arial;
            margin: 40px;
        }

        .form-control {
            width: 250px;
            padding: 8px;
            margin: 10px;
        }

        .btn {
            padding: 10px;
            background: green;
            color: white;
            border: none;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
         <h2>Add New Student</h2>

    Name:
    <asp:TextBox ID="txtName" runat="server"
        CssClass="form-control"></asp:TextBox>

    <br />

    Age:
    <asp:TextBox ID="txtAge" runat="server"
        CssClass="form-control"></asp:TextBox>

    <br />

    Class:
    <asp:TextBox ID="txtClass" runat="server"
        CssClass="form-control"></asp:TextBox>

    <br />

    Email:
    <asp:TextBox ID="txtEmail" runat="server"
        CssClass="form-control"></asp:TextBox>

    <br />

    <asp:Button ID="btnSave" runat="server"
        Text="Save Student"
        CssClass="btn"
        OnClick="btnSave_Click" />

    <br /><br />

    <asp:Label ID="lblMessage" runat="server"
        ForeColor="Green"></asp:Label>

    <br />

    <asp:HyperLink ID="lnkBack" runat="server"
        NavigateUrl="StudentList.aspx">
        Back to Student List
    </asp:HyperLink>

    </form>
</body>
</html>
