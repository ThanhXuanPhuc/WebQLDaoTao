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
        }

    }
}