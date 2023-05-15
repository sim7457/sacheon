using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace sacheon.Utill
{
    class DatabaseUtill
    {
        #region Method
        public DataSet SelectCommand(string query)
        {
            DataSet ds = new DataSet();

            try
            {
                using (MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["Database_info"].ConnectionString))
                {
                    conn.Open();

                    MySqlDataAdapter apt = new MySqlDataAdapter(query, conn);
                    apt.Fill(ds);

                }
            }
            catch (Exception ex)
            {
                
            }

            return ds;
        }

        public bool ExecuteNonCommand(string query)
        {
            bool _rs = false;

            try
            {
                using (MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["Database_info"].ConnectionString))
                {
                    conn.Open();

                    MySqlCommand cmd = new MySqlCommand(query, conn);

                    cmd.ExecuteNonQuery();

                    _rs = true;
                }
            }
            catch (Exception ex)
            {
                
            }

            return _rs;
        }
        #endregion
    }
}
