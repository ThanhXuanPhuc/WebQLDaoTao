using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebQLDaoTao.Models
{
    public class MonHocDAO
    {
        public List<MonHoc> getAll()
        {
            List<MonHoc> ds = new List<MonHoc>();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from monhoc", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                MonHoc mh = new MonHoc
                {
                    MaMH = dr["mamh"].ToString(),
                    TenMH = dr["tenmh"].ToString(),
                    SoTiet = int.Parse(dr["sotiet"].ToString())
                };
                ds.Add(mh);
            }
            return ds;
        }

        public int Update(MonHoc mh)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("update monhoc set tenmh=@tenmh, sotiet=@sotiet where mamh=@mamh", conn);
            cmd.Parameters.AddWithValue("@tenmh", mh.TenMH);
            cmd.Parameters.AddWithValue("@sotiet", mh.SoTiet);
            cmd.Parameters.AddWithValue("@mamh", mh.MaMH);
            return cmd.ExecuteNonQuery();
        }
        public int Insert(string mamh, string tenmh, int sotiet)
        {
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into monhoc (mamh, tenmh,sotiet) values (@mamh,@tenmh,@sotiet)", conn);
            cmd.Parameters.AddWithValue("@mamh", mamh);
            cmd.Parameters.AddWithValue("@tenmh", tenmh);
            cmd.Parameters.AddWithValue("@sotiet", sotiet);
            return cmd.ExecuteNonQuery();
        }
        public int Delete(string mamh)
        {
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete from monhoc where mamh=@mamh", conn);
            cmd.Parameters.AddWithValue("@mamh", mamh);
            return cmd.ExecuteNonQuery();
        }
        public MonHoc findById(string mamh)
        {
            MonHoc kq = null;
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Monhoc where mamh=@mamh", conn);
            cmd.Parameters.AddWithValue("@mamh", mamh);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                kq = new MonHoc
                {
                    MaMH = dr["MaMH"].ToString(),
                    TenMH = dr["TenMH"].ToString(),
                    SoTiet = int.Parse(dr["SoTiet"].ToString())
                };
            }
            return kq;
        }
    }
}