<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="StudentManagementDB.StudentList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student List</title>
    <style>
           body {
            font-family: Arial;
            margin: 30px;
        }

        table {
            margin-top: 20px;
        }

        .btn {
            padding: 8px;
            background: blue;
            color: white;
            text-decoration: none;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        
    <h2>Student Management System</h2>

    <h2>Edit studentlist</h2>

    <asp:Label ID="lblWelcome" runat="server"></asp:Label>

    <br /><br />

    <asp:HyperLink ID="lnkAdd" runat="server"
        NavigateUrl="AddStudent.aspx"
        CssClass="btn">
        Add New Student
    </asp:HyperLink>

    <asp:Button ID="btnLogout" runat="server"
        Text="Logout"
        OnClick="btnLogout_Click" />

    <br /><br />

    <asp:GridView ID="gvStudents" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="StudentID"
        OnRowDeleting="gvStudents_RowDeleting"
        CellPadding="8"
        BorderWidth="1">

        <Columns>

            <asp:BoundField DataField="StudentID"
                HeaderText="Student ID" />

            <asp:BoundField DataField="Name"
                HeaderText="Name" />

            <asp:BoundField DataField="Age"
                HeaderText="Age" />

            <asp:BoundField DataField="Class"
                HeaderText="Class" />

            <asp:BoundField DataField="Email"
                HeaderText="Email" />

            <asp:HyperLinkField
                Text="Edit"
                DataNavigateUrlFields="StudentID"
                DataNavigateUrlFormatString="EditStudent.aspx?id={0}" />

            <asp:CommandField
                ShowDeleteButton="True"
                DeleteText="Delete" />

        </Columns>

    </asp:GridView>
    </form>
</body>
</html>
