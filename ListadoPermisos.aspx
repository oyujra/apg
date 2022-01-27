<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoPermisos.aspx.cs" Inherits="CRUDUsingEntityFramework.ListadoPermisos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
            <ul role="navigation">
            <li>
              <a href="Permiso.aspx" >Permiso</a></li>
            <li>
              <a href="TipoPermiso.aspx">Tipo Permiso</a>
            </li>
            <li>
              <a href="ListadoPermisos.aspx">Listado de Permisos</a>
            </li>
          </ul>
    <form id="form1" runat="server">
        <div>
<asp:GridView ID="gvTipoPermiso" runat="server"   
                                AutoGenerateColumns="False" ShowFooter="True"   
                                PageSize="10" AllowPaging="true"  
                                OnRowCommand="gvTipoPermiso_RowCommand"  
                                DataKeyNames="NombreEmpleado" CellPadding="4" ForeColor="#333333"  
                                GridLines="None" OnRowCancelingEdit="gvTipoPermiso_RowCancelingEdit"  
                                OnRowEditing="gvTipoPermiso_RowEditing"  
                                OnRowUpdating="gvTipoPermiso_RowUpdating"  
                                OnRowDeleting="gvTipoPermiso_RowDeleting"  
                                OnPageIndexChanging="gvTipoPermiso_OnPageIndexChanging">  
                                <AlternatingRowStyle BackColor="White" />  
                                <Columns>  
                                    <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Left">  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblId" runat="server" Text='<%# Bind("NombreEmpleado") %>'></asp:Label>  
                                        </ItemTemplate>  
                                    </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Descripcion" HeaderStyle-HorizontalAlign="Left">  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("ApellidosEmpleado") %>'></asp:Label>  
                                        </ItemTemplate>  
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Cantidad Permisos" HeaderStyle-HorizontalAlign="Left">  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("cantidad") %>'></asp:Label>  
                                        </ItemTemplate>  
                                    </asp:TemplateField> 
                                   
                                          <asp:TemplateField HeaderText="">  
                                        <ItemTemplate>  
                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="" CommandName="Edit" ToolTip="Edit">  
                                                <img src="../Images/icons8-añadir-a-la-cesta-de-compra-48.png" width="30px" />  
                                            </asp:LinkButton> 
                                        </ItemTemplate>  
      
                                        
      
                                        
      
                                    </asp:TemplateField>  
                                </Columns>  
                                <EditRowStyle BackColor="#2461BF" />  
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
                                <RowStyle BackColor="#EFF3FB" />  
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />  
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />  
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />  
                            </asp:GridView> 
        </div>
    </form>
</body>
</html>
