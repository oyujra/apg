<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Permiso.aspx.cs" Inherits="CRUDUsingEntityFramework.Tipo" %>

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

<asp:GridView ID="gvPermiso" runat="server"   
                                AutoGenerateColumns="False" ShowFooter="True"   
                                PageSize="10" AllowPaging="true"  
                                OnRowCommand="gvPermiso_RowCommand"  
                                DataKeyNames="Id" CellPadding="4" ForeColor="#333333"  
                                GridLines="None" OnRowCancelingEdit="gvPermiso_RowCancelingEdit"  
                                OnRowEditing="gvPermiso_RowEditing"  
                                OnRowUpdating="gvPermiso_RowUpdating"  
                                OnRowDeleting="gvPermiso_RowDeleting"  
                                OnPageIndexChanging="gvPermiso_OnPageIndexChanging" 
                                onrowdatabound="gvPermiso_RowDataBound">  
                                <AlternatingRowStyle BackColor="White" />  
                                <Columns>  
                                    <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Left">  
                                        <EditItemTemplate>  
                                            <asp:TextBox ID="txtId" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valId" runat="server" ControlToValidate="txtId"  
                                                Display="Dynamic" ErrorMessage="Employee Name is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                        </EditItemTemplate>  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblEmpName" runat="server" Text='<%# Bind("Id") %>'></asp:Label>  
                                        </ItemTemplate>  
                                        <FooterTemplate>  
                                            <asp:TextBox ID="txtIdNew" runat="server"></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valIdNew" runat="server" ControlToValidate="txtIdNew"  
                                                Display="Dynamic" ErrorMessage="Employee Name is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                        </FooterTemplate>  
                                    </asp:TemplateField>  

                                    <asp:TemplateField HeaderText="NombreEmpleado" HeaderStyle-HorizontalAlign="Left">  
                                        <EditItemTemplate>  
                                            <asp:TextBox ID="txtNombreEmpleado" runat="server" Text='<%# Bind("NombreEmpleado") %>'></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valNombreEmpleado" runat="server" ControlToValidate="txtNombreEmpleado"  
                                                Display="Dynamic" ErrorMessage="NombreEmpleado is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                        </EditItemTemplate>  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblNombreEmpleado" runat="server" Text='<%# Bind("NombreEmpleado") %>'></asp:Label>  
                                        </ItemTemplate>  
                                        <FooterTemplate>  
                                            <asp:TextBox ID="txtNombreEmpleadoNew" runat="server"></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valDesignationNew" runat="server" ControlToValidate="txtNombreEmpleadoNew"  
                                                Display="Dynamic" ErrorMessage="Designation is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                        </FooterTemplate>  
                                    </asp:TemplateField>  

                                    <asp:TemplateField HeaderText="ApellidosEmpleado" HeaderStyle-HorizontalAlign="Left">  
                                        <EditItemTemplate>  
                                            <asp:TextBox ID="txtApellidosEmpleado" runat="server" Text='<%# Bind("ApellidosEmpleado") %>'></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valApellidosEmpleado" runat="server" ControlToValidate="txtApellidosEmpleado"  
                                                Display="Dynamic" ErrorMessage="ApellidosEmpleado is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                        </EditItemTemplate>  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblApellidosEmpleado" runat="server" Text='<%# Bind("ApellidosEmpleado") %>'></asp:Label>  
                                        </ItemTemplate>  
                                        <FooterTemplate>  
                                            <asp:TextBox ID="txtApellidosEmpleadoNew" runat="server"></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valApellidosEmpleadoNew" runat="server" ControlToValidate="txtApellidosEmpleadoNew"  
                                                Display="Dynamic" ErrorMessage="ApellidosEmpleado is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                        </FooterTemplate>  
                                    </asp:TemplateField>  


                                    <asp:TemplateField HeaderText="TipoPermisoId" HeaderStyle-HorizontalAlign="Left">  
                                        <EditItemTemplate>  
                                            <asp:DropDownList ID="ddlTipoPermisoId" runat="server"> </asp:DropDownList>
                                            <asp:TextBox ID="txtTipoPermisoId" runat="server" Visible="false" Text='<%# Bind("TipoPermisoId") %>'></asp:TextBox>  

                                            <asp:RequiredFieldValidator ID="valTipoPermisoId" runat="server" ControlToValidate="txtTipoPermisoId"  
                                                Display="Dynamic" ErrorMessage="Designation is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                        </EditItemTemplate>  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblTipoPermisoId" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>  
                                        </ItemTemplate>  
                                        <FooterTemplate> 
                                            <asp:DropDownList ID="ddlTipoPermisoIdNew" runat="server"> </asp:DropDownList>
                                        </FooterTemplate>  
                                    </asp:TemplateField>  
                                   
      
                                    <asp:TemplateField HeaderText="FechaHoraInicioPermiso" HeaderStyle-HorizontalAlign="Left">  
                                        <EditItemTemplate>  
                                            <asp:TextBox ID="txtFechaHoraInicioPermiso" runat="server" Text='<%# Bind("FechaHoraInicioPermiso") %>'></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valFechaHoraInicioPermiso" runat="server" ControlToValidate="txtFechaHoraInicioPermiso"  
                                                Display="Dynamic" ErrorMessage="FechaHorarioInicioPermiso is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                        </EditItemTemplate>  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblFechaHoraInicioPermiso" runat="server" Text='<%# Bind("FechaHoraInicioPermiso") %>'></asp:Label>  
                                        </ItemTemplate>  
                                        <FooterTemplate>  
                                            <asp:TextBox ID="txtFechaHoraInicioPermisoNew" runat="server"></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valFechaHoraInicioPermisoNew" runat="server" ControlToValidate="txtFechaHoraInicioPermisoNew"  
                                                Display="Dynamic" ErrorMessage="FechaHoraInicioPermiso is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                        </FooterTemplate>  
                                    </asp:TemplateField>  

                                    <asp:TemplateField HeaderText="FechaHoraFinPermiso" HeaderStyle-HorizontalAlign="Left">  
                                        <EditItemTemplate>  
                                            <asp:TextBox ID="txtFechaHoraFinPermiso" runat="server" Text='<%# Bind("FechaHoraFinPermiso") %>'></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valFechaHoraFinPermiso" runat="server" ControlToValidate="txtFechaHoraFinPermiso"  
                                                Display="Dynamic" ErrorMessage="FechaHoraFinPermiso is required." ForeColor="Red" SetFocusOnError="True"  
                                                ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                        </EditItemTemplate>  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblFechaHoraFinPermiso" runat="server" Text='<%# Bind("FechaHoraFinPermiso") %>'></asp:Label>  
                                        </ItemTemplate>  
                                        <FooterTemplate>  
                                            <asp:TextBox ID="txtFechaHoraFinPermisoNew" runat="server"></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="valFechaHoraFinPermisoNew" runat="server" ControlToValidate="txtFechaHoraFinPermisoNew"  
                                                Display="Dynamic" ErrorMessage="FechaHorarioFinPermiso is required." ForeColor="Red" SetFocusOnError="True"  
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
                                                OnClientClick='return confirm("Employee Record addedd Successfully.");'>  
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
