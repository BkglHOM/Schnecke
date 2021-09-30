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
        int pwkeydwnint = 0;

        string query;


        public Login()
        {
            

            InitializeComponent();
        }

        void loginlogik()
        {


            //Login Button
            //mysqlcon = new MySqlConnection(GlobaleVariablen.sqlconnection);

            query = "SELECT * FROM kunden WHERE KundenUsername = '" + Username.Text.Trim() + "' AND KundenPW = '" + Password.Password.Trim() + "'";
            //SQL abfrage   sucht passende user wo UN und PW passen
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(query, GlobaleVariablen.sqlconnection);
            //Genutzt um daten aus der DB zu ziehen   zieht alle die passen rein 
            DataTable dt = new DataTable();
            //Tabelle die die c# rafft
            try
            {
                dataAdapter.Fill(dt);
                //zieht daten in die tabelle aus der DB in den DT 
            }
            catch
            {
                //Fehlermeldung wegen Falschem DB PW
                MessageBox.Show("Fehler bei der Datenbankanbindung Bitte im code GlobaleVariablen.sqlconnection deinen login eingeben");
            }

            if (dt.Rows.Count == 1)
            {
                //PK wird in die loginid gespeichert um zu wissen wer sich denn einloggt
                GlobaleVariablen.loginid = Convert.ToInt32(dt.Rows[0].ItemArray[0]);

                //Main window wird generiert, geoffnet und das jetzige window geschlossen
                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Falscher Login du Schnecke");
            }
        }


        //Login Button
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            loginlogik();

        }

        //Username Text wird geloescht
        private void UsernameFocus(object sender, KeyboardFocusChangedEventArgs e)
        {
            int c = 0;
            while (c == 0)
            {
                Username.Text = "";
                c++;
            }
            
   
        }

        //Bei Enter im Username feld wird direkt auf das PW feld gewechselt
        private void UsernameKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key==Key.Enter)
            {
                Password.Focus();

            }
        }

        private void PasswordFocus(object sender, DependencyPropertyChangedEventArgs e)
        {
            
        }

        //PW box loeschung
        private void PasswordKeydown(object sender, KeyEventArgs e)
        {
            
                
                while (pwkeydwnint == 0)
                {
                    Password.Clear();
                    pwkeydwnint++;
                }
            
            if (e.Key==Key.Enter)
            {
                loginlogik();
            }
        }

        //Reg button
        private void Reg_Click(object sender, RoutedEventArgs e)
        {
            registrierung registrierung = new registrierung();
            registrierung.Show();
            this.Close();
        }
        

        
    }
}
