﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLMonHoc : System.Web.UI.Page
    {
        MonHocDAO mhDAO = new MonHocDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                KhoiTaoDuLieu();
            }
        }

        private void KhoiTaoDuLieu()
        {
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }

        protected void gvMonhoc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //b1. lấy thông tin môn học
            string mamh = gvMonhoc.DataKeys[e.RowIndex].Value.ToString();
            string tenmh = ((TextBox)gvMonhoc.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            int sotiet = int.Parse(((TextBox)gvMonhoc.Rows[e.RowIndex].Cells[2].Controls[0]).Text);
            //b2. cap nhat vao CSDL
            mhDAO.Update(mamh, tenmh, sotiet);
            //b3. chuyen doi trang thai cua dong hien hanh : từ chế độ sửa(edit) sang chế độ xem
            gvMonhoc.EditIndex = -1;
            //b4. lien ket lai du lieu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }

        protected void gvMonhoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //chuyen doi trang thai cua dong hien hanh : từ chế độ xem sang chế độ sửa
            gvMonhoc.EditIndex = e.NewEditIndex;
            //lien ket lai du lieu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }
    }
}