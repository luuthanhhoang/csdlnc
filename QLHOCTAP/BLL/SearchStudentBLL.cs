using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL {
    public class SearchStudentBLL {
        public DataTable SearchStudent(string field, string value) {
            SearchAccess sstd = new SearchAccess();
            return sstd.SearchStudent(field, value);
        }
    }
}
