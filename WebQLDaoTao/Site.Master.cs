using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TaiKhoan"] != null)
                {
                    TaiKhoan user = (TaiKhoan)Session["TaiKhoan"]; // Ép kiểu về đối tượng TaiKhoan
                    lblUser.Text = user.TenDN; // Hoặc user.HoTen nếu có
                    phDangNhap.Visible = false;
                    phTaiKhoan.Visible = true;
                }
                else
                {
                    // Hiển thị nút đăng nhập và đăng ký
                    phDangNhap.Visible = true;
                    phTaiKhoan.Visible = false;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["TaiKhoan"] = null; // Xóa session đăng nhập
            Response.Redirect("Default.aspx"); // Chuyển về trang đăng nhập
        }
    }
}