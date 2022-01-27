using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.SqlServer;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDUsingEntityFramework
{
    public partial class Tipo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

        }

        void BindGrid()
        {
            using (apgEntities context = new apgEntities())
            {
                if (context.Permiso.Count() > 0)
                {
                    gvPermiso.DataSource = (from em in context.Permiso
                                            join s in context.TipoPermiso on em.TipoPermisoId equals s.Id
                                            select new { em.Id, em.NombreEmpleado, em.ApellidosEmpleado,s.Descripcion, em.TipoPermisoId, em.FechaHoraInicioPermiso, em.FechaHoraFinPermiso
                                             }).ToList();
                    gvPermiso.DataBind();
                    GridViewRow row = gvPermiso.FooterRow;

                    DropDownList ddlTipoPermisoIdNew = row.FindControl("ddlTipoPermisoIdNew") as DropDownList;
                    var country = from c in context.TipoPermiso select new { c.Id, c.Descripcion };
                    ddlTipoPermisoIdNew.DataSource = country.ToList();
                    ddlTipoPermisoIdNew.DataValueField = "Id";
                    ddlTipoPermisoIdNew.DataTextField = "Descripcion";
                    ddlTipoPermisoIdNew.DataBind();
                }
                else
                {
                    gvPermiso.DataSource = null;
                    gvPermiso.DataBind();
                }
            }
        }




        protected void gvPermiso_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPermiso.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvPermiso_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertNew")
            {
                GridViewRow row = gvPermiso.FooterRow;

                TextBox txtId = row.FindControl("txtIdNew") as TextBox;
                TextBox txtNombreEmpleado = row.FindControl("txtNombreEmpleadoNew") as TextBox;
                TextBox txtApellidosEmpleado = row.FindControl("txtApellidosEmpleadoNew") as TextBox;
                DropDownList txtTipoPermisoId = row.FindControl("ddlTipoPermisoIdNew") as DropDownList;
                TextBox txtFechaHoraInicioPermiso = row.FindControl("txtFechaHoraInicioPermisoNew") as TextBox;
                TextBox txtFechaHoraFinPermiso = row.FindControl("txtFechaHoraFinPermisoNew") as TextBox;
                var x = this.validaDias();
                if (x < 30) {
                    using (apgEntities context = new apgEntities())
                    {
                        Permiso obj = new Permiso();
                        obj.Id = int.Parse(txtId.Text);
                        obj.NombreEmpleado = txtNombreEmpleado.Text;
                        obj.ApellidosEmpleado = txtApellidosEmpleado.Text;
                        obj.TipoPermisoId = int.Parse(txtTipoPermisoId.SelectedValue);
                        obj.FechaHoraInicioPermiso = DateTime.Parse(txtFechaHoraInicioPermiso.Text);
                        obj.FechaHoraFinPermiso = DateTime.Parse(txtFechaHoraFinPermiso.Text);
                        context.Permiso.Add(obj);
                        context.SaveChanges();
                        BindGrid();
                    }
                }else{
                    string message = "Mayor a 30 dias.";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("');");
                    ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
                }


            }
        }
        protected void gvPermiso_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPermiso.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void gvPermiso_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPermiso.EditIndex = -1;
            BindGrid();
        }
        protected void gvPermiso_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvPermiso.Rows[e.RowIndex];

            TextBox txtId = row.FindControl("txtId") as TextBox;
            TextBox txtNombreEmpleado = row.FindControl("txtNombreEmpleado") as TextBox;
            TextBox txtApellidosEmpleado = row.FindControl("txtApellidosEmpleado") as TextBox;
            DropDownList txtTipoPermisoId = row.FindControl("ddlTipoPermisoId") as DropDownList;
            TextBox txtFechaHoraInicioPermiso = row.FindControl("txtFechaHoraInicioPermiso") as TextBox;
            TextBox txtFechaHoraFinPermiso = row.FindControl("txtFechaHoraFinPermiso") as TextBox;


            using (apgEntities context = new apgEntities())
            {
                int employeeID = Convert.ToInt32(gvPermiso.DataKeys[e.RowIndex].Value);
                Permiso obj = context.Permiso.First(x => x.Id == employeeID);
                //obj.Id = txtName.Text;
                obj.Id = int.Parse(txtId.Text);
                obj.NombreEmpleado = txtNombreEmpleado.Text;
                obj.ApellidosEmpleado = txtApellidosEmpleado.Text;
                obj.TipoPermisoId = int.Parse(txtTipoPermisoId.SelectedValue);
                obj.FechaHoraInicioPermiso = DateTime.Parse(txtFechaHoraInicioPermiso.Text);
                obj.FechaHoraFinPermiso = DateTime.Parse(txtFechaHoraFinPermiso.Text);

                context.SaveChanges();

                gvPermiso.EditIndex = -1;
                BindGrid();
            }

        }

        protected void gvPermiso_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int employeeID = Convert.ToInt32(gvPermiso.DataKeys[e.RowIndex].Value);
            using (apgEntities context = new apgEntities())
            {
                Permiso obj = context.Permiso.First(x => x.Id == employeeID);
                context.Permiso.Remove(obj);
                context.SaveChanges();
                BindGrid();
            }
        }
        protected int? validaDias()
        {
            GridViewRow row = gvPermiso.FooterRow;

            TextBox txtFechaHoraInicioPermiso = row.FindControl("txtFechaHoraInicioPermisoNew") as TextBox;
            TextBox txtFechaHoraFinPermiso = row.FindControl("txtFechaHoraFinPermisoNew") as TextBox;
            using (apgEntities context = new apgEntities())
            {

                object[] xparams = {
                    new SqlParameter("@fi", txtFechaHoraInicioPermiso.Text),
                    new SqlParameter("@ff", txtFechaHoraFinPermiso.Text)};
                int? department = context.Database.SqlQuery<Nullable<int>>("dbo.dia @fi, @ff", xparams).FirstOrDefault();
                return department;
            }
        }



        protected void gvPermiso_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddList = (DropDownList)e.Row.FindControl("ddlTipoPermisoId");
                    TextBox TipoPermisoId = (TextBox)e.Row.FindControl("txtTipoPermisoId");
                    using (apgEntities context = new apgEntities())
                    {
                        //return DataTable havinf department data
                        var country = from c in context.TipoPermiso select new { c.Id, c.Descripcion };
                        ddList.DataSource = country.ToList();
                        ddList.DataTextField = "Descripcion";
                        ddList.DataValueField = "Id";
                        ddList.DataBind();

                        DataRowView dr = e.Row.DataItem as DataRowView;
                        ddList.SelectedValue = TipoPermisoId.Text;
                    }
                }
            }

    }
    }
}