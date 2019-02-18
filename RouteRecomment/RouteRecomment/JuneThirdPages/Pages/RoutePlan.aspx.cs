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
using System.IO;
using BLL.Scenery;

namespace RouteRecomment.JuneThirdPages.Pages
{
    public partial class RoutePlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // RoteInfo();
            //System.Console.WriteLine("完成");

           // String Test = InteSceInfo();
        }

        //得到每条路线的经纬度表示
        private void RoteInfo()
        {
            String FilterRotesFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\FilterRotes.txt";
            String FRotesInfoFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\FRotesInfo.txt";
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            StreamReader SR = new StreamReader(FilterRotesFP);
            StreamWriter SW = new StreamWriter(FRotesInfoFP);
            String Line = "";
            String[] SceList;
            String LineRes;

            while((Line=SR.ReadLine())!=null)
            {   
                LineRes="";
                SceList = Line.Trim().Split(' ');
                for (int i = 0; i < SceList.Length; i++)
                {
                    DataTable DT = _SceneryInfoBLL.GetSlaSLonBySceName(SceList[i]);
                    LineRes += SceList[i];
                    LineRes += ",";
                    LineRes += DT.Rows[0]["Slatitude"].ToString();
                    LineRes += "|";
                    LineRes += DT.Rows[0]["SLongitude"].ToString();
                    LineRes += "-";
                }
                LineRes = LineRes.Substring(0, LineRes.Length - 1);

                SW.WriteLine(LineRes);
                
            }


            SR.Close();
            SW.Close();
        
        }

        //所有路线的信息整合到字符串中 
        public string InteSceInfo()
        {
            String RoteInfoSTR = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\RotesIntoTest.txt";
            StreamReader SR = new StreamReader (RoteInfoSTR);
            String Line;
            String Res = "";

            while ((Line = SR.ReadLine()) != null)
            {
                Res += Line;
                Res += "*";
            }

            Res = Res.Substring(0,Res.Length-1);

            return Res;
        }
    
    }
}
