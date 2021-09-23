using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using MySql.Data.MySqlClient;
using System.Data;

namespace Schnecke
{
    /// <summary>
    /// Interaktionslogik für Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        
        string query;
        public Login()
        {
            

            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //Login Button
            //mysqlcon = new MySqlConnection(GlobaleVariablen.sqlconnection);



            query = "SELECT * FROM login WHERE Benutzername = '" + Username.Text.Trim() + "' AND Passwort = '" + Password.Password.Trim() + "'";
            //SQL abfrage   sucht passende user wo UN und PW passen
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(query, GlobaleVariablen.sqlconnection);
            //Genutzt um daten aus der DB zu ziehen   zieht alle die passen rein 
            DataTable dt = new DataTable();
            //Tabelle die die c# rafft
            
            dataAdapter.Fill(dt);
            //zieht daten in die tabelle die C# rafft
            
            
            
            
                
                
            if (dt.Rows.Count==1)
            {
                GlobaleVariablen.loginid = Convert.ToInt32(dt.Rows[0].ItemArray[0]);
                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Falscher Login du Schnecke");
            }


        }

        private void UsernameFocus(object sender, KeyboardFocusChangedEventArgs e)
        {
            

   
        }

        private void UsernameKeyDown(object sender, KeyEventArgs e)
        {
            if 
            {

            }
        }
    }
}
