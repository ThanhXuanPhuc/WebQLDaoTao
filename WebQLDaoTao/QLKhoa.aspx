<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="alert alert-info">Nội dung trang quản lý Khoa</div>


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

    <asp:GridView ID="gvKhoa" runat="server" AutoGenerateColumns="False" DataSourceID="ods_Khoa"
        CssClass="table table-bordered table-hover">
        <Columns>

            <asp:BoundField DataField="MaKH" HeaderText="MaKH" SortExpression="MaKH" ReadOnly="true"/>
            <asp:BoundField DataField="TenKH" HeaderText="TenKH" SortExpression="TenKH" />

            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />

        </Columns>
    </asp:GridView>

<asp:ObjectDataSource ID="ods_Khoa" runat="server"
    DataObjectTypeName="WebQLDaoTao.Models.Khoa"
    DeleteMethod="Delete" 
    InsertMethod="Insert"
    SelectMethod="getAll"
    TypeName="WebQLDaoTao.Models.KhoaDAO"
    UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="makh" Type="String" />
    </DeleteParameters>
</asp:ObjectDataSource>
</asp:Content>
