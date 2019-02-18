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
using System.Collections.Generic;
using Model.Sort;
using BLL.LogBLL;
using BLL.Scenery;

namespace RouteRecomment.FrontPages.Pages
{
    public partial class Recommend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RecommendRotes();
        }

        //获取当前用户的IP
        public String GetUserIP()
        {
            //string loginIP = Request.UserHostAddress;
            string loginIP = Page.Request.UserHostAddress;

            return loginIP;
        }
        
        private void RecommendRotes()
        {   
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL ();
            ClickLogBLL  _ClickLogBLL = new ClickLogBLL ();
            string IP = GetUserIP();
            DataTable DT = _ClickLogBLL.GetAllOneSee(IP,"景点");
            String [] ClickSce = new  String[DT.Rows.Count];
            int SceneryID;
            DataTable SceDT;
            for(int SI = 0;SI<DT.Rows.Count;SI++)
            {   
                SceneryID = int.Parse(DT.Rows[SI]["ContentFlag"].ToString());
                SceDT = _SceneryInfoBLL.GetSceneryInfoByID(SceneryID);
                ClickSce[SI] = SceDT.Rows[0]["SceneryName"].ToString();
            }
            String RotesFP = "F:\\网站代码  2014\\RouteRecomment\\RouteRecomment\\FrontPages\\Stragegy\\5420Rotes.txt";
            List<String> RotesList = new List<String>();
            String Line;
            StreamReader SR1 = new StreamReader(RotesFP);
            //先统计出所有路线的信息
            while ((Line = SR1.ReadLine()) != null)
            {
                if (Line != "")
                {
                    RotesList.Add(Line);
                }
            }
            SR1.Close();

            //统计每个线路包含点击景点的频数
            List<RoteFre> RoteSort = new List<RoteFre>();
            String[] SceneryArr;
            for (int i = 1; i <= RotesList.Count; i++)
            {
                RoteFre _RoteFre = new RoteFre();
                _RoteFre.RoteID = i;
                SceneryArr = RotesList[i - 1].Trim().Split(' ');
                for(int j=0;j<ClickSce.Length;j++)
                    for (int k = 0; k < SceneryArr.Length; k++)
                    {
                        if (SceneryArr[k]!="")
                        {
                            if (ClickSce[j].Trim().Contains(SceneryArr[k].Trim()))
                                _RoteFre.PreCount++;
                        }
                    }
                _RoteFre.PreCount *= _RoteFre.PreCount/SceneryArr.Length;
               //_RoteFre.PreCount = _RoteFre.PreCount / 5;
                RoteSort.Add(_RoteFre);
            }

            RoteSort.Sort();

            string[] SceneryArr2;
            DataTable SceInfoDT;
            String Res = "";
            String Rotes="";
            String ALLINFO="";
            for (int m = 0; m < 5; m++)
            {   

                Res += m.ToString();
                Res +=" ";
                Res += (RoteSort[m].RoteID).ToString();;
                Res += " ";
                Res += RoteSort[m].PreCount;
                Res += RotesList[RoteSort[m].RoteID-1];              
                Res += "\r\n";
                //对于一条线路来分析
                SceneryArr2 = RotesList[RoteSort[m].RoteID - 1].Trim().Split(' ');
                for (int mj = 0; mj < SceneryArr2.Length; mj++)
                {
                    if (SceneryArr2[mj] == "象鼻山")
                        SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName("象山公园");
                    else
                    {
                        SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName(SceneryArr2[mj]);
                    }
                    if (SceInfoDT.Rows.Count==0)
                        SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName(SceneryArr2[mj].Substring(0,2));
                    if(SceInfoDT.Rows.Count==0)
                        SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName(SceneryArr2[mj].Substring(SceneryArr2[mj].Length-2, 2));

                    Rotes += SceneryArr2[mj];
                    Rotes += ",";
                    Rotes += SceInfoDT.Rows[0]["SLongitude"].ToString();
                    Rotes += "|";
                    Rotes += SceInfoDT.Rows[0]["Slatitude"].ToString();
                    Rotes += "  ";
                }
                Rotes += "\r\n";
                
            }
           this.TextBox2.Text = Res;
           ALLINFO +=Rotes;
           this.TextBox1.Text = ALLINFO;
        }
    }
}
