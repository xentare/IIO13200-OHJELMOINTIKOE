using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class H4113_T3a_default : System.Web.UI.Page
{

    string path;

    protected void Page_Load(object sender, EventArgs e)
    {
        Name.Text = User.Identity.Name;
        try
        {
            path = Server.MapPath(ConfigurationManager.AppSettings.Get("exercises_path"));
        }
        catch (Exception err)
        {
            
        }
        exercises_count.Text = "Total count of exercises: " + GetExerciseCount();
    }

    protected void Logout_OnClick(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }

    protected void add_exercice_button_OnClick(object sender, EventArgs e)
    {
        XDocument doc = XDocument.Load(path);
        XElement user = new XElement("exercise",
            new XElement("name", Name.Text),
            new XElement("date", Date.Text),
            new XElement("duration", Duration.Text),
            new XElement("distance", Distance.Text));
        doc.Element("exercises").Add(user);
        doc.Save(path);
    }

    private int GetExerciseCount()
    {
        int count = 0;
        XElement doc = XElement.Load(path);
        IEnumerable<XElement> descendants = from el in doc.Elements() select el;

        foreach (XElement el in descendants)
        {
            count++;
        }

        return count;
    }

}