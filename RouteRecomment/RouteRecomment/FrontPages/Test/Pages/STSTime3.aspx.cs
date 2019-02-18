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
using System.Text;
using System.Collections.Generic;
using System.IO;

namespace RouteRecomment.FrontPages.Test.Pages
{
    public partial class STSTime3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String type = "utf-8";
            string url;


            List<String> RoteList = GetAllRotes();
            String WriteFP = "C:\\Users\\Administrator\\Desktop\\景点到达时间.txt";
            StreamWriter RoteTimeSW = new StreamWriter(WriteFP);
            String Line;
            String[] SceList;
            String[] TempScenery;
            String LineTemp;
            try
            {
                for (int i = 0; i < RoteList.Count; i++)
                {   

                    Line = RoteList[i];
                    LineTemp = Line;
                    LineTemp += "*";
                    SceList = Line.Split('-');
                    //坐标格式为：lat<纬度>,lng<经度> 名称+经纬度：百度大厦|40.056878,116.30815
                    for (int j = 0; j < (SceList.Length-1); j++)
                    {   
                        TempScenery = SceList[j].Split(',');
                        String SceneryA="" ;
                        SceneryA += TempScenery[0];
                        SceneryA += "|";
                        SceneryA += TempScenery[1].Split('|')[1];
                        SceneryA += ",";
                        SceneryA += TempScenery[1].Split('|')[0];

                        TempScenery = SceList[j + 1].Split(',');
                        String SceneryB="";
                        SceneryB += TempScenery[0];
                        SceneryB += "|";
                        SceneryB += TempScenery[1].Split('|')[1];
                        SceneryB += ",";
                        SceneryB += TempScenery[1].Split('|')[0];

                        url = "";
                        url = "http://api.map.baidu.com/direction/v1?mode=driving&origin=" + SceneryA;
                        url += "&destination=" + SceneryB + "&origin_region"
                               + "=桂林&destination_region=桂林&output=json&ak=9da43ee7f7a626b1b669de6179e55a9f";
                       
                        String result = GetUrltoHtml(url, type);
                        string temp = GetSmallTime(result);
                        LineTemp += temp;
                        LineTemp += "#";
                        
                       // this.TextBox1.Text = i.ToString() + j.ToString();

                    }
                    LineTemp = LineTemp.Substring(0,LineTemp.Length-1);
                    RoteTimeSW.WriteLine(LineTemp);
                }
            }
            catch(Exception ex)
            {
            }
            RoteTimeSW.Close();
            this.TextBox1.Text = "执行完成";

        }

       //根据url获取页面内容
       public static string GetUrltoHtml(string Url,string type)
        {
            try
            {
                System.Net.WebRequest wReq = System.Net.WebRequest.Create(Url);
                // Get the response instance.
                System.Net.WebResponse wResp = wReq.GetResponse();
                System.IO.Stream respStream = wResp.GetResponseStream();
                // Dim reader As StreamReader = New StreamReader(respStream)
                using (System.IO.StreamReader reader = new System.IO.StreamReader(respStream, Encoding.GetEncoding(type)))
                {
                    return reader.ReadToEnd();
                }
            }
            catch (System.Exception ex)
            {
                //errorMsg = ex.Message;
            }
            return"";
        }

       //根据结果截取其中的时间
       public String GetSmallTime(String OrgStr)
       {
           if (OrgStr.Contains("duration"))
           {
               int indexArr = OrgStr.IndexOf("duration");

               String OrgString = OrgStr.Substring(indexArr, 50);

               int index1 = OrgString.IndexOf(':');

               int Index2 = OrgString.IndexOf(',');
               int Length = Index2 - index1;
               OrgString = OrgString.Substring(index1 + 1, Length - 1);
               return OrgString;
           }
           else
               return "";

       }
       
       //读取出所有的路线
       public List<String> GetAllRotes()
       {
           List<String> RoteList = new List<string>();
           String SceFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\PartTwo.txt";
           StreamReader SceSR = new StreamReader(SceFP);
           string Line = "";
           while ((Line = SceSR.ReadLine()) != null)
           {
               RoteList.Add(Line);
           }
           SceSR.Close();
           return RoteList;
       }


    }
}
