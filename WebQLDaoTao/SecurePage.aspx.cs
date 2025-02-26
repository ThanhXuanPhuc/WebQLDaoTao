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
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (Session["TaiKhoan"] == null)
            {
                string currentPage = Request.Url.AbsolutePath.ToLower();

                // Tránh vòng lặp redirect trên trang đăng nhập
                if (!currentPage.EndsWith("login.aspx"))
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}