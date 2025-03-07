<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NhapDiem.aspx.cs" Inherits="WebQLDaoTao.NhapDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>NHẬP ĐIỂM THI</h2>
    <hr />

    <asp:ObjectDataSource ID="odsKetQua" runat="server"
        SelectMethod="getByMaMH" TypeName="WebQLDaoTao.Models.KetQuaDAO">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMonHoc" Name="mamh" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsMonHoc" runat="server" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.MonHocDAO"></asp:ObjectDataSource>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="padding: 10px">
        Chọn môn học
        <asp:DropDownList ID="ddlMonHoc" runat="server" DataSourceID="odsMonHoc"
            DataTextField="TenMH" DataValueField="MaMH" AutoPostBack="true">
        </asp:DropDownList>
    </div>

    <asp:GridView ID="gvKetQua" ShowFooter="true" DataKeyNames="id" runat="server" DataSourceID="odsKetQua"
        AutoGenerateColumns="false" CssClass="table table-bordered" Width="70%">
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="MaSV" />
            <asp:BoundField DataField="HoTenSV" HeaderText="Họ tên sinh viên" />
            <asp:TemplateField HeaderText="Điểm thi">
                <ItemTemplate>
                    <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("Diem") %>' CssClass="form-control" AutoPostBack="true"></asp:TextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="btLuu" runat="server" Text="Lưu điểm" CssClass="btn btn-success" OnClick="btLuu_Click">
                        <i class="bi bi-floppy-fill"></i>
                    </asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Chọn xoá" ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    <asp:CheckBox ID="chkAll" runat="server" Text="Chọn tất cả" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="cbxChon" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="btXoa" OnClientClick="return confirm('Bạn có muốn xóa điểm này không?')" runat="server" Text="Xoá" CssClass="btn btn-success" OnClick="btXoa_Click">
                        <i class="bi bi-trash"></i>
                    </asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div class="alert alert-warning">
                Không có sinh viên 
            </div>
        </EmptyDataTemplate>
        <HeaderStyle BackColor="#0066cc" ForeColor="#ffffff" />
    </asp:GridView>

        </ContentTemplate>

    </asp:UpdatePanel>
    
    
</asp:Content>
