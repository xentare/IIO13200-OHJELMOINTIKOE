<%@ Page Language="C#" AutoEventWireup="true" CodeFile="H4113_T3a_login.aspx.cs" Inherits="H4113_T3a_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ladun suhaajat</title>
</head>
<body>
<h1>Ladun suhaajat</h1>
  <form id="form1" runat="server">
    <h3>
      Logon Page</h3>
    <table>
      <tr>
        <td>
          E-mail address:</td>
        <td>
          <asp:TextBox ID="UserName" runat="server" /></td>
      </tr>
      <tr>
        <td>
          Password:</td>
        <td>
          <asp:TextBox ID="UserPass" TextMode="Password" 
             runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          Remember me?</td>
        <td>
          <asp:CheckBox ID="Persist" runat="server" /></td>
      </tr>
    </table>
    <asp:Button ID="Submit1" OnClick="Logon_Click" Text="Log On" 
       runat="server" />
      <asp:Label runat="server" ID="Error_Msg"></asp:Label>
  </form>
    <img src="http://honkajoenseudunurheilijat.fi/wp-content/gallery/voimanosto/hiihto1.jpg"/>
</body>
</html>

