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

namespace RouteRecomment.Admin
{
    public partial class Top : System.Web.UI.Page
    {
        public String RoleName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Boolean)Session["IsSYS"])
                {
                    RoleName = "系统管理员";
                }
                else
                {
                    RoleBLL _RoleBLL = new RoleBLL();
                    RoleName = _RoleBLL.GetRoleNameByAdminID((int)Session["AdminID"]);
                }
            
            }
        }
    }
}
