<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h3>Nội dung trang quản lí sinh viên</h3>
    <hr />
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">
        <asp:GridView ID="gvSinhVien" runat="server" AutoGenerateColumns="false" DataSourceID="ods_SinhVien" DataKeyNames="Masv"
            CssClass="table table-bordered table-hover" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="MaSV" HeaderText="Mã sinh viên" SortExpression="MaSV" />
                <asp:BoundField DataField="HoSV" HeaderText="Họ sinh viên" SortExpression="HoSV" />
                <asp:BoundField DataField="TenSV" HeaderText="Tên sinh viên" SortExpression="TenSV" />
                <asp:CheckBoxField DataField="GioiTinh" HeaderText="Giới tính" />
                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" DataFormatString="{0: dd/MM/yyyy}" SortExpression="NgaySinh" />
                <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" SortExpression="NoiSinh" />
                <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
                <asp:BoundField DataField="MaKH" HeaderText="Mã khoa" SortExpression="MaKH" />

                <asp:TemplateField HeaderText="Chọn tác vụ">
                    <ItemTemplate>
                        <asp:LinkButton ID="btSua" runat="server" Text="Sửa" CommandName="Edit">
                            <i class="bi bi-pencil"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btXoa" OnClientClick="return confirm('Bạn có muốn xóa môn học này không?')" runat="server" Text="Xóa" CommandName="Delete">
                            <i class="bi bi-trash"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btUpdate" CssClass="btn btn-success" runat="server" Text="Ghi" CommandName="Update" />
                        <asp:Button ID="btCancel" CssClass="btn btn-warning" runat="server" Text="Bỏ qua" CommandName="Cancel" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>


    <asp:ObjectDataSource ID="ods_SinhVien" runat="server"
        DataObjectTypeName="WebQLDaoTao.Models.SinhVien"
        DeleteMethod="Delete"
        InsertMethod="Insert"
        SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.SinhVienDAO"
        UpdateMethod="Update"></asp:ObjectDataSource>
    <DeleteParameters>
        <asp:Parameter Name="MaSV" Type="String" />
    </DeleteParameters>
</asp:Content>
