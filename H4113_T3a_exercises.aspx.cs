using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class H4113_T3a_exercises : System.Web.UI.Page
{
    string path;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            path = Server.MapPath(ConfigurationManager.AppSettings.Get("exercises_path"));
        }catch(Exception err)
        {

        }
        this.BindGrid();
        SetKilometersCount(User.Identity.Name);
    }

    private void PopulateDropDownList()
    {
        List<ListItem> list = new List<ListItem>();
        ListItem item = new ListItem("Ville");
        list.Add(item);
        dropdownlist.DataSource = list;
    }

    private void SetKilometersCount(string name)
    {
        int count = 0;
        XElement doc = XElement.Load(path);
        IEnumerable<XElement> descendants = from el in doc.Elements() select el;

        foreach (XElement el in descendants)
        {
            if (el.Element("name").Value == name)
            {
                count += int.Parse(el.Element("distance").Value);
                Console.WriteLine(el.Element("distance"));
            }
        }

        Total.Text = "Total Kilometers for: "+name+" " + count;
    }

    private void BindGrid()
    {
        using (DataSet ds = new DataSet())
        {
            ds.ReadXml(path);
            using (DataTable dt = ds.Tables[0])
            {
                dt.DefaultView.Sort = "date ASC";
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

        }

    }

    private void FilterByName()
    {
        using (DataSet ds = new DataSet())
        {
            ds.ReadXml(path);
            using (DataTable dt = ds.Tables[0])
            {
                dt.DefaultView.Sort = "date ASC";
                dt.DefaultView.RowFilter = "name = '" + dropdownlist.Text + "'";
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        FilterByName();
        SetKilometersCount(dropdownlist.Text);
    }
}