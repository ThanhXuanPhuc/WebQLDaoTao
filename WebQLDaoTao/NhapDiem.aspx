<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NhapDiem.aspx.cs" Inherits="WebQLDaoTao.NhapDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>NHẬP ĐIỂM THI</h2>
    <hr />

    <div style="padding: 10px">
        Chọn môn học
        <asp:DropDownList ID="ddlMonHoc" runat="server" DataSourceID="odsMonHoc"
            DataTextField="TenMH" DataValueField="MaMH" AutoPostBack="true">
        </asp:DropDownList>
    </div>

    <asp:GridView ID="gvKetQua" DataKeyNames="id" runat="server" DataSourceID="odsKetQua" 
        AutoGenerateColumns="false" CssClass="table table-bordered" Width="70%">
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="MaSV" />
            <asp:BoundField DataField="HoTenSV" HeaderText="Họ tên sinh viên" />
            <asp:TemplateField HeaderText="Điểm thi">
                <ItemTemplate>
                    <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("Diem") %>' CssClass="form-control"></asp:TextBox>

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Button ID="btLuu" runat="server" Text="Lưu điểm" CssClass="btn btn-success" OnClick="btLuu_Click"/>

    <asp:ObjectDataSource ID="odsKetQua" runat="server"
        SelectMethod="getByMaMH" TypeName="WebQLDaoTao.Models.KetQuaDAO">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMonHoc" Name="mamh" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsMonHoc" runat="server" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.MonHocDAO"></asp:ObjectDataSource>
</asp:Content>
