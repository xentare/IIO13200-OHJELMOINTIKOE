<%@ Page Language="C#" AutoEventWireup="true" CodeFile="H4113_T3a_exercises.aspx.cs" Inherits="H4113_T3a_exercises" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <a href="H4113_T3a_default.aspx">Default page</a>
    <form id="form1" runat="server">
    <div>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowSorting="true">
    <Columns>
        <asp:BoundField DataField="name" HeaderText="Name"/>
        <asp:BoundField DataField="date" HeaderText="Date"/>
        <asp:BoundField DataField="duration" HeaderText="Duration"/>
        <asp:BoundField DataField="distance" HeaderText="Distance"/>
    </Columns>
</asp:GridView>
    </div>
        <asp:Label runat="server" ID="Total"></asp:Label>
        <asp:DropDownList runat="server" ID="dropdownlist">
            <asp:ListItem Text="Ville"></asp:ListItem>
            <asp:ListItem Text="Ilvo"></asp:ListItem>
            <asp:ListItem Text="Musti"></asp:ListItem>
            <asp:ListItem Text="Tero"></asp:ListItem>
        </asp:DropDownList>
        <asp:Button Text="Filter" runat="server" OnClick="Unnamed_Click" />
    </form>

</body>
</html>

