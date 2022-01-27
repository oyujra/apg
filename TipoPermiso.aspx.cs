
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDUsingEntityFramework
{
    public partial class Default : System.Web.UI.Page
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
                if (context.TipoPermiso.Count() > 0)
                {
                    gvTipoPermiso.DataSource = (from em in context.TipoPermiso
                                             select new { em.Id, em.Descripcion }).ToList();
                    gvTipoPermiso.DataBind();
                }
                else
                {
                    gvTipoPermiso.DataSource = null;
                    gvTipoPermiso.DataBind();
                }
            }
        }

        protected void gvTipoPermiso_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTipoPermiso.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvTipoPermiso_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertNew")
            {
                GridViewRow row = gvTipoPermiso.FooterRow;

                TextBox txtId = row.FindControl("txtIdNew") as TextBox;
                TextBox txtDescripcion = row.FindControl("txtDescripcionNew") as TextBox;
                var existe = this.ValueExists(txtDescripcion.Text);
                if (!existe)
                {
                    using (apgEntities context = new apgEntities())
                    {
                        TipoPermiso obj = new TipoPermiso();
                        //obj.Id = txtName.Text;
                        obj.Descripcion = txtDescripcion.Text;

                        context.TipoPermiso.Add(obj);
                        context.SaveChanges();
                        BindGrid();
                    }
                }
                else {
                    string message = "Descripcion encontrada.";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("');");
                    ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
                }
            }
        }
        protected void gvTipoPermiso_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTipoPermiso.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void gvTipoPermiso_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTipoPermiso.EditIndex = -1;
            BindGrid();
        }
        protected void gvTipoPermiso_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvTipoPermiso.Rows[e.RowIndex];

            TextBox txtId = row.FindControl("txtId") as TextBox;
            TextBox txtDescripcion = row.FindControl("txtDescripcion") as TextBox;


            using (apgEntities context = new apgEntities())
            {
                int employeeID = Convert.ToInt32(gvTipoPermiso.DataKeys[e.RowIndex].Value);
                TipoPermiso obj = context.TipoPermiso.First(x => x.Id == employeeID);
                //obj.Id = txtName.Text;
                obj.Descripcion = txtDescripcion.Text;

                context.SaveChanges();

                gvTipoPermiso.EditIndex = -1;
                BindGrid();
            }

        }

        protected void gvTipoPermiso_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int employeeID = Convert.ToInt32(gvTipoPermiso.DataKeys[e.RowIndex].Value);
            using (apgEntities context = new apgEntities())
            {
                TipoPermiso obj = context.TipoPermiso.First(x => x.Id == employeeID);
                context.TipoPermiso.Remove(obj);
                context.SaveChanges();
                BindGrid();
            }
        }
        private bool ValueExists(string _Value)
        {

            using (apgEntities context = new apgEntities())
            {
                return context.TipoPermiso.Any(x => x.Descripcion.Equals(_Value)); 
            }
            
        }
    }
}