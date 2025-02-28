<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="alert alert-info">Nội dung trang quản lý Khoa</div>
    <hr />

    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm mới môn học</button>
    <%--Thêm mới--%>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm mới khoa</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Mã khoa</label>
                        <asp:TextBox ID="txtMaKH" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Tên khoa</label>
                        <asp:TextBox ID="txtTenKH" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btThem" runat="server" Text="Thêm" OnClick="btXuLy_Click" CssClass="btn btn-success"></asp:Button>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

    <asp:GridView ID="gvKhoa" runat="server" AutoGenerateColumns="False" DataSourceID="ods_Khoa" DataKeyNames="MaKH"
        CssClass="table table-bordered table-hover">
        <Columns>

            <asp:BoundField DataField="MaKH" HeaderText="MaKH" SortExpression="MaKH" ReadOnly="true"/>
            <asp:BoundField DataField="TenKH" HeaderText="TenKH" SortExpression="TenKH" />

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
                        <asp:LinkButton ID="btUpdate" runat="server" Text="Ghi" CommandName="Update">
                            <i class="bi bi-floppy-fill"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btCancel" runat="server" Text="Bỏ qua" CommandName="Cancel">
                            <i class="bi bi-x-circle-fill"></i>
                        </asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>

        </Columns>
    </asp:GridView>

<asp:ObjectDataSource ID="ods_Khoa" runat="server"
    TypeName="WebQLDaoTao.Models.KhoaDAO"
    DataObjectTypeName="WebQLDaoTao.Models.Khoa"
    SelectMethod="getAll"   
    InsertMethod="Insert"
    UpdateMethod="Update"
    DeleteMethod="Delete">
    <DeleteParameters>
        <asp:Parameter Name="MaKH" Type="String" />
    </DeleteParameters>
</asp:ObjectDataSource>


</asp:Content>
