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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string   Account = txtAccount.Value.Trim();
            string Password = txtPass.Value.Trim();

            //查看当前登录的用户是否存在
            UserInfoBLL _UserInfoBLL = new UserInfoBLL();
            int UserNum = _UserInfoBLL.IsUserExist(Account, Password);
            bool IsExist;
            if (UserNum > 0) IsExist = true;
            else IsExist = false;
            if (!IsExist)
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('登录成功');");
                Response.Write("</script>");
                Server.Transfer("Login.aspx");
                return;
            }

            Response.Write("<script language='javascript'>");
            Response.Write("alert('账号或密码输入错误');");
            Response.Write("</script>");


        }
    }
}
