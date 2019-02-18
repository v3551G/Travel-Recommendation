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

namespace RouteRecomment.Admin.SubPages.SceneryManage.STypeManage
{
    public partial class STypeList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool IsSysAdmin = true;
                bool IsSceAdmin = true;

                if (null == Session["IsSYS"] || (Boolean)Session["IsSYS"] != true)
                {
                    IsSysAdmin = false;
                    IsSceAdmin = false;

                    AdminInfoBLL _AdminInfoBLL = new AdminInfoBLL();
                    RoleBLL _RoleBLL = new RoleBLL();
                    int AdminID = int.Parse(Session["AdminID"].ToString());
                    int RoleID = _RoleBLL.GetRoleIDByAdminID(AdminID);
                    IsSceAdmin = _AdminInfoBLL.CheckFunction(RoleID, "景点管理");
                }

                if (!(IsSysAdmin || IsSceAdmin))
                    Response.Redirect("../../NotAllowed.aspx");

            }
        }

        private void Bind()
        {
            
        
        }
    }
}
