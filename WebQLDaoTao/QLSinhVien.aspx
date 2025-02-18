<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h3>Nội dung trang quản lí sinh viên</h3>
    <hr />
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">


       <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm mới sinh viên</button>

    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm mới sinh viên</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Mã sinh viên</label>
                        <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-inline">
                        <label>Họ sinh viên</label>
                        <asp:TextBox ID="txtHoSV" runat="server" CssClass="form-control" Width="100px"></asp:TextBox>
                         <label>Tên sinh viên</label>
                        <asp:TextBox ID="txtTenSv" runat="server" CssClass="form-control" Width="50px"></asp:TextBox>
                    </div>
                    <div class="form-inline">
                        <label>Phái</label>
                        <asp:RadioButton ID="rdNam" runat="server" Text="Nam" GroupName="GT" Checked="true" />
                         <asp:RadioButton ID="rdNu" runat="server" Text="Nữ" GroupName="GT" Checked="true" />
                    </div>
                    <div class="form-group">
                        <label>Ngày sinh</label>
                        <asp:TextBox ID="txtNgaysinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Nơi sinh</label>
                        <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ</label>
                        <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Chọn khoa</label>
                        <asp:DropDownList ID="ddlKhoa" runat="server" CssClass="form-control"
                            DataSourceID="odsKhoa" DataTextField="tenkh" DataValueField="makh">
                            </asp:DropDownList>
                    </div>
                </div>

                <div class="modal-footer">
                    <asp:Button ID="btThem" runat="server" Text="Lưu" OnClick="btXuLy_Click" CssClass="btn btn-success"></asp:Button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

        <asp:GridView ID="gvSinhVien" runat="server" AutoGenerateColumns="false" DataSourceID="ods_SinhVien" DataKeyNames="MaSV"
            CssClass="table table-bordered table-hover" AllowPaging="True" >
            <Columns>
                <asp:BoundField DataField="MaSV" HeaderText="Mã sinh viên" SortExpression="MaSV" ReadOnly="true" />
                <asp:BoundField DataField="HoSV" HeaderText="Họ sinh viên" SortExpression="HoSV" ControlStyle-Width="120px"/>
                <asp:BoundField DataField="TenSV" HeaderText="Tên sinh viên" SortExpression="TenSV" ControlStyle-Width="70px"/>

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
                <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" SortExpression="NoiSinh" ControlStyle-Width="80px"/>
                <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" ControlStyle-Width="100px"/>

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
