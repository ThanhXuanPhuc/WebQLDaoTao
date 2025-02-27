using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class Register : Page
    {
        TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();

        protected void btRegister_Click(object sender, EventArgs e)
        {
            string tenDN = txtUsername.Text.Trim();
            string matKhau = txtPassword.Text.Trim();
            string nhapLaiMK = txtRePassword.Text.Trim();
            string vaiTro = ddlRole.SelectedValue; 

            if (matKhau != nhapLaiMK)
            {
                lblMessage.Text = "❌ Mật khẩu nhập lại không khớp!";
                return;
            }

            if (taiKhoanDAO.KiemTraTonTai(tenDN))
            {
                lblMessage.Text = "❌ Tên đăng nhập đã tồn tại!";
                return;
            }

            TaiKhoan tk = new TaiKhoan
            {
                TenDN = tenDN,
                MatKhau = matKhau,
                VaiTro = vaiTro
            };

            if (taiKhoanDAO.Insert(tk) > 0)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "✅ Đăng ký thành công!";
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblMessage.Text = "❌ Đăng ký thất bại, vui lòng thử lại.";
            }
        }


    }
}