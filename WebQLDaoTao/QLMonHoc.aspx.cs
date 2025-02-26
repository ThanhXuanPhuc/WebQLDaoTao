using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLMonHoc : SecurePage
    {
        MonHocDAO mhDAO = new MonHocDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                NapDuLieu();
            }
        }

        private void NapDuLieu()
        {
            gvMonHoc.DataSource = mhDAO.getAll();
            gvMonHoc.DataBind();
        }

        protected void gvMonHoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMonHoc.EditIndex = e.NewEditIndex;
            NapDuLieu();
        }

        protected void gvMonHoc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMonHoc.EditIndex = -1;
            NapDuLieu();
        }

        protected void gvMonHoc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //lay manh
            string mamh = gvMonHoc.DataKeys[e.RowIndex].Value.ToString();
            //lay tenmh
            string tenmh = ((TextBox)gvMonHoc.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            //lay sotiet
            int sotiet = int.Parse(((TextBox)gvMonHoc.Rows[e.RowIndex].Cells[2].Controls[0]).Text);
            //goi thu vien DAO de cap nhat mon hoc
            MonHoc mh = new MonHoc { MaMH = mamh, TenMH = tenmh, SoTiet = sotiet };
            mhDAO.Update(mh);
            //chuyen trang thai cho gvMonHoc
            gvMonHoc.EditIndex = -1;
            //nap lai du lieu cho gvMonHoc
            NapDuLieu();
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            try
            {
                //Lấy thông tin môn học cần thêm
                string mamh = txtMaMH.Text;
                string tenmh = txtTenMH.Text;
                int sotiet = int.Parse(txtSoTiet.Text);
                //Tạo đối tượng môn học
                //gọi phương thức insert của tầng DAO
                mhDAO.Insert(mamh,tenmh, sotiet);
                //Load lại dữ liệu cho GridView
                NapDuLieu();
            }
            catch (Exception ex)
            {

            }
        }

        protected void gvMonHoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string mamh = gvMonHoc.DataKeys[e.RowIndex].Value.ToString();
                mhDAO.Delete(mamh);
                gvMonHoc.DataSource = mhDAO.getAll();
                gvMonHoc.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('Không thể xóa môn học này')</script>");
            }
        }

        protected void gvMonHoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMonHoc.PageIndex = e.NewPageIndex;
            NapDuLieu();
        }
    }
}