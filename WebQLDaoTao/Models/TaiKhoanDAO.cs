using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class TaiKhoanDAO
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString;

        public TaiKhoan DangNhap(string tenDN, string matKhau)
        {
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            string query = "SELECT * FROM TaiKhoan WHERE TenDangNhap = @TenDangNhap AND MatKhau = @MatKhau";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TenDangNhap", tenDN);
                cmd.Parameters.AddWithValue("@MatKhau", matKhau);

                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();

                if (rd.Read()) 
                {
                    TaiKhoan tk = new TaiKhoan
                    {
                        TenDN = rd["TenDangNhap"].ToString(),
                        MatKhau = rd["MatKhau"].ToString(),
                        VaiTro = rd["VaiTro"].ToString()
                    };
                    return tk;
                }
                return null;
            
        }

        public bool KiemTraTonTai(string tenDangNhap)
        {
                SqlConnection conn = new
                SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM TaiKhoan WHERE TenDangNhap = @TenDangNhap", conn);
                cmd.Parameters.AddWithValue("@TenDangNhap", tenDangNhap);
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            
        }
        public int Insert(TaiKhoan tk)
        {
            try
            {
                SqlConnection conn = new
                SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
                conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO TaiKhoan (TenDangNhap, MatKhau, VaiTro) VALUES (@TenDangNhap, @MatKhau, @VaiTro)", conn);
                    cmd.Parameters.AddWithValue("@TenDangNhap", tk.TenDN);
                    cmd.Parameters.AddWithValue("@MatKhau", tk.MatKhau);
                    cmd.Parameters.AddWithValue("@VaiTro", tk.VaiTro);

                    return cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi khi thêm tài khoản: " + ex.Message);
                return 0;
            }
        }


    }
}