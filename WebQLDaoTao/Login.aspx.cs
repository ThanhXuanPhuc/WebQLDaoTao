using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class Login : SecurePage
    {

        TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();

        protected void btLogin_Click(object sender, EventArgs e)
        {
            string tenDN = txtUsername.Text.Trim();
            string matKhau = txtPassword.Text.Trim();

            TaiKhoan tk = taiKhoanDAO.DangNhap(tenDN, matKhau);

            if (tk != null)
            {
                // Lưu thông tin tài khoản vào Session
                Session["TaiKhoan"] = tk;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.Text = "❌ Tên đăng nhập hoặc mật khẩu không đúng!";
            }
        }
    }
}