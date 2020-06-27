using BLL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI {
    public partial class Form2 : Form {
        public Form2() {
            InitializeComponent();
        }


        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e) {
            
        }

        private void Form2_Load(object sender, EventArgs e) {
            GiangVienBLL gvb = new GiangVienBLL();
            KhoaVienBLL kvb = new KhoaVienBLL();
            KhoaHocBLL khb = new KhoaHocBLL();
            DataSet kh = khb.SearchKH();
            DataSet kv = kvb.SearchKV();
            DataSet dt = gvb.SearchGV();
            cboGiangVien.DataSource = dt.Tables[0];
            cboGiangVien.DisplayMember = "INSTRUCTOR_NAME";
            cboKhoaVien.DataSource = kv.Tables[0];
            cboKhoaVien.DisplayMember = "DEPT_NAME";
            cboKhoaHoc.DataSource = kh.Tables[0];
            cboKhoaHoc.DisplayMember = "TITLE";
        }

        private void txtTimKiemF2_Click(object sender, EventArgs e) {
            SearchF2BLL sst = new SearchF2BLL();
            if (cboGiangVien.SelectedIndex != -1) {
                DataTable sgv = sst.SearchF2Student("INSTRUCTOR_NAME", this.cboGiangVien.GetItemText(this.cboGiangVien.SelectedItem));
                dtgvSinhVienF2.DataSource = sgv;
            }
            if (cboKhoaVien.SelectedIndex != -1) {
                DataTable skv = sst.SearchF2Student("DEPT_NAME", this.cboKhoaVien.GetItemText(this.cboKhoaVien.SelectedItem));
                dtgvSinhVienF2.DataSource = skv;
            }
            if (cboKhoaHoc.SelectedIndex != -1) {
                DataTable skh = sst.SearchF2Student("TITLE", this.cboKhoaHoc.GetItemText(this.cboKhoaHoc.SelectedItem));
                dtgvSinhVienF2.DataSource = skh;
            }
        }

        private void button1_Click(object sender, EventArgs e) {
            Form1 f = new Form1();
            this.Hide();
            f.ShowDialog();
        }
        string strConn = "Data Source=DESKTOP-K34KCGE;Initial Catalog=QLSINHVIEN;Integrated Security=True";
        public SqlConnection conn = null;
        public void openConection() {
            if (conn == null) {
                conn = new SqlConnection(strConn);
            }
            if (conn.State == ConnectionState.Closed) {
                conn.Open();
            }
        }
        private void txtDangKyF2_Click(object sender, EventArgs e) {
            try {
                openConection();
                SqlCommand command = new SqlCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = "INSERT INTO TAKES_INDEX VALUES(@msv, @mkh, @matime, @ky, @nam, @grade)";
                command.Connection = conn;

                SqlParameter parmsv = new SqlParameter("@msv", SqlDbType.VarChar);
                parmsv.Value = txtMSVF2.Text;
                command.Parameters.Add(parmsv);
                SqlParameter parmkh = new SqlParameter("@mkh", SqlDbType.VarChar);
                parmkh.Value = txtKhoaHocF2.Text;
                command.Parameters.Add(parmkh);
                SqlParameter parmatime = new SqlParameter("@matime", SqlDbType.VarChar);
                parmatime.Value = txtMaTimeF2.Text;
                command.Parameters.Add(parmatime);
                SqlParameter parky = new SqlParameter("@ky", SqlDbType.VarChar);
                parky.Value = txtKyF2.Text;
                command.Parameters.Add(parky);
                SqlParameter parnam = new SqlParameter("@nam", SqlDbType.Int);
                parnam.Value = Convert.ToInt32(txtNamHocF2.Text);
                command.Parameters.Add(parnam);
                SqlParameter pargrade = new SqlParameter("@grade", SqlDbType.VarChar);
                pargrade.Value = "";
                command.Parameters.Add(pargrade);

                command.Connection = conn;
                int ret = command.ExecuteNonQuery();
                if (ret > 0) {
                    lblThongBaoDK.Text = "Đăng ký thành công!";
                }
                else {
                    lblThongBaoDK.Text = "Đăng ký thất bại!";
                }
            }
            catch (Exception ex) {
                lblThongBaoDK.Text = ex.Message;
            }
        }

        private void button3_Click(object sender, EventArgs e) {
            try {
                openConection();
                SqlCommand command = new SqlCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = "DELETE dbo.STUDENT WHERE ID = @msv";
                command.Connection = conn;

                SqlParameter parmsv = new SqlParameter("@msv", SqlDbType.VarChar);
                parmsv.Value = txtMSV3.Text;
                command.Parameters.Add(parmsv);
                command.Connection = conn;
                int ret = command.ExecuteNonQuery();
                if (ret > 0) {
                    lblThongBaoDK3.Text = "Xóa thành công!";
                }
                else {
                    lblThongBaoDK3.Text = "Xóa thất bại!";
                }
            }
            catch (Exception ex) {
                lblThongBaoDK3.Text = ex.Message;
            }
        }

        private void button5_Click(object sender, EventArgs e) {
            try {
                openConection();
                SqlCommand command = new SqlCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = "UPDATE dbo.STUDENT_INDEX SET NAME = @ht, DEPT_NAME = @mkv, TOT_CRED = @tc WHERE ID = @msv";
                command.Connection = conn;

                SqlParameter parmsv = new SqlParameter("@msv", SqlDbType.VarChar);
                parmsv.Value = txtmsvcn.Text;
                command.Parameters.Add(parmsv);

                SqlParameter parmht = new SqlParameter("@ht", SqlDbType.VarChar);
                parmht.Value = txtHotencn.Text;
                command.Parameters.Add(parmht);

                SqlParameter parmkv = new SqlParameter("@mkv", SqlDbType.VarChar);
                parmkv.Value = txtKhoaviencn.Text;
                command.Parameters.Add(parmkv);
 
                SqlParameter parmTC = new SqlParameter("@tc", SqlDbType.VarChar);
                parmTC.Value = txtTCcn.Text;
                command.Parameters.Add(parmTC);


                int ret = command.ExecuteNonQuery();
                if (ret > 0) {
                    lblCapnhat.Text = "Cập nhật thành công!";
                }
                else {
                    lblCapnhat.Text = "Cập nhật thất bại!";
                }
            }
            catch (Exception ex) {
                lblCapnhat.Text = ex.Message;
            }
        }
    }
}
