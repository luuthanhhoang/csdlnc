using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO {
    public class KhoaHocAccess :ConnectAccess {
        public DataSet SearchKH() {
            DataSet dt = new DataSet();
            openConection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_khoa_hoc";
            command.Connection = conn;

            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(dt);
            return dt;
        }
    }
}
