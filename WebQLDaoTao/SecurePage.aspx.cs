using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQLDaoTao
{
    public partial class SecurePage : Page
    {
        protected void Page_Load(object sender)
        {
            if (Session["TaiKhoan"] == null)
            {
               Response.Redirect("Login.aspx");
            }
            string role = Session["VaiTro"] as string;

            if (role != "CBĐT")
            {
                Response.Write("<script>alert('Bạn không có quyền truy cập trang này!'); window.location='Login.aspx';</script>");
                
            }
        }

    }
}