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

namespace RouteRecomment.Admin.SubPages.Authority.ResourceManage
{
    public partial class ResourceDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["ResourceID"] == null || "".Equals(Request.QueryString["ResourceID"])))
            {
                rqid = Request.QueryString["ResourceID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
            else
            {

                Response.Write("<script language='javascript'>");
                Response.Write("document.location.href='ResourceList.aspx';");
                Response.Write("</script>");
            }
        }


        //根据资源ID删除资源信息
        protected void deleteThis()
        {
            try
            {
                Array delWitch = rqid.Split('|');
                bool isTrue = false;
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));

                    ResourceBLL _ResourceBLL = new ResourceBLL();
                    RoleResourceBLL _RoleResourceBLL = new RoleResourceBLL();
                    
                    if (_ResourceBLL.DeleteResource(delid))
                        isTrue = true;
                    else
                        isTrue = false;

                    //判断角色资源表中还有该资源没
                    int RoleResourceCount = _RoleResourceBLL.GetRoleResourceCount(delid);

                    if (RoleResourceCount > 0)
                    {
                        if (_RoleResourceBLL.DeleteRoleResource(delid))
                        {

                            isTrue = true;

                        }
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
                    Response.Write("document.location.href='ResourceList.aspx';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='ResourceList.aspx';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='ResourceList.aspx';");
                Response.Write("</script>");
            }
        }
    }
}
