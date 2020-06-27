using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL {
    public class KhoaHocBLL {
        public DataSet SearchKH() {
            KhoaHocAccess khac = new KhoaHocAccess();
            return khac.SearchKH();
        }
    }
}
