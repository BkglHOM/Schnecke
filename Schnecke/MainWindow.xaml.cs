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
using MySql.Data.MySqlClient;
using System.Data;

namespace Schnecke
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        MySqlConnection mysqlcon;
        MySqlCommand mysqlcommand;

        string query;

        public MainWindow()
        {
            InitializeComponent();
            query = "SELECT * FROM kunden WHERE idLogin != '"+GlobaleVariablen.loginid+ "'";
            //SQL abfrage   sucht passende user wo UN und PW passen
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(query, GlobaleVariablen.sqlconnection);
            //Genutzt um daten aus der DB zu ziehen   zieht alle die passen rein 
            DataTable dt = new DataTable();
            //Tabelle die die c# rafft

            dataAdapter.Fill(dt);



            Random rant = new Random();
            int randomint = rant.Next(0, dt.Rows.Count);

            
            match_name.Text ="Name: " + Convert.ToString(dt.Rows[randomint].ItemArray[1]);
            match_alter.Text = "Alter: " + Convert.ToString(dt.Rows[randomint].ItemArray[3]);
            match_hobby.Text = "Hobby: " + Convert.ToString(dt.Rows[randomint].ItemArray[6]);
            match_bio.Text = "Bio: " + Convert.ToString(dt.Rows[randomint].ItemArray[5]);



        }
    }
}
