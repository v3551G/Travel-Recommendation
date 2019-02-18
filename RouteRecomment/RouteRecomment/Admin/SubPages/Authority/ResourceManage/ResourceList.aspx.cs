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

namespace RouteRecomment.Admin.SubPages.Authority.ResourceManage
{
    public partial class ResourceList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (null == Session["IsSYS"] || (Boolean)Session["IsSYS"] != true)
                Response.Redirect("../../NotAllowed.aspx");
           
        }
    }
}
