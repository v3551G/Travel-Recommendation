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
using System.Web.UI.MobileControls;
using System.Collections.Generic;

namespace RouteRecomment.JuneThirdPages.Test
{
    public partial class RoteTime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetRoteSTime();
            GetRotesType();
            this.TextBox1.Text = "完成";

        }

        //根据景点到景点的时间、单个景点的游玩时间记录 综合得出一条路径中的时间
        public void IntRoteTime()
        {
            String SceneryTimeFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\RSTSTime.txt";
            String AllSceneryTime = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\SceneryType\\综合景点.txt";
            String RotesTime = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\RoteTime.txt";

            StreamReader STSR = new StreamReader(SceneryTimeFP);
            StreamReader AST = new StreamReader(AllSceneryTime);
            StreamWriter RTSW = new StreamWriter(RotesTime);

            List<String> SceList = new List<string>();
            List<int> SceTimeList = new List<int>();
            String Line;
            String[] TempSplit;
            
            //将景点以及景点游玩所需要的时间都装进一个二维的arraylist里面
            while ((Line = AST.ReadLine()) != null)
            {
                TempSplit = Line.Trim().Split('|');
                SceList.Add(TempSplit[0]);
                SceTimeList.Add(int.Parse(TempSplit[1]));
            }
            AST.Close();

            String[] TimeArr;
            String[] SceInfoArr;
            String LineStr="";
            //将路线时间、与景点游玩时间综合起来
            Line = "";
            while ((Line = STSR.ReadLine())!=null)
            {
                if (Line == "")
                    continue;
                LineStr = "";
                TempSplit = Line.Split('*');
                TimeArr = TempSplit[1].Split('#');  //存储了景点间的到达时间

                //将景点过滤出来
                SceInfoArr = TempSplit[0].Split('-');
                for (int i = 0; i < SceInfoArr.Length; i++)
                {
                    LineStr += SceInfoArr[i].Split(',')[0];
                    LineStr += ",";
                }
                LineStr = LineStr.Substring(0, LineStr.Length - 1);
                LineStr += "|";
                //将景点游玩时间综合进去
                for (int j = 0; j < SceInfoArr.Length; j++)
                {
                    int index = SceList.IndexOf(SceInfoArr[j].Split(',')[0]);
                    if (index == -1)
                    {
                        if ("龙脊梯田".Contains(SceInfoArr[j].Split(',')[0]))
                        {
                            index = SceList.IndexOf("龙脊梯田");
                        }
                        if ("恭城武庙".Contains(SceInfoArr[j].Split(',')[0]))
                        {
                            index = SceList.IndexOf("恭城武庙");
                        }
                        if ("恭城文庙".Contains(SceInfoArr[j].Split(',')[0]))
                        {
                            index = SceList.IndexOf("恭城文庙");
                        }
                    
                    }
                    LineStr += SceTimeList[index].ToString();
                    LineStr += "#";
                }
                //将景点到景点的时间综合进去
                for (int k = 0; k < TimeArr.Length; k++)
                {
                    int Time = int.Parse(TimeArr[k])/60; 
                    LineStr += Time.ToString();
                    LineStr += "#";
                }
                LineStr = LineStr.Substring(0,LineStr.Length-1);
                RTSW.WriteLine(LineStr);
            }

            STSR.Close();
            RTSW.Close();
        }

        //算出每条路线所需的天数
        public void GetRoteSTime()
        {
            String RSRSSR = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\RoteTime.txt";
            String RoteTimeSW = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\RotesTime.txt";

            StreamReader SR = new StreamReader(RSRSSR);
            StreamWriter SW = new StreamWriter(RoteTimeSW);

            String Line="";
            String TimeStr = "";
            String[] TimeSplit;
            int TotalTime = 0;
            int Days = 0;
            while ((Line = SR.ReadLine()) != null)
            {   
                Days = 0;
                TotalTime = 0;
                TimeStr = Line.Split('|')[1];
                TimeSplit = TimeStr.Split('#');
                for (int i = 0; i < TimeSplit.Length; i++)
                {
                    if (TimeSplit[i] != "")
                        TotalTime += int.Parse(TimeSplit[i].Trim());
                 
                }
                TotalTime = TotalTime/60;     //转化为小时
                if (TotalTime % 10 > 0)            //一天旅游10小时
                {
                    Days = TotalTime / 10;
                    Days++;
                }
                else
                    Days = TotalTime / 10;
                SW.WriteLine(Days.ToString());
            }

            SR.Close();
            SW.Close();
        }

        //算出每条路线对应的类型向量 根据景点类型，以及整体类型信息
        public void GetRotesType()
        {
            String ScenetyTypeFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\SceneryType\\综合景点.txt";//包含景点类型信息
            String TypeInfoFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\SceneryType\\景点类型.txt";//包含类型信息
            String RotesInfoFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\FilterRotes.txt";//包含路线信息
            String RotesType = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\RoteType.txt";//结果写入的路径

            StreamReader SceTypeSR = new StreamReader(ScenetyTypeFP);
            StreamReader TypeInfoSR = new StreamReader(TypeInfoFP);
            StreamReader RoteInfoSR = new StreamReader(RotesInfoFP);
            StreamWriter ResSW = new StreamWriter(RotesType);

            List<String> TypeList = new List<string>();
            List<String> SceNameList = new List<string>();
            List<String> SceTypeList = new List<string>();
            String Line = "";
            //先读出所有的 大类型下面包含的小类型
            while ((Line = TypeInfoSR.ReadLine()) != null)
            {   
                if(Line!="")
                    TypeList.Add(Line.Split('|')[1].Trim());   
            }
            TypeInfoSR.Close();
            

            //读出所有的景点名 以及景点类型
            Line = "";
            String[] SplitRes;
            String TypeRes="";
            while ((Line = SceTypeSR.ReadLine()) != null)
            {
                if (Line != "")
                {
                    TypeRes = "";
                    SplitRes = Line.Split('|');
                    SceNameList.Add(SplitRes[0]);
                    for (int i = 2; i < SplitRes.Length; i++)
                    {
                        TypeRes += SplitRes[i];
                        TypeRes += "|";
                    }
                    TypeRes = TypeRes.Substring(0, TypeRes.Length - 1);
                    SceTypeList.Add(TypeRes);
                }
            }
            SceTypeSR.Close();

            
            //对每条旅游线路 计算出其类型向量
            Line = "";
            String[] RoteSceList; 
            while ((Line = RoteInfoSR.ReadLine()) != null)
            {
                int[] TypeArr = new int[12]; 
                RoteSceList = Line.Split(' ');
                for (int j = 0; j < RoteSceList.Length; j++) //对该路线中的每个景点来计算类型
                {
                    if (RoteSceList[j] != "")
                    {
                        int SceIndex = SceNameList.IndexOf(RoteSceList[j].Trim());
                        if (SceIndex == -1) //景点库中不包含该景点 就跳过
                            continue;
                        String SceType = SceTypeList[SceIndex];
                        String[] TypeDetail = SceType.Trim().Split('|');
                        for(int k=0;k<TypeDetail.Length;k++)
                            for (int m = 0; m < TypeList.Count; m++)
                            {
                                if (TypeList[m].Contains(TypeDetail[k].Trim()))
                                {
                                    TypeArr[m]++;
                                    continue;
                                }
                            }
                    }
                
                }

                String OneRoteRes = "";
                for (int n = 0; n < 12; n++)
                {
                    if (TypeArr[n] > 0)
                        OneRoteRes += "1";
                    else
                        OneRoteRes += "0";

                    OneRoteRes += "|";

                }
                OneRoteRes = OneRoteRes.Substring(0,OneRoteRes.Length-1);
                ResSW.WriteLine(OneRoteRes);
            }
            RoteInfoSR.Close();
            ResSW.Close();
          
        }



    }
}
