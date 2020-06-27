using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL {
    public class SearchF2BLL {
        public DataTable SearchF2Student(string field, string value) {
            SearchF2Access sstd = new SearchF2Access();
            return sstd.SearchF2Student(field, value);
        }
    }
}
