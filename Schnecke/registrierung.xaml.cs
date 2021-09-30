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
            //String fuer SQL command
            query = "INSERT INTO `operationschnecke`.`kunden` (`KundenVorname`, `KundenNachname`, `KundenGeburtstag`, `KundenWohnort`, `KundenBio`, `KundenHobby`, `KundenUsername`, `KundenPW`) VALUES ('"+Vorname.Text+"', '"+Nachname.Text+"', '"+Birthday.Text+"', '" + Wohnort.Text+"', '"+Bio.Text+"', '"+Hobby.Text+"', '"+Username.Text+"', '"+Passwort.Text+"');";

            //Connection infos
            MySqlConnection mySqlConnection = new MySqlConnection(GlobaleVariablen.sqlconnection);

            //Command String + DB (connection) ausgefuehrt wird, wird angelegt
            MySqlCommand cmd = new MySqlCommand(query, mySqlConnection);

            //Connection geoffnet
            mySqlConnection.Open();
            try
            {
                //Command wird ausgefuehrt
                cmd.ExecuteNonQuery();

                //Connection wird geschlossen
                mySqlConnection.Dispose();

                //Main window wird generiert, geoffnet und das jetzige window geschlossen
                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
            }
            catch (Exception ex)
            {
                //Fehlermeldung da zu 99% ein Falsches DatumsFormat verwendet wurde und SQL nur das mag.
                MessageBox.Show(ex.Message + "Bitte Datumsformat YYYY-MM-DD verwenden");
                
            }
           
            

            
        }


        //Reg. Key
        private void FRig_Click(object sender, RoutedEventArgs e)
        {
            reglogik();
            
        }


        //Bio enter key= eingabe in DB
        private void RegKwyDown(object sender, KeyEventArgs e)
        {
            

            if (e.Key == Key.Enter)
            {
                reglogik();
            }

        }
    }
}