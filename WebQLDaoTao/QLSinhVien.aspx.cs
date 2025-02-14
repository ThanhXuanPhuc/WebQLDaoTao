using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;


namespace WebQLDaoTao
{
    public partial class QLSinhVien : System.Web.UI.Page
    {
        SinhVienDAO svDAO = new SinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btXuLy_Click(object sender, EventArgs e)
        {
            SinhVien sv = new SinhVien { MaSV = txtMaSV.Text, HoSV = txtHoSv.Text, TenSV = txtTenSV.Text, GioiTinh = rdNam.Checked? true:false, NgaySinh = DateTime.Parse(txtNgaysinh.Text), NoiSinh = txtNoiSinh.Text, DiaChi = txtDiaChi.Text };
            svDAO.Insert(sv);

            gvSinhVien.DataBind();
        }
    }
}