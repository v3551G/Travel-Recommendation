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
using Model.Authority;
using BLL.AuthorityBLL;

namespace RouteRecomment.Admin.SubPages.Authority.ResourceManage
{
    public partial class ResourceAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            Resource _Resource = new Resource();
            ResourceBLL _ResourceBLL = new ResourceBLL();


            _Resource.ResourceName = txtResource.Text.Trim();
            if(_ResourceBLL.AddResource(_Resource))
            {

                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('添加成功');");
                    Response.Write("document.location.href='ResourceList.aspx';");
                    Response.Write("</script>");
            }
        }
    }
}
