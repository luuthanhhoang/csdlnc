using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO {
    public class StudentAccess :ConnectAccess {
        public/* List<Student>*/ DataTable GetAllStudent() {
            //List<Student> DsStudents = new List<Student>();
            openConection();

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "EXEC SP_SEE_STUDENTS";
            command.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            da.Fill(dt);
            //SqlDataReader reader = command.ExecuteReader();

            //while (reader.Read()) {
            //    string Ma = reader.GetString(0);
            //    string Ten = reader.GetString(1);
            //    string Nam = Convert.ToString(reader.GetInt32(2));
            //    string Ky = reader.GetString(3);
            //    string Khoahoc = reader.GetString(4);
            //    string Day = reader.GetString(5);
            //    int Phong = reader.GetInt32(6);
            //    string GV = reader.GetString(7);
            //    string Vien = reader.GetString(8);

            //    Student st = new Student();
            //    st.MSSV = Ma;
            //    st.TenSV = Ten;
            //    st.NamHoc = Nam;
            //    st.KyHoc = Ky;
            //    st.KhoaHoc = Khoahoc;
            //    st.Time = Day;
            //    st.Room = Phong;
            //    st.GiangVien = GV;
            //    st.Vien = Vien;
            //    DsStudents.Add(st);
            //}

            return /*DsStudents*/ dt;
        }
    }
}
