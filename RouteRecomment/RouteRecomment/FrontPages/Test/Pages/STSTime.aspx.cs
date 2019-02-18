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
using BLL.Scenery;
using System.IO;
using System.Web.Services;

namespace RouteRecomment.FrontPages.Test.Pages
{
    public partial class STSTime : System.Web.UI.Page
    {

        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.ScriptManager1.EnablePageMethods = true;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetAllScenery();
        }
        /// <summary>
        /// 获取任意两景点间的驾车时间
        /// </summary>
        [WebMethod]
        public static void WriteSTSTime(String TimeRes)
        {

            String test = "";
            
        
        
        }

        public String GetAllScenery()
        {
            String AllScenery = "";
            String SceFP = "C:\\Users\\Administrator\\Desktop\\部分景点名.txt";
            StreamReader SceSR = new StreamReader(SceFP);
            string Line = "";
            while((Line=SceSR.ReadLine())!=null)
            {
                AllScenery += Line;
                AllScenery += "|";
            }

            AllScenery = AllScenery.Substring(0,AllScenery.Length-1);
            return AllScenery;
        }
        
    }
}
