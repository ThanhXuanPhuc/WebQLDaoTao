using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class SinhVienDAO
    {
        public List<SinhVien> getAll()
        {
            List<SinhVien> dsSinhVien = new List<SinhVien>();
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from SinhVien", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                SinhVien sv = new SinhVien
                {
                    MaSV = dr["MaSV"].ToString(),
                    HoSV = dr["Hosv"].ToString(),
                    TenSV = dr["Tensv"].ToString(),
                    GioiTinh = Boolean.Parse(dr["gioitinh"].ToString()),
                    NgaySinh = DateTime.Parse(dr["ngaysinh"].ToString()),
                    NoiSinh = dr["noisinh"].ToString(),
                    DiaChi = dr["diachi"].ToString(),
                    MaKH = dr["Makh"].ToString()
                };

                dsSinhVien.Add(sv);
            }
            return dsSinhVien;
        }
    }
}