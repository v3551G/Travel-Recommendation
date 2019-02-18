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
using BLL.UserBLL;

namespace RouteRecomment.FrontPages.Test.Pages
{
    public partial class ConfirmEmail : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string Guid = Request["CheckNum"].ToString();
            if (Guid == "")
            {
                Response.Write("验证链接有误，请点击正确的链接");
            }
            UserInfoBLL _UserInfoBLL = new UserInfoBLL();
            bool Flag = _UserInfoBLL.UpdateUserActiveByAlivationCode(Guid);
            if (Flag)
            {

                Response.Write("<script language='javascript'>");
                Response.Write("alert('恭喜注册成功......!');");
                Response.Write("</script>");
                Server.Transfer("Regist.aspx");
            } 
        }
    }
}
