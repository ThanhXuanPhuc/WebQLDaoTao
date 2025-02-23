using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQLDaoTao
{
    public partial class Login : SecurePage
    {

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