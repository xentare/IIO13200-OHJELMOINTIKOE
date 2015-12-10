<%@ Page Language="C#" AutoEventWireup="true" CodeFile="H4113_T3a_default.aspx.cs" Inherits="H4113_T3a_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <a href="H4113_T3a_exercises.aspx">Exercises</a>
    <h3>Add Exercise</h3>
    <form id="add_exercise_form" runat="server">
        Name: <asp:TextBox runat="server" ID="Name"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" Display="None" ErrorMessage="Name can't be empty" ControlToValidate="Name"/>
        <asp:RegularExpressionValidator runat="server" Display="None" ControlToValidate="Name" ErrorMessage="Name is format: Juha "
            ValidationExpression="([A-Z])+([a-z]){3,10}"/>

        Date: <asp:TextBox runat="server" ID="Date"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" Display="None"  ErrorMessage="Date can't be empty" ControlToValidate="Date"/>
        <asp:RegularExpressionValidator runat="server" Display="None" ControlToValidate="Date" ErrorMessage="Date is format: DD.MM.YYYY"
            ValidationExpression="[0-9]{1,2}[.][0-9]{1,2}[.][0-9]{4}"/>

        Duration:<asp:TextBox runat="server" ID="Duration"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" Display="None"  ErrorMessage="Duration can't be empty" ControlToValidate="Duration"/>
        <asp:RegularExpressionValidator runat="server" Display="None" ControlToValidate="Duration" ErrorMessage="Duration is format: HH.MM"
            ValidationExpression="[0-9]{1,2}[.][0-9]{1,2}"/>

        Distance: <asp:TextBox runat="server" ID="Distance"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" Display="None"  ErrorMessage="Distance can't be empty" ControlToValidate="Distance"/>
        <asp:RegularExpressionValidator runat="server" Display="None" ControlToValidate="Distance" ErrorMessage="Distance is format: XXX"
            ValidationExpression="[0-9]{1,3}"/>

        <asp:Button runat="server" ID="add_exercice_button" Text="Submit Exercise" OnClick="add_exercice_button_OnClick"/>
      <asp:Button runat="server" ID="Logout" Text="Logout" OnClick="Logout_OnClick"/>
    <asp:ValidationSummary runat="server" HeaderText="Correct the following fields: " DisplayMode="BulletList"/>
        <asp:Label runat="server" ID="exercises_count" />
         </form>
</body>
</html>
