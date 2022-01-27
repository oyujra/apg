<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TipoPermiso.aspx.cs" Inherits="CRUDUsingEntityFramework.Default" %>

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
                                DataKeyNames="Id" CellPadding="4" ForeColor="#333333"  
                                GridLines="None" OnRowCancelingEdit="gvTipoPermiso_RowCancelingEdit"  
                                OnRowEditing="gvTipoPermiso_RowEditing"  
                                OnRowUpdating="gvTipoPermiso_RowUpdating"  
                                OnRowDeleting="gvTipoPermiso_RowDeleting"  
                                OnPageIndexChanging="gvTipoPermiso_OnPageIndexChanging">  
                                <AlternatingRowStyle BackColor="White" />  
                                <Columns>  
                                    <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Left">  
                                        <EditItemTemplate>  
                                            <asp:TextBox ID="txtId" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valId" runat="server" ControlToValidate="txtId"  
                                                Display="Dynamic" ErrorMessage="Id Name is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                        </EditItemTemplate>  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>  
                                        </ItemTemplate>  
                                        <FooterTemplate>  
                                            <asp:TextBox ID="txtIdNew" runat="server"></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valIdNew" runat="server" ControlToValidate="txtIdNew"  
                                                Display="Dynamic" ErrorMessage="Id Name is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                        </FooterTemplate>  
                                    </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Descripcion" HeaderStyle-HorizontalAlign="Left">  
                                        <EditItemTemplate>  
                                            <asp:TextBox ID="txtDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valDescripcion" runat="server" ControlToValidate="txtDescripcion"  
                                                Display="Dynamic" ErrorMessage="Descripcion is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                        </EditItemTemplate>  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>  
                                        </ItemTemplate>  
                                        <FooterTemplate>  
                                            <asp:TextBox ID="txtDescripcionNew" runat="server"></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valDescripcionNew" runat="server" ControlToValidate="txtDescripcionNew"  
                                                Display="Dynamic" ErrorMessage="Descripcion is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                        </FooterTemplate>  
                                    </asp:TemplateField>  
                                   
                                          <asp:TemplateField HeaderText="">  
                                        <ItemTemplate>  
                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="" CommandName="Edit" ToolTip="Edit">  
                                                <img src="../Images/icons8-añadir-a-la-cesta-de-compra-48.png" width="30px" />  
                                            </asp:LinkButton>  
                                            <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"  
                                                ToolTip="Delete" OnClientClick='return confirm("Are you sure you want to delete employee record?");'>  
                                                <img src="../Images/icons8-eliminar-marcador-48.png"  width="30px" />  
                                            </asp:LinkButton>  
                                        </ItemTemplate>  
      
                                        <EditItemTemplate>  
                                            <asp:LinkButton ID="lnkInsert" runat="server" Text="" ValidationGroup="vldEditRecord"   
                                                CommandName="Update" ToolTip="Save"  
                                                OnClientClick='return confirm("Employee Record Saved Successfully.");'>  
                                                     <img src="../Images/icons8-añadir-48.png"  width="30px" />  
                                            </asp:LinkButton>  
                                            <asp:LinkButton ID="lnkCancel" runat="server" Text="" CommandName="Cancel" ToolTip="Cancel">  
                                                <img src="../Images/icons8-añadir-a-la-cesta-de-compra-48.png"  width="30px" />  
                                            </asp:LinkButton>  
                                        </EditItemTemplate>  
      
                                        <FooterTemplate>  
                                            <asp:LinkButton ID="lnkInsert" runat="server" Text="" ValidationGroup="vldNewRecord"   
                                                CommandName="InsertNew" ToolTip="Add New Employee"  
                                                OnClientClick='return confirm("TipoPermiso Record addedd Successfully.");'>  
                                                     <img src="../Images/icons8-save-64.png"  width="30px" />  
                                            </asp:LinkButton>  
                                            <asp:LinkButton ID="lnkCancel" runat="server" Text="" CommandName="CancelNew" ToolTip="Cancel">  
                                                <img src="../Images/icons8-eliminar-marcador-48.png"  width="30px" />  
                                            </asp:LinkButton>  
                                        </FooterTemplate>  
      
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
