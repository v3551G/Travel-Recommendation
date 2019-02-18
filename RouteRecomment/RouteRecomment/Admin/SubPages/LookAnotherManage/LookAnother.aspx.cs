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

namespace RouteRecomment.Admin.SubPages.LookAnotherManage
{
    public partial class LookAnother : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdSceneryLookAnthor()
        {

            Response.Write("<script language='javascript'>");
            Response.Write("alert('调用成功');");
            Response.Write("document.location.href='LookAnother.aspx';");
            Response.Write("</script>");
        
        }
    }
}
