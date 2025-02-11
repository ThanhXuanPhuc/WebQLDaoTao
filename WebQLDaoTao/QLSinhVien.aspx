<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h3>Nội dung trang quản lí sinh viên</h3>
    <hr />
    <asp:GridView ID="gvSinhVien" runat="server" AutoGenerateColumns="false" DataSourceID="ods_SinhVien" DataKeyNames="Masv"
        CssClass="table table-bordered table-hover" AllowPaging="True" OnSelectedIndexChanged="gvSinhVien_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="Mã sinh viên" SortExpression="MaSV"/>
            <asp:BoundField DataField="HoSV" HeaderText="Họ sinh viên" SortExpression="HoSV"/>
            <asp:BoundField DataField="TenSV" HeaderText="Tên sinh viên" SortExpression="TenSV"/>
            <asp:CheckBoxField DataField="GioiTinh" HeaderText="Giới tính"/>
            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" DataFormatString="{0: dd/MM/yyyy}" SortExpression="NgaySinh"/>
            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" SortExpression="NoiSinh"/>
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi"/>
            <asp:BoundField DataField="MaKH" HeaderText="Mã khoa" SortExpression="MaKH"/>

            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Wrap="false">
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:CommandField>
        </Columns>
    </asp:GridView>

    <asp:ObjectDataSource ID="ods_SinhVien" runat="server"
        DataObjectTypeName="WebQLDaoTao.Models.SinhVien"
        DeleteMethod="Update"
        InsertMethod="Insert"
        SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.SinhVienDAO"
        UpdateMethod="Update">

    </asp:ObjectDataSource>
</asp:Content>
