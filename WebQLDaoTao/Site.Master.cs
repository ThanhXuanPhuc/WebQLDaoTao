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
                    TaiKhoan user = (TaiKhoan)Session["TaiKhoan"]; 
                    lblUser.Text = user.TenDN; 
                    phDangNhap.Visible = false;
                    phTaiKhoan.Visible = true;
                }
                else
                {
                    phDangNhap.Visible = true;
                    phTaiKhoan.Visible = false;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["TaiKhoan"] = null; 
            Response.Redirect("Default.aspx"); 
        }
    }
}