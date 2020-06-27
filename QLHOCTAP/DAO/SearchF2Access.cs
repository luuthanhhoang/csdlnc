using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO {
    public class SearchF2Access : ConnectAccess {
        public DataTable SearchF2Student(string field, string value) {
            DataTable dt = new DataTable();
            openConection();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "EXEC SP_LOC_DU_LIEU_B102 @field, @value";
            command.Connection = conn;

            SqlParameter parField = new SqlParameter("@field", SqlDbType.VarChar);
            parField.Value = field;
            command.Parameters.Add(parField);
            SqlParameter parValue = new SqlParameter("@value", SqlDbType.VarChar);
            parValue.Value = value;
            command.Parameters.Add(parValue);

            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(dt);
            closeConnection();
            return dt;
        }
    }
}
