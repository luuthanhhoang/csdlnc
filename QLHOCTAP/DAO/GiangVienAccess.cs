using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO {
    public class GiangVienAccess : ConnectAccess {
        public DataSet SearchGV() {
            DataSet dt = new DataSet();
            openConection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_giang_vien";
            command.Connection = conn;

            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(dt);
            return dt;
        }
    }
}
