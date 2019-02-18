using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using BLL.AuthorityBLL;

namespace RouteRecomment.Admin.SubPages.Authority.RoleManage
{
    public partial class RoleDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["RoleID"] == null || "".Equals(Request.QueryString["RoleID"])))
            {
                rqid = Request.QueryString["RoleID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
            else
            {

                Response.Write("<script language='javascript'>");
                Response.Write("document.location.href='RoleList.aspx';");
                Response.Write("</script>");
            }
        }

        //根据角色ID删除角色信息
        protected void deleteThis()
        {
            try
            {
                Array delWitch = rqid.Split('|');
                bool isTrue = false;
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));

                    RoleBLL _RoleBLL = new RoleBLL();
                    AdminRoleBLL _AdminRoleBLL = new AdminRoleBLL();
                    RoleResourceBLL _RoleResourceBLL = new RoleResourceBLL ();


                    if (_RoleBLL.DeleteRole(delid))
                    {
                        isTrue = true;

                    }
                    else
                        isTrue = false;

                    //判断管理员角色表中还有该角色没
                    int AdminRoleCount = _AdminRoleBLL.GetCountByRoleID(delid);

                    if (AdminRoleCount > 0)
                    {
                        if (_AdminRoleBLL.DeleteAdminRoleByRoleID(delid))
                        {

                            isTrue = true;

                        }
                        else
                            isTrue = false;
                    }

                    //判断角色资源表中还有该角色没
                    int RoleResourceCount = _RoleResourceBLL.GetRoleResourceCountByRoleID(delid);
                    if(AdminRoleCount>0)
                    {
                        if (_RoleResourceBLL.DeleteRoleAllResource(delid))
                            isTrue = true;
                        else
                            isTrue = false;
                    
                    }
                    if (isTrue == false)
                    { break; }

                }
                if (!(isTrue == false))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='RoleList.aspx';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='RoleList.aspx';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='RoleList.aspx';");
                Response.Write("</script>");
            }
        }
    }
}
