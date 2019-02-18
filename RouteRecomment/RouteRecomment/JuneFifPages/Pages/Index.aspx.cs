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
using System.Web.Services;
using System.IO;
using System.Web.SessionState;

namespace RouteRecomment.JuneFifPages.Pages
{
    public partial class Index : System.Web.UI.Page,IRequiresSessionState
    {
        public string login;
        public string person;
        protected void Page_Load(object sender, EventArgs e)
        {
            if((Session["UserAccount"]!= null )&& (Session["UserPassWord"]!= null ))
            {
                login = "欢迎   " + Convert.ToString(Session["UserAccount"]) ;
                person = "Information.aspx"; //点击欢迎之后的界面
            }
            else
            {
                login = "登录";
                person = "login1.aspx";
            }
        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.ScriptManager1.EnablePageMethods = true;

        }
        [WebMethod]
        public static void GetDiaLogInfo(String DiaLogInfo)
        {
            String Info = DiaLogInfo;
            //String RevealPreFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneFifPages\\Stragegy\\RevealPre.txt";
            //InfoList[k * 6 + 5] = "../../../" + "Admin/UpLoadPics/20140419091208001300000914117127968044529870[1].jpg";
            //String RevealPreFP = "../../Stragegy/RevealPre.txt";

            String RevealPreFP = "F:\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneFifPages\\Stragegy\\RevealPre.txt";
            //String RevealPreFP = System.Web.HttpContext.Current.Server.MapPath("~/" + "JuneFifPages\\Stragegy\\RevealPre.txt");
            

            StreamWriter RevealSW = new StreamWriter(RevealPreFP);
            RevealSW.Write(Info);
            RevealSW.Close();
            return;
        }
    }
}
