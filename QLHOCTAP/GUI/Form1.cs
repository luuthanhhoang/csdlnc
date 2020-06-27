using BLL;
using DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI {
    public partial class Form1 : Form {
        public Form1() {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e) {
            
        }

        private void button1_Click(object sender, EventArgs e) {
            StudentBLL stbll = new StudentBLL();
            DataTable Dsst = stbll.GetAllStudent();
            dtgvSinhvien.DataSource = Dsst;
        }

        private void dtgvSinhvien_CellClick(object sender, DataGridViewCellEventArgs e) {
            if (e.RowIndex == -1) return;
            DataGridViewRow row = dtgvSinhvien.Rows[e.RowIndex];
            txtMSV.Text = row.Cells[0].Value + "";
            txtHoTen.Text = row.Cells[1].Value + "";
            txtNamHoc.Text = row.Cells[2].Value + "";
            txtKyHoc.Text = row.Cells[3].Value + "";
            txtKhoaHoc.Text = row.Cells[4].Value + "";
        }

        private void btnSearch_Click(object sender, EventArgs e) {
            SearchStudentBLL sst = new SearchStudentBLL();
            if (txtMSV.Text != "") {
                DataTable Std = sst.SearchStudent("ID", txtMSV.Text);
                dtgvSinhvien.DataSource = Std;
                return;
            }
            if (txtHoTen.Text != "") {
                DataTable Std = sst.SearchStudent("STUDENT_NAME", txtHoTen.Text);
                dtgvSinhvien.DataSource = Std;
                return;
            }
            if (txtNamHoc.Text != "") {
                DataTable Std = sst.SearchStudent("YEAR", txtNamHoc.Text);
                dtgvSinhvien.DataSource = Std;
                return;
            }
            if (txtKyHoc.Text != "") {
                DataTable Std = sst.SearchStudent("SEMESTER", txtKyHoc.Text);
                dtgvSinhvien.DataSource = Std;
                return;
            }
            if (txtKhoaHoc.Text != "") {
                DataTable Std = sst.SearchStudent("TITLE", txtKhoaHoc.Text);
                dtgvSinhvien.DataSource = Std;
                return;
            }
        }

        private void btnQuanLy_Click(object sender, EventArgs e) {
            Form2 f = new Form2();
            this.Hide();
            f.ShowDialog();
            this.Show();
        }
    }
}
