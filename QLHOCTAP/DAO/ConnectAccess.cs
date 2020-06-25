using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO {
    public class ConnectAccess {
        string strConn = "Data Source=DESKTOP-K34KCGE;Initial Catalog=QLSINHVIEN;Integrated Security=True";
        public SqlConnection conn = null;
        public void openConection() {
            if(conn == null) {
                conn = new SqlConnection(strConn);
            }
            if (conn.State == ConnectionState.Closed) {
                conn.Open();
            }           
        }
        public void closeConnection() {
            if (conn != null && conn.State == ConnectionState.Open) {
                conn.Close();
            }
        }
    }
}
