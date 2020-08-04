﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="giohang.aspx.cs" Inherits="giohang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form id="form1" runat="server">
            <div class="container">
                 <div class="sitemap">
                    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
                     <asp:SiteMapPath ID="SiteMapPath1" runat="server" PathDirection="CurrentToRoot">
                     </asp:SiteMapPath>
                </div>
                <div class="list-content">
                    <div class="left" style="height: auto; width: 60%; text-align: left; float:left; background-color: #FFFFFF;">     
                    </div>
             
                    <div class="center-content" style="float:right; height: auto; width:40%; background-color: #FFFFFF;margin-bottom: 50px;">
                        <asp:DataList ID="dataCart" runat="server" Width="100%" RepeatColumns="1" RepeatDirection="Horizontal" RepeatLayout="Table" >
                            <ItemTemplate>
                                <table style="width:100%;padding: 15px 5px;">
                                    <tr>
                                        <td colspan="3" style="padding-bottom: 10px;">
                                            <asp:HyperLink ID="hpTenSanPham" runat="server" ForeColor="#020315" NavigateUrl='<%# "chitietsanpham.aspx?id="+Eval("MASANPHAM") %>' Text='<%# Eval("STT")+"."+Eval("TENSANPHAM") %>' Font-Bold="True" Font-Size="18px"></asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2" style="width: 150px;padding: 0 10px">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("HINHMINHHOA") %>' Width="100%" />
                                        </td>
                                        <td style="vertical-align: bottom; padding-left: 10px">
                                            <span>Giá Tiền</span>
                                        </td>
                                        <td style="vertical-align: bottom;text-align: right; padding-right: 10px">
                                            <span>
                                                <asp:Label ID="lbGiaTien" runat="server" Text='<%# Eval("SOLUONG") +" x "+string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"),"{0:C0}", Eval("GIABAN")) %>' ></asp:Label>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: center; padding-left: 10px">
                                            <span>Số lượng</span>
                                        </td>
                                        <td style="vertical-align: center; padding-right: 10px">
                                            <div class='c_ctrl'>
                                                <div class='c_ctrl__button c_ctrl__button--decrement'>&ndash;</div>
                                                <div class='c_ctrl__counter'>
                                                    <asp:TextBox ID="txtSoLuong" runat="server" CssClass="c_ctrl__counter-input" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" Text='<%# Eval("SOLUONG") %>'></asp:TextBox>
                                                    <div class='c_ctrl__counter-num'>1</div>
                                                </div>
                                                <div class='c_ctrl__button c_ctrl__button--increment'>+</div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>

                        </asp:DataList>
                        <div style="width:100%;display:flex;justify-content:space-between">
                            <div>
                                <span style="font-size: 16px; font-weight: 400; color: #20315c">Thành tiền</span>
                            </div>
                            <div>
                                <asp:Label ID="lbTongTien" runat="server" Font-Bold="True" Font-Size="16px" ForeColor="#FF2C2C"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     <script src="styles/js/inputnumber_c.js"></script>           
    </form>
</asp:Content>

