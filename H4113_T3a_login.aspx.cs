using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class H4113_T3a_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }
    }

    public void Logon_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath(ConfigurationManager.AppSettings.Get("users_path"));
        /*            XDocument doc = XDocument.Load(path);
                    XElement user = new XElement("user",
                        new XElement("name", UserName.Text),
                        new XElement("password", PasswordHash.PasswordHash.CreateHash(UserPass.Text)));
                    doc.Element("users").Add(user);
                    doc.Save(path);*/

        XElement doc = XElement.Load(path);
        IEnumerable<XElement> decendants = from el in doc.Elements() select el;
        try
        {
            foreach (XElement el in decendants)
            {
                if (el.Element("name").Value == UserName.Text)
                {
                    if (PasswordHash.PasswordHash.ValidatePassword(UserPass.Text, el.Element("password").Value))
                    {
                        Debug.WriteLine("Correct");
                        FormsAuthentication.RedirectFromLoginPage(UserName.Text, Persist.Checked);
                    }

                }
                else
                {
                    Error_Msg.Text = "Incorrect username or password!";
                }
                Debug.WriteLine(el.Element("name").Value);
            }
        }
        catch (NullReferenceException err)
        {
            Debug.WriteLine(err);
        }
    }
}