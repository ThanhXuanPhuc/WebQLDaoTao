<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebQLDaoTao.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
             max-width: 400px;
        }
        .btn-primary {
            background: #05999E; 
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: 0.3s ease-in-out;
        }

            .btn-primary:hover {
                background: #FFE998; 
            }

        .btn-link {
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

            .btn-link:hover {
                color: #0056b3;
                text-decoration: underline;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Đăng Nhập</h2>
            <div class="form-group">
                <label>Tên đăng nhập:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Mật khẩu:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            <div class="form-group text-center">
                <asp:Button ID="btLogin" runat="server" Text="Đăng nhập" CssClass="btn btn-primary" OnClick="btLogin_Click"/>
            </div>
            <div class="text-center">
                <span>Bạn chưa có tài khoản?</span>
                <a href="Register.aspx" class="btn btn-link">Đăng ký ngay</a>
            </div>
        </div>
    </form>
</body>
</html>
