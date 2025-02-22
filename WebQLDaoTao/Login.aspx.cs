using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQLDaoTao
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            bool check = true;
            if (check)
            {
                Session["TaiKhoan"] = "doituongtaikhoan";
                Response.Redirect("Default.aspx");
            } else
            {

            }
        }
    }
}