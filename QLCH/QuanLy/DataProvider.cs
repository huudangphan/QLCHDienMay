using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLy
{
    public class DataProvider
    {
        
        public static SqlConnection conn = new SqlConnection();
        public static String connStr = "";
        public static String con_pulisher = @"Data Source= DESKTOP-2021EVR\MAYCHU ; Initial Catalog= QLDienMay; Integrated Security=True";
        public static SqlDataReader myReader;
        public static String serverName = "";
        public static String userName = "";
        public static String mLogin = "";
        public static String password = "";
        public static String database = "QLDienMay";
        public static String remote_login = "KetNoi";
        public static String remote_password = "24122021";
        public static String mLoginDN = "";
        public static String passWordDN = "";
        public static String mGroup = "";

        public static int maCN = 0;
        public static String mHoTen = "";
        public static BindingSource danhSachChiNhanh = new BindingSource();

        public static int KetNoi()
        {
            if (conn != null && conn.State == System.Data.ConnectionState.Open)
                conn.Close();
            try
            {
                connStr = "Data Source=" + serverName.ToString() + ";Initial Catalog=" + database + ";User ID=" + mLogin + ";password=" + password;
                conn.ConnectionString = connStr;
                conn.Open();
                return 1;
            }
            catch (Exception ex)
            {
                string a = ex.ToString();
                MessageBox.Show(a);
                return 0;
            }
        }

        public static DataTable ExecuteQuery(string query, object[] parameter = null)
        {
            DataTable data = new DataTable();
            try
            {
                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand(query, connection);

                    if (parameter != null)
                    {
                        string[] listPara = query.Split(' ');
                        int i = 0;
                        foreach (string item in listPara)
                        {
                            if (item.Contains('@'))
                            {
                                command.Parameters.AddWithValue(item, parameter[i]);
                                i++;
                            }
                        }
                    }

                    SqlDataAdapter adapter = new SqlDataAdapter(command);

                    adapter.Fill(data);

                    connection.Close();
                }

                return data;
            }
            catch (Exception ex)
            {

               
            }
            return null;
           
        }

        public static int ExecuteNonQuery(string query, object[] parameter = null)
        {
            int data = 0;
            try
            {
                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand(query, connection);

                    if (parameter != null)
                    {
                        string[] listPara = query.Split(' ');
                        int i = 0;
                        foreach (string item in listPara)
                        {
                            if (item.Contains('@'))
                            {
                                command.Parameters.AddWithValue(item, parameter[i]);
                                i++;
                            }
                        }
                    }

                    data = command.ExecuteNonQuery();

                    connection.Close();
                }

                return data;
            }
            catch (Exception ex)
            {
                string error = ex.Message.ToString();
                return data;
            }
           
        }

        public static object ExecuteScalar(string query, object[] parameter = null)
        {
            object data = 0;

            using (SqlConnection connection = new SqlConnection(connStr))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();

                connection.Close();
            }

            return data;
        }
        public static SqlDataReader ExecDataReader(string cmd)
        {
            SqlDataReader myReader;
            SqlCommand sqlcmd = new SqlCommand(cmd, conn);
            
            try
            {
                sqlcmd.CommandType = System.Data.CommandType.Text;
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                myReader = sqlcmd.ExecuteReader();
                return myReader;
            }
            catch (Exception ex)
            {

                conn.Close();
                MessageBox.Show(ex.Message.ToString());
                return null;
            }

        }

    }
    
}

