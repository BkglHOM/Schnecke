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
    /// Interaktionslogik für regestrierung.xaml
    /// </summary>
    public partial class registrierung : Window
    {
        public registrierung()
        {
            InitializeComponent();
        }

        string query;

        void reglogik()
        {

            query = "INSERT INTO `operationschnecke`.`kunden` (`KundenVorname`, `KundenNachname`, `KundenGeburtstag`, `KundenWohnort`, `KundenBio`, `KundenHobby`, `KundenUsername`, `KundenPW`) VALUES ('"+Vorname.Text+"', '"+Nachname.Text+"', '"+Birthday.Text+"', '" + Wohnort.Text+"', '"+Bio.Text+"', '"+Hobby.Text+"', '"+Username.Text+"', '"+Passwort.Text+"');";

            MySqlConnection mySqlConnection = new MySqlConnection(GlobaleVariablen.sqlconnection);
            MySqlCommand cmd = new MySqlCommand(query, mySqlConnection);
            mySqlConnection.Open();
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + "Bitte Datumsformat YYYY-MM-DD verwenden");
                
            }
           
            mySqlConnection.Dispose();

            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void FRig_Click(object sender, RoutedEventArgs e)
        {
            reglogik();
            
        }

        private void RegKwyDown(object sender, KeyEventArgs e)
        {
            

            if (e.Key == Key.Enter)
            {
                reglogik();
            }

        }
    }
}