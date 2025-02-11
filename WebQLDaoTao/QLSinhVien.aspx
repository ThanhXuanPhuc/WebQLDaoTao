<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h3>Nội dung trang quản lí sinh viên</h3>
    <hr />
    <asp:GridView ID="gvSinhVien" runat="server" AutoGenerateColumns="False" DataSourceID="ods_SinhVien"
        CssClass="table table-bordered table-hover" AllowPaging="True">

    </asp:GridView>
</asp:Content>
