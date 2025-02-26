<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebQLDaoTao.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container">
            <div class="form-group">
                <label>Tên đăng nhập:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Mật khẩu:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>

            </div>
             <div class="form-group">
                <label>Nhập lại mật khẩu:</label>
                <asp:TextBox ID="txtRePassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Nhập lại mật khẩu"></asp:TextBox>
            </div>
              <div class="form-group">
                <label>Vai Trò:</label>
                <asp:TextBox ID="txtRole" runat="server" CssClass="form-control" ></asp:TextBox>
            </div>
            <asp:Label ID="lblMessage" runat="server" ></asp:Label>
            <asp:Button ID="btRegister" runat="server" Text="Đăng ký" OnClick="btRegister_Click"/>
        </div>
    </form>
</body>
</html>
