using DAO;
using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL {
    public class StudentBLL {
        StudentAccess st = new StudentAccess();
        public /*List<Student>*/ DataTable GetAllStudent() {          
            return st.GetAllStudent();
        }
    }
}
