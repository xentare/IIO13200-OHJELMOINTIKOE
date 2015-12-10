using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml.Linq;

namespace Tehtävä2WPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        string path;
        public MainWindow()
        {
            InitializeComponent();

            path = ConfigurationManager.AppSettings.Get("countries");
            List<string> maatList = new List<string>();

            XDocument doc = null;
            try
            {
                doc = XDocument.Load(path);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                Console.WriteLine("");
                MessageBox.Show("Can't find XML filepath");
                //this.Close();
            }

            //Haetaan maat XML-tagien sisästä
            var maat = doc.Descendants("Continent");
            maatList.Add("Kaikki");
            foreach (var maa in maat)
            {
                if (!maatList.Contains(maa.Value))
                {
                    maatList.Add(maa.Value);
                }
            }
            maatComboBox.ItemsSource = maatList;
            maatComboBox.SelectedIndex = 0;

            //Asetetaan alkuarvot viinilistalle
            XmlDataProvider dp = countriesDataGrid.DataContext as XmlDataProvider;
            dp.Source = new System.Uri(path);

        }

        private void laskeMaatButton_Click(object sender, RoutedEventArgs e)
        {
            XElement doc = XElement.Load(path);
            IEnumerable<XElement> decendants = from el in doc.Elements() select el;
            int count = 0;
                foreach (XElement el in decendants)
                {
                count++;
                }

            laskeMaatLabel.Content = count.ToString();
        }

        private void asukaslukujenYhteismääräButton_Click(object sender, RoutedEventArgs e)
        {
            XElement doc = XElement.Load(path);
            IEnumerable<XElement> decendants = from el in doc.Elements() select el;
            int populations = 0;
            foreach (XElement el in decendants)
            {
                populations +=  int.Parse(el.Element("Population").Value);
            }
            asukaslukujenYhteismääräLabel.Content = populations.ToString();
        }

        private void etsiButton_Click(object sender, RoutedEventArgs e)
        {
            XmlDataProvider dp = countriesDataGrid.DataContext as XmlDataProvider;

            if (maatComboBox.Text != "Kaikki")
            {
                dp.XPath = string.Format("DATA/ROW[contains(Continent,\"{0}\")]", maatComboBox.Text);
            }
            else
            {
                dp.XPath = "DATA/ROW";
            }
        }

        private void haeAsukaslukuButton_Click(object sender, RoutedEventArgs e)
        {
            XmlDataProvider dp = countriesDataGrid.DataContext as XmlDataProvider;

            XElement doc = XElement.Load(path);
            IEnumerable<XElement> decendants = from el in doc.Elements() select el;
            IEnumerable<XElement> ordered;
            List<int> list = new List<int>();
            foreach (XElement el in decendants)
            {
                list.Add(int.Parse(el.Element("Population").Value));
            }

            list.Sort();
            //10 Biggest so -11
            int x = list.ElementAt(list.Count()-11);
            Console.WriteLine(x);

            dp.XPath = string.Format("DATA/ROW[(Population > "+x+")]");
        }

        private void haePintaAlaButton_Click(object sender, RoutedEventArgs e)
        {
            XmlDataProvider dp = countriesDataGrid.DataContext as XmlDataProvider;

            XElement doc = XElement.Load(path);
            IEnumerable<XElement> decendants = from el in doc.Elements() select el;
            IEnumerable<XElement> ordered;
            List<int> list = new List<int>();
            foreach (XElement el in decendants)
            {
                list.Add(int.Parse(el.Element("SurfaceArea").Value.Split('.')[0]));
            }

            list.Sort();
            //10 Biggest so -11
            int x = list.ElementAt(list.Count() - 11);
            Console.WriteLine(x);

            dp.XPath = string.Format("DATA/ROW[(SurfaceArea > " + x + ")]");
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            XmlDataProvider dp = countriesDataGrid.DataContext as XmlDataProvider;
            dp.XPath = string.Format("DATA/ROW[contains(Name,\"{0}\")]", hakuTextBox.Text);
        }
    }
}
