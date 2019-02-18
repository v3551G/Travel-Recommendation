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

namespace RouteRecomment.Admin.SubPages.City.CityInfo
{
    public partial class CityInfoList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool IsSysAdmin = true;
            bool IsCityAdmin = true;

            if (null == Session["IsSYS"] || (Boolean)Session["IsSYS"] != true)
            {
                IsSysAdmin = false;
                IsCityAdmin = false;
        
                AdminInfoBLL _AdminInfoBLL = new AdminInfoBLL();
                RoleBLL _RoleBLL = new RoleBLL();
                int AdminID = int.Parse(Session["AdminID"].ToString());
                int RoleID = _RoleBLL.GetRoleIDByAdminID(AdminID);
                IsCityAdmin = _AdminInfoBLL.CheckFunction(RoleID, "市管理");
            }

            if(!(IsSysAdmin||IsCityAdmin))
                Response.Redirect("../../NotAllowed.aspx");
        }
    }
}
