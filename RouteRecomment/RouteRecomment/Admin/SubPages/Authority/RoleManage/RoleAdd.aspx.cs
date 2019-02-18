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

namespace RouteRecomment.Admin.SubPages.Authority.RoleManage
{
    public partial class RoleAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            RoleBLL _RoleBLL = new RoleBLL();
            Role _Role = new Role();
            _Role.RoleName = this.txtRole.Text.Trim();

            if (_RoleBLL.AddRole(_Role))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='RoleList.aspx';");
                Response.Write("</script>");
            
            }

        }
    }
}
