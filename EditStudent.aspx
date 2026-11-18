<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditStudent.aspx.cs" Inherits="StudentManagementDB.EditStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Student</title>
</head>
<body>
    <form id="form1" runat="server">
         <h2>Edit Student Details</h2>

    <asp:HiddenField ID="hfStudentID" runat="server" />

    Name:
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

    <br /><br />

    Age:
    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>

    <br /><br />

    Class:
    <asp:TextBox ID="txtClass" runat="server"></asp:TextBox>

    <br /><br />

    Email:
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

    <br /><br />

    <asp:Button ID="btnUpdate" runat="server"
        Text="Update Student"
        OnClick="btnUpdate_Click" />

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
