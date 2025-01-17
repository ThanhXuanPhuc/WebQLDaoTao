<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLMonHoc.aspx.cs" Inherits="WebQLDaoTao.QLMonHoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h3>Thiết kế nội dung trang quản lý môn học</h3>
    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm mới môn học</button>

    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm mới môn học</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Mã môn</label>
                        <asp:TextBox ID="txtMaMH" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Tên môn</label>
                        <asp:TextBox ID="txtTenMH" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Số tiết</label>
                        <asp:TextBox ID="txtSoTiet" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btThem" runat="server" Text="Thêm" OnClick="btThem_Click" CssClass="btn btn-success"></asp:Button>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <div>
        <asp:GridView ID="gvMonHoc" runat="server" DataKeyNames="MaMH" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" OnRowEditing="gvMonHoc_RowEditing" OnRowCancelingEdit="gvMonHoc_RowCancelingEdit" OnRowUpdating="gvMonHoc_RowUpdating" AllowPaging="True"  OnPageIndexChanging="gvMonHoc_PageIndexChanging" OnRowDeleting="gvMonHoc_RowDeleting" PageSize="5" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField HeaderText="Mã môn học" DataField="MaMH" ReadOnly="true" />
                <asp:BoundField HeaderText="Tên môn học" DataField="TenMH" />
                <asp:BoundField HeaderText="Số tiết" DataField="SoTiet" />
                <asp:CommandField HeaderText="Chọn tác vụ" ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button" EditText="Sửa" DeleteText="Xoá" />
            </Columns>
            <HeaderStyle BackColor="#0066cc" ForeColor="#ffffff" />
        </asp:GridView>
    </div>
</asp:Content>
