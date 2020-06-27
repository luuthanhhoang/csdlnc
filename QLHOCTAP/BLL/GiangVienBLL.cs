using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL {
    public class GiangVienBLL {
        public DataSet SearchGV() {
            GiangVienAccess gvac = new GiangVienAccess();
            return gvac.SearchGV();
        }
    }
}
