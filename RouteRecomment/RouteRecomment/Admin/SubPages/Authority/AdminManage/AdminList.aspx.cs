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

namespace RouteRecomment.Admin.SubPages.Authority.AdminManage
{
    public partial class AdminList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if ((Boolean)Session["IsSYS"] != true)
                Response.Redirect("../../NotAllowed.aspx");
                
           
        }
    }
}
