<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IIO13200 .NET-ohjelmointi</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>IIO13200 .NET-ohjelmointi</h1>
        <p>Tee websitellä uusi index-sivu, ja tee tehtäville kullekin oma sivu. Nimeä sivut ohjeiden mukaan. Kaikki tarvittavat tehtävissä tarvittavat tiedostot on tallennettava websiten alikansioihin.<br /> Onnea ja menestystä kokeeseen.</p>
    <h2>Kokeeseen osallistuvat</h2>
        <p>Testataan yhteys Eight-palvelimelle:</p>
        <asp:SqlDataSource ID="srcIlmot" 
      ConnectionString="<%$ ConnectionStrings:Ilmot%>"
      SelectCommand="SELECT DISTINCT asioid, lastname, firstname FROM lasnaolot WHERE course LIKE 'IIO13200%' ORDER BY lastname "
       runat="server"></asp:SqlDataSource>
        <asp:GridView ID="myGridView" runat="server" DataSourceID="srcIlmot"></asp:GridView>
    </div>
    </form>
</body>
</html>
