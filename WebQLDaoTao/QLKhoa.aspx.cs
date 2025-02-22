using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLKhoa : SecurePage
    {
        KhoaDAO khDAO = new KhoaDAO();
       

        protected void btXuLy_Click(object sender, EventArgs e)
        {
            Khoa kh = new Khoa { MaKH = txtMaKH.Text, TenKH = txtTenKH.Text };
            khDAO.Insert(kh);

            gvKhoa.DataBind();
        }
    }
}