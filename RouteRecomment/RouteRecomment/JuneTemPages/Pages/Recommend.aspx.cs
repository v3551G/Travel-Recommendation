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
using Model.Scenery;
using BLL.Scenery;
using BLL.LogBLL;
using System.Collections.Generic;
using System.IO;
using Model.Sort;

namespace RouteRecomment.JuneTemPages.Pages
{
    public partial class Recommend : System.Web.UI.Page
    {
        public String[] RelateStra;
        public String SceArr;
        public String[] DetailSceArr;
        public String[] SceNameList;
        public String[] TxtFP;
        public String[] SceneryTime;
        public String[] ToNextTime;
        protected void Page_Load(object sender, EventArgs e)
        {
            SceArr = RecommendRotes().Split('*')[0];
            DetailSceArr = SceArr.Trim().Split('-');
            SceNameList = new String[DetailSceArr.Length];
            for (int i = 0; i < DetailSceArr.Length; i++)
            {
                SceNameList[i] = DetailSceArr[i].Split(',')[0];
            }
            //遍历一个文件夹下面的所有txt找出相关txt
            TxtFP = RelatedStra(SceNameList);

            #region   //获取路径中景点的对应时间 以及该路线中景点到达景点的时间
            //对每个名字记录其信息
            String SceStr = "";
            for (int j = 0; j < SceNameList.Length; j++)
            {
                SceStr += SceNameList[j];
                SceStr += ",";
            }
            SceStr = SceStr.Substring(0,SceStr.Length-1);

            String RoteInfoFP = "F:\\旅游网站\\旅游网站\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneTemPages\\Stragegy\\RoteTime.txt";
            StreamReader RISR = new StreamReader(RoteInfoFP);
            String Line = "";
            String[] TempLine=new String[2];
            while ((Line = RISR.ReadLine()) != null)
            {
                if (Line != "")
                {
                    TempLine = Line.Split('|');
                    if (TempLine[0].Trim() == SceStr)
                        break;
                }
            }
            SceneryTime = new String[SceNameList.Length];
            ToNextTime = new String[SceNameList.Length - 1];
            //勾划出 景点适游时间 到下一各景点所需的时间
            for (int k = 0; k < SceNameList.Length; k++)
                SceneryTime[k] = TempLine[1].Split('#')[k];
            for (int m = 0; m < SceNameList.Length - 1; m++)
                ToNextTime[m] = TempLine[1].Split('#')[SceNameList.Length + m];
            #endregion
        }

        //获取当前用户的IP
        public String GetUserIP()
        {
            //string loginIP = Request.UserHostAddress;
            string loginIP = Page.Request.UserHostAddress;

            return loginIP;
        }

        public String RecommendRotes()
        {
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            ClickLogBLL _ClickLogBLL = new ClickLogBLL();
            string IP = GetUserIP();
            DataTable DT = _ClickLogBLL.GetAllOneSee(IP, "景点");
            String[] ClickSce = new String[DT.Rows.Count];
            int SceneryID;
            DataTable SceDT;
            for (int SI = 0; SI < DT.Rows.Count; SI++)
            {
                SceneryID = int.Parse(DT.Rows[SI]["ContentFlag"].ToString());
                SceDT = _SceneryInfoBLL.GetSceneryInfoByID(SceneryID);
                ClickSce[SI] = SceDT.Rows[0]["SceneryName"].ToString();
            }
            String RotesFP = "F:\\旅游网站\\旅游网站\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneTemPages\\Stragegy\\FilterRotes.txt";
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
                for (int j = 0; j < ClickSce.Length; j++)
                    for (int k = 0; k < SceneryArr.Length; k++)
                    {
                        if (SceneryArr[k] != "")
                        {
                            if (SceneryArr[k].Trim().Contains(ClickSce[j].Trim()))
                                _RoteFre.PreCount++;
                        }
                    }
                _RoteFre.PreCount *= _RoteFre.PreCount / SceneryArr.Length;
                //_RoteFre.PreCount = _RoteFre.PreCount / 5;
                RoteSort.Add(_RoteFre);
            }

            RoteSort.Sort();
            
            //获取用户提交的显示偏好信息
            String PrevealPreFP = "F:\\旅游网站\\旅游网站\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneTemPages\\Stragegy\\RevealPre.txt";
            StreamReader PrevealPreSR = new StreamReader(PrevealPreFP);
            String PreferTxt = PrevealPreSR.ReadLine();
            PrevealPreSR.Close();
            int Days = int.Parse(PreferTxt.Split('*')[0]);                     //用户期望的天数
            String[] PreStr = PreferTxt.Split('*')[1].Split('|');
            int[] PreVector = new int[12];
            for (int Prei = 0; Prei < PreStr.Length; Prei++)
                PreVector[Prei] = int.Parse(PreStr[Prei]);                //用户偏好向量

            //查看排序的Top10中看是否有多个与用户期望的天数一致 若有直接再有之中按照相似度排序 若无直接按照相似度排序
            //1.读取出排序前10的线路ID  并计算出其实际天数 实际向量
            int[] RoteIDS = new int[10];
            for (int Prej = 0; Prej < 10; Prej++)
                RoteIDS[Prej] = RoteSort[Prej].RoteID;           //RoteID表示路线的行号

            int[] ActDays = new int[10];                           //每条线路的实际天数
            List<int> DaysList = new List<int>();
            String DaysFP = "F:\\旅游网站\\旅游网站\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneTemPages\\Stragegy\\RotesTime.txt";
            StreamReader DaysSR = new StreamReader (DaysFP);
            String DayLine = "";
            while((DayLine = DaysSR.ReadLine())!=null)
            {
                if (DayLine != "")
                    DaysList.Add(int.Parse(DayLine.Trim()));
            }
            DaysSR.Close();
            for (int Prek = 0; Prek < 10; Prek++)
                ActDays[Prek] = DaysList[RoteIDS[Prek] - 1];  //每条线路的实际天数

            String[] RoteTypeStr = new String[10];
            List<String> TypeList = new List<string>();
            String TypeFP = "F:\\旅游网站\\旅游网站\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneTemPages\\Stragegy\\RoteType.txt";
            StreamReader TypeSR = new StreamReader(TypeFP);
            String TypeLine = "";
            while ((TypeLine = TypeSR.ReadLine()) != null)
            {
                if (TypeLine != "")
                    TypeList.Add(TypeLine.Trim());
            }
            TypeSR.Close();
            for(int Prem=0;Prem<10;Prem++)
                RoteTypeStr[Prem] = TypeList[RoteIDS[Prem] - 1];

            List<int> DaysEqualRIDList = new List<int>();
            for (int Pren = 0; Pren < 10; Pren++)              //将用户期望天数与实际相等的天数相同的添加到列表中
            {
                if (ActDays[Pren] == Days)
                    DaysEqualRIDList.Add(RoteIDS[Pren]);       //将天数与用户期望RoteID的记录下
            }

            List<RoteFre> DaysEqRoteSort = new List<RoteFre>();
            if (DaysEqualRIDList.Count > 0)//如果有用户期望的行号 则按相似度排序
            {
                for (int Prel = 0; Prel < DaysEqualRIDList.Count; Prel++)  //计算每条线路的相似度
                {   
                    int[] RoteTypeTemp = new int[12];
                    string[] RTypeTemp = TypeList[DaysEqualRIDList[Prel]-1].Split('|');
                    for (int RTI = 0; RTI < RTypeTemp.Length; RTI++)
                        RoteTypeTemp[RTI] = int.Parse(RTypeTemp[RTI]);
                    float Sim = 0.0f; 
                    float Sum1 =  0.0f; 
                    float Sum2 = 0.0f;
                    float ComSum = 0.0f;
                    for (int RTJ = 0; RTJ < 12; RTJ++)
                    {
                        if (PreVector[RTJ] == 1)
                            Sum1++;
                        if (RoteTypeTemp[RTJ] == 1)
                            Sum2++;
                        if ((PreVector[RTJ] == 1) && (RoteTypeTemp[RTJ] == 1))
                            ComSum++;
                    }

                    RoteFre TempRote = new RoteFre();
                    TempRote.RoteID = DaysEqualRIDList[Prel];
                    TempRote.PreCount = ComSum / Math.Sqrt(Sum1 * Sum2);
                    DaysEqRoteSort.Add(TempRote);
                }

            }
            else//若无则直接按照将原来的按照相似度排序  RoteIDS 是按照频数排序前十的路线
            {
                for (int FreTen = 0; FreTen < 10; FreTen++)
                {
                    int[] RoteTypeTemp1 = new int[12];
                    string[] RTypeTemp1 = TypeList[RoteIDS[FreTen] - 1].Split('|');
                    for (int RTI1 = 0; RTI1 < RTypeTemp1.Length; RTI1++)
                        RoteTypeTemp1[RTI1] = int.Parse(RTypeTemp1[RTI1]);

                    float Sim1 = 0.0f;
                    float Sum11 = 0.0f;
                    float Sum21 = 0.0f;
                    float ComSum1 = 0.0f;
                    for (int RTJ1 = 0; RTJ1 < 12; RTJ1++)
                    {
                        if (PreVector[RTJ1] == 1)
                            Sum11++;
                        if (RoteTypeTemp1[RTJ1] == 1)
                            Sum21++;
                        if ((PreVector[RTJ1] == 1) && (RoteTypeTemp1[RTJ1] == 1))
                            ComSum1++;
                    }

                    RoteFre TempRote1 = new RoteFre();
                    TempRote1.RoteID = RoteIDS[FreTen];
                    TempRote1.PreCount = ComSum1 / Math.Sqrt(Sum11 * Sum21);
                    DaysEqRoteSort.Add(TempRote1);
                
                }
            }

            DaysEqRoteSort.Sort();
            string[] SceneryArr2;
            DataTable SceInfoDT;
            String Res = "";
            String Rotes = "";
            String ALLINFO = "";
            for (int m = 0; m < DaysEqRoteSort.Count; m++)
            {

                Res += m.ToString();
                Res += " ";
                Res += (DaysEqRoteSort[m].RoteID).ToString();
                Res += " ";
                Res += DaysEqRoteSort[m].PreCount;
                Res += RotesList[DaysEqRoteSort[m].RoteID - 1];
                Res += "\r\n";
                //对于一条线路来分析
                SceneryArr2 = RotesList[DaysEqRoteSort[m].RoteID - 1].Trim().Split(' ');
                // string LocRes;
                for (int mj = 0; mj < SceneryArr2.Length; mj++)
                {
                    // LocRes="";
                    if (SceneryArr2[mj] == "象鼻山")
                        SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName("象山公园");
                    else
                    {
                        SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName(SceneryArr2[mj]);
                    }
                    if (SceInfoDT.Rows.Count == 0)
                        SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName(SceneryArr2[mj].Substring(0, 2));
                    if (SceInfoDT.Rows.Count == 0)
                        SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName(SceneryArr2[mj].Substring(SceneryArr2[mj].Length - 2, 2));

                    Rotes += SceneryArr2[mj];
                    Rotes += ",";
                    Rotes += SceInfoDT.Rows[0]["SLongitude"].ToString();
                    Rotes += "|";
                    Rotes += SceInfoDT.Rows[0]["Slatitude"].ToString();
                    Rotes += "-";
                }                                                                                 
                Rotes = Rotes.Substring(0, Rotes.Length - 1);
                Rotes += "*";

            }
            //this.TextBox2.Text = Res;
            //ALLINFO += Rotes;
            //this.TextBox1.Text = ALLINFO;
            return Rotes;
        }

        //从所有攻略中找出最想关的攻略名，最后返回路径
        public String[] RelatedStra(String[] SceNameList)
        {
            List<SceFre> FileList = new List<SceFre>();
            String dir = "F:\\旅游网站\\旅游网站\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneTemPages\\Stragegy\\10492Strategy";

            DirectoryInfo StrDir = new DirectoryInfo(dir);
            FileSystemInfo[] Files = StrDir.GetFiles();
            for (int i = 0; i < Files.Length;                                                                                                                                                                                                                                                                                                                                                                                                                                                                 i++)
            {
                StreamReader TempSR = new StreamReader(Files[i].FullName, System.Text.Encoding.Default);
                String TempContent = TempSR.ReadToEnd();
                SceFre _SceFre = new SceFre();
                _SceFre.FileName = Files[i].FullName;
                for (int j = 0; j < SceNameList.Length; j++)
                {
                    if (TempContent.Contains(SceNameList[j]))
                        _SceFre.PreCount++;
                }
                FileList.Add(_SceFre);
                TempSR.Close();
            }

            FileList.Sort();

            String[] txtPath = new string[10];
            for (int k = 0; k < 10; k++)
            {
                txtPath[k] = FileList[k].FileName;
            }
            return txtPath;
        }

        //根据路径获取内容

        public String GetTxt(String FP)
        {
            StreamReader SR = new StreamReader(FP, System.Text.Encoding.Default);
            String Content = SR.ReadToEnd();
            SR.Close();
            return Content;
        }
    }
}
