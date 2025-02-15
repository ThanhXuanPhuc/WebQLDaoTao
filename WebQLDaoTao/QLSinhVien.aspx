<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h3>Nội dung trang quản lí sinh viên</h3>
    <hr />
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">


        <div class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-md-2">Mã sinh viên</label>
                <div class="col-md-2">
                    <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">Họ sinh viên</label>
                <div class="col-md-2">
                    <asp:TextBox ID="txtHoSv" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <label class="control-label col-md-2">Tên sinh viên</label>
                <div class="col-md-2">
                    <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">Giới tính</label>
                <div class="col-md-4">
                    <asp:RadioButton ID="rdNam" runat="server" Text="Nam" CssClass="radio-inline" Checked="true"
                        GroupName="GT" />
                    <asp:RadioButton ID="rdNu" runat="server" Text="Nữ" CssClass="radio-inline" GroupName="GT" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">Ngày sinh</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtNgaysinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                </div>
                <label class="control-label col-md-2">Nơi sinh</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">Địa chỉ</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">Chọn khoa</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlMaKhoa" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2"></label>
                <div class="col-md-4">
                    <asp:Button ID="btThem" runat="server" Text="Thêm Mới" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
        <div>
        </div>

        <asp:GridView ID="gvSinhVien" runat="server" AutoGenerateColumns="false" DataSourceID="ods_SinhVien" DataKeyNames="MaSV"
            CssClass="table table-bordered table-hover" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="MaSV" HeaderText="Mã sinh viên" SortExpression="MaSV" ReadOnly="true" />
                <asp:BoundField DataField="HoSV" HeaderText="Họ sinh viên" SortExpression="HoSV" />
                <asp:BoundField DataField="TenSV" HeaderText="Tên sinh viên" SortExpression="TenSV" />

                <asp:TemplateField HeaderText="Phái">
                    <EditItemTemplate>
                        <asp:DropDownList ID="gioitinh" runat="server" SelectedValue='<%# Bind("gioitinh") %>'>
                            <asp:ListItem Text="Nam" Value="True"></asp:ListItem>
                            <asp:ListItem Text="Nữ" Value="False"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# (bool)Eval("gioitinh")?"Nam":"Nữ" %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" DataFormatString="{0: dd/MM/yyyy}" SortExpression="NgaySinh" />
                <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" SortExpression="NoiSinh" />
                <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />

                <asp:TemplateField HeaderText="Khoa">
                    <EditItemTemplate>
                        <asp:DropDownList ID="makh" runat="server" DataSourceID="odsKhoa" DataTextField="TenKH"
                            DataValueField="MaKH"
                            SelectedValue='<%# Bind("MaKH") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# Eval("Makh") %>
                    </ItemTemplate>

                </asp:TemplateField>

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
    </asp:Panel>


    <asp:ObjectDataSource ID="ods_SinhVien" runat="server"
        DataObjectTypeName="WebQLDaoTao.Models.SinhVien"
        DeleteMethod="Delete"
        InsertMethod="Insert"
        SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.SinhVienDAO"
        UpdateMethod="Update"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsKhoa" runat="server"
        SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.KhoaDAO"></asp:ObjectDataSource>

</asp:Content>
