using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL {
    public class KhoaVienBLL {
        public DataSet SearchKV() {
            KhoaVienAccess kvac = new KhoaVienAccess();
            return kvac.SearchKV();
        }
    }
}
