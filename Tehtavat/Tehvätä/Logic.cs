using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tehvätä
{
    class Logic
    {
        MainWindow window;
        public Logic(MainWindow window)
        {
            this.window = window;
        }

        public void laskeKirjaimet(string kirjaimet)
        {
            char[] array = kirjaimet.ToCharArray();
            int count = 0;
            Dictionary<char, int> dictionary = new Dictionary<char, int>();

            foreach(char c in array)
            {
                if (Char.IsLetter(c))
                {
                    if (!dictionary.ContainsKey(c))
                    {
                        dictionary.Add(c, 1);
                    } else
                    {
                        dictionary[c] += 1;
                    }
                    count++;
                }
            }
            foreach(KeyValuePair<char,int> kv in dictionary)
            {

                window.appendTextBox(kv.Key + " = " + kv.Value+"\n");
            }
            window.appendTextBox("Yhteensä " + count + " merkkiä ja " + dictionary.Count + " eri kirjainta");
        }

    }
}
