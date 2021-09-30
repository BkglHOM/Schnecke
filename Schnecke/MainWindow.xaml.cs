using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
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
using System.Data;

namespace Schnecke
{
   
    public partial class MainWindow : Window
    {
      

        string query;
       


        public MainWindow()
        {
            InitializeComponent();
            
            query = "SELECT * FROM kunden WHERE idKunden = '" + GlobaleVariablen.loginid + "'";
            //SQL abfrage   sucht passende user wo UN und PW passen
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(query, GlobaleVariablen.sqlconnection);

            //Genutzt um daten aus der DB zu ziehen   zieht alle die passen rein 
            DataTable dt = new DataTable();

            //Tabelle die die c# rafft
            dataAdapter.Fill(dt);

            //Nutzerdaten werden links eingegeben
            user_name.Text = "Name: " + Convert.ToString(dt.Rows[0].ItemArray[1]);
            user_alter.Text = "Alter: " + Convert.ToString(dt.Rows[0].ItemArray[3]);
            user_bio.Text = "Bio: " + Convert.ToString(dt.Rows[0].ItemArray[5]);
            user_hobby.Text = "Hobby: " + Convert.ToString(dt.Rows[0].ItemArray[6]);


            schnecken();

        }
        void schnecken()
        {
            query = "SELECT * FROM kunden WHERE idKunden != '" + GlobaleVariablen.loginid + "'";
            //SQL abfrage   sucht passende user wo UN und PW passen
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(query, GlobaleVariablen.sqlconnection);
            //Genutzt um daten aus der DB zu ziehen   zieht alle die passen rein 
            DataTable dt = new DataTable();
            //Tabelle die die c# rafft

            dataAdapter.Fill(dt);


            //Zufallsdaten werden rechts eingegeben
            Random rant = new Random();
            int randomint = rant.Next(1, dt.Rows.Count);

            match_name1.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[1]);
            match_alter1.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[3]);
            match_bio1.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[5]);
            match_hobby1.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[6]);

            randomint = rant.Next(1, dt.Rows.Count);
            match_name2.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[1]);
            match_alter2.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[3]);
            match_bio2.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[5]);
            match_hobby2.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[6]);

            randomint = rant.Next(1, dt.Rows.Count);
            match_name3.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[1]);
            match_alter3.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[3]);
            match_bio3.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[5]);
            match_hobby3.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[6]);

            randomint = rant.Next(1, dt.Rows.Count);
            match_name4.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[1]);
            match_alter4.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[3]);
            match_bio4.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[5]);
            match_hobby4.Text = "Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[6]);

            

            
        }

        private void refresh(object sender, RoutedEventArgs e)
        {

            schnecken();
        }
    }

}
