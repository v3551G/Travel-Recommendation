using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.Services;  // ++  使用WebMethod
using System.Xml.Linq;
using System.IO;
using System.Windows.Forms;
using System.Text;
using System.Text.RegularExpressions;
//
using BLL.Scenery;
using BLL.LogBLL;
using BLL.PicBLL;
using Model.Sort;
using Model.Scenery;
using Model.FrequItem;

namespace RouteRecomment.JuneFifPages.Pages
{
    public partial class Recommend : System.Web.UI.Page, IHttpHandler
    {
        public String[] RelateStra;
        public String SceArr;//
        public String[] DetailSceArr;//+

        public String[] SceNameList;//存放经过模糊匹配后的线路所包含的景点 ，格式： 景点 景点 
        public String[][] TxtFP = new String[5][];      //存放攻略相关Txt文件名
        public String[][] SceneryTime = new String[5][];
        public String[][] ToNextTime = new String[5][];
        public List<String> PicUrlList = new List<string>();
        public PicInfoBLL _PicInfoBLL = new PicInfoBLL();
        public SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();

        public string login;
        public string person;

        public List<String> Sce = new List<String>();   //搜索下拉框搜索“字典”

        public String[] childrenEnj = {"西街","蝴蝶泉","七星公园","世外桃源","印象刘三姐","大榕树","两江四湖","遇龙河","聚龙潭","宝鼎瀑布","灵渠"};
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((Session["UserAccount"] != null) && (Session["UserPassWord"] != null))
            {
                login = "欢迎   " + Convert.ToString(Session["UserAccount"]);
                person = "Information.aspx"; //点击欢迎之后的界面
            }
            else
            {
                login = "登录";
                person = "login3.aspx";
            }

            //List<String> Sce = new List<String> ();
            String rdLine = "";
            String[] ItemLine;
            String RotesFP = "F:\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneFifPages\\Stragegy\\FilterRotes.txt";
            StreamReader rd = new StreamReader(RotesFP);
            while ((rdLine = rd.ReadLine()) != null)
            {
                if (rdLine != " ")
                {
                    ItemLine = new String[rdLine.Split(' ').Length];
                    ItemLine = rdLine.Split(' ');
                    for (int i = 0; i < rdLine.Split(' ').Length; i++)
                    {
                        if (!Sce.Contains(ItemLine[i]))
                            Sce.Add(ItemLine[i]);
                    }
                }
            }

            //攻略路径名
            #region
            if (RecommendRotes().Split('*').Length >= 1) {

                SceArr = RecommendRotes().Split('*')[0]; //元素数据格式：景点,经度|纬度-......景点,经度|纬度
                DetailSceArr = SceArr.Trim().Split('-'); //Detail中一个元素格式： 景点，经度|维度
                SceNameList = new String[DetailSceArr.Length];
                for (int i = 0; i < DetailSceArr.Length; ++i)
                {
                    SceNameList[i] = DetailSceArr[i].Split(',')[0];

                }
                TxtFP[0] = RelatedStra(SceNameList);
            }
            if (RecommendRotes().Split('*').Length >= 2) {
                SceArr = RecommendRotes().Split('*')[1]; //元素数据格式：景点,经度|纬度-......景点,经度|纬度
                DetailSceArr = SceArr.Trim().Split('-'); //Detail中一个元素格式： 景点，经度|维度
                SceNameList = new String[DetailSceArr.Length];
                for (int i = 0; i < DetailSceArr.Length; ++i)
                {
                    SceNameList[i] = DetailSceArr[i].Split(',')[0];

                }
                TxtFP[1] = RelatedStra(SceNameList);
            }

            if (RecommendRotes().Split('*').Length >= 3) {
                SceArr = RecommendRotes().Split('*')[2]; //元素数据格式：景点,经度|纬度-......景点,经度|纬度
                DetailSceArr = SceArr.Trim().Split('-'); //Detail中一个元素格式： 景点，经度|维度
                SceNameList = new String[DetailSceArr.Length];
                for (int i = 0; i < DetailSceArr.Length; ++i)
                {
                    SceNameList[i] = DetailSceArr[i].Split(',')[0];

                }
                TxtFP[2] = RelatedStra(SceNameList);
            }

            if (RecommendRotes().Split('*').Length >= 4) {
                SceArr = RecommendRotes().Split('*')[3]; //元素数据格式：景点,经度|纬度-......景点,经度|纬度
                DetailSceArr = SceArr.Trim().Split('-'); //Detail中一个元素格式： 景点，经度|维度
                SceNameList = new String[DetailSceArr.Length];
                for (int i = 0; i < DetailSceArr.Length; ++i)
                {
                    SceNameList[i] = DetailSceArr[i].Split(',')[0];

                }
                TxtFP[3] = RelatedStra(SceNameList);
            }

            if (RecommendRotes().Split('*').Length >= 5) {
                SceArr = RecommendRotes().Split('*')[4]; //元素数据格式：景点,经度|纬度-......景点,经度|纬度
                DetailSceArr = SceArr.Trim().Split('-'); //Detail中一个元素格式： 景点，经度|维度
                SceNameList = new String[DetailSceArr.Length];
                for (int i = 0; i < DetailSceArr.Length; ++i)
                {
                    SceNameList[i] = DetailSceArr[i].Split(',')[0];
                }
                TxtFP[4] = RelatedStra(SceNameList);
            }
            #endregion

        }

        //获取当前用户的IP
        public String GetUserIP()
        {
            // 调用内置对象Request
            string loginIP = Page.Request.UserHostAddress;

            return loginIP;
        }
        //

        //返回下一个可用的关联规则序号，否则返回-1
        int RelSeted(List<FreSets> RelSet, String SceName, String RouSce, int cishu)
        {
            List<int> res = new List<int>();
            for (int i = 0; i < RelSet.Count; i++)
            {
                String[] SceStr = RelSet[i].items.Split('-');
                if (SceName.Equals(SceStr[0]))
                    res.Add(i);
            }
            if (res.Count > cishu)  //>=
                return res[cishu];
            return -1;
        }

        int Max(int x, int y)
        {
            return x > y ? x : y;
        }
        int Min(int x, int y)
        {
            return x > y ? y : x;
        }
        //获取风景全名
        string GetFullSceName(string sceName)
        {
            string scename;
            DataTable SceNameDT;

            SceNameDT = _SceneryInfoBLL.GetSlaSLonBySceName(sceName);

            if (SceNameDT.Rows.Count == 0)
                SceNameDT = _SceneryInfoBLL.GetSlaSLonBySceName(sceName.Substring(sceName.Length - 2, 2));

            if (SceNameDT.Rows.Count == 0)
                SceNameDT = _SceneryInfoBLL.GetSlaSLonBySceName(sceName.Substring(0, 2));

            if (SceNameDT.Rows.Count > 0)
                scename = SceNameDT.Rows[0]["SceneryName"].ToString();
            else
                scename = sceName;
            return scename;
        }
        //线路推荐算法
        public String RecommendRotes()
        {
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            ClickLogBLL _ClickLogBLL = new ClickLogBLL();
            DataTable ddt;
            //string IP = GetUserIP(); //外网IP
            string IP = "202.193.64.31";
            //nsole.Write("IP:" + IP);//
            //MessageBox.Show("IP:" + IP);//
            DataTable DT = _ClickLogBLL.GetAllOneSee(IP, "景点");
            String[] ClickSced = new String[DT.Rows.Count];
            List<String> ClickSce = new List<String>();
            List<String> FrequSce = new List<String>();
            int SceneryID;
            DataTable SceDT;


            //获取用户最近浏览的景点
            for (int SI = 0; SI < DT.Rows.Count; SI++)
            {
                SceneryID = int.Parse(DT.Rows[SI]["ContentFlag"].ToString());
                SceDT = _SceneryInfoBLL.GetSceneryInfoByID(SceneryID);
                if (SceDT.Rows.Count > 0)
                    ClickSced[SI] = SceDT.Rows[0]["SceneryName"].ToString();
            }
            for (int i = 0; i < ClickSced.Length; i++)
            {
                if (!ClickSce.Contains(ClickSced[i]))
                    ClickSce.Add(ClickSced[i]);
            }

            //Apriori算法+ 关联规则
            int CommentLowLimit = 5;  //点评量下限
            float sup = 0.02F;        //支持度阀值
            float cup = 0.1F;         //置信度阀值

            DataTable SceNameDT;
            List<String> I = new List<String>();
            List<String> D = new List<String>();
            List<String> DD = new List<String>();  ///存储线路，（风景全名）
            List<ItemSets> FreSet = new List<ItemSets>();
            List<FreSets> RelSet = new List<FreSets>();
            String sceName;

            I = GetIFromDB(CommentLowLimit);
            D = GetDFromTxt();
            for (int ci = 0; ci < D.Count; ci++)
            {
                String[] OneRoute = D[ci].Split(',');
                String ResRoute = "";
                for (int cii = 0; cii < OneRoute.Length; cii++)
                {
                    sceName = GetFullSceName(OneRoute[cii]);
                    ResRoute += sceName;
                    ResRoute += ",";
                }
                ResRoute = ResRoute.Substring(0, ResRoute.Length - 1);
                DD.Add(ResRoute);
            }
            FreSet = Apriori(DD, I, sup);                 //Apriori算法
            RelSet = AprioriRelatedRule(DD, FreSet, cup); //关联规则

            //获取用户提交信息
            //String PrevealPreFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneFifPages\\Stragegy\\RevealPre.txt";
            String PrevealPreFP = "F:\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneFifPages\\Stragegy\\RevealPre.txt";
            StreamReader PrevealPreSR = new StreamReader(PrevealPreFP);
            String PreferTxt = PrevealPreSR.ReadLine();
            PrevealPreSR.Close();
            int Days = int.Parse(PreferTxt.Split('*')[0]);                //用户期望的天数
            String[] PreStr = PreferTxt.Split('*')[1].Split('|');         //用户偏好向量
            int[] PreVector = new int[12];
            for (int Prei = 0; Prei < PreStr.Length; Prei++)
                PreVector[Prei] = int.Parse(PreStr[Prei]);
            int money = int.Parse(PreferTxt.Split('*')[2]);               //用户消费金额

            String[] companyPeo = PreferTxt.Split('*')[3].Split('|');     //用户陪同人员
            int[] companyVector = new int[4];
            for (int i = 0; i < companyPeo.Length; i++)
                companyVector[i] = int.Parse(companyPeo[i]);

            String[] ageRan = PreferTxt.Split('*')[4].Split('|');         //用户年龄范围
            int[] ageRanVector = new int[6];
            for (int j = 0; j < ageRan.Length; j++)
                ageRanVector[j] = int.Parse(ageRan[j]);

            //获取各景点相互到达时间
            const int SceCountLimit = 500;
            int[][] TToNextTime = new int[SceCountLimit][]; //只使用下对角，从1开始，i >= j  ,变量重名
            String RotesFP = "F:\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneFifPages\\Stragegy\\ToNextTime.txt";
            List<String> RotesList = new List<String>();
            StreamReader SR1 = new StreamReader(RotesFP);
            String Line;
            int lineCount = 0;
            while ((Line = SR1.ReadLine()) != null)
            {
                if (Line != "")
                {
                    lineCount += 1;
                    String[] ItemLine = new String[Line.Split('#').Length];
                    ItemLine = Line.Split('#');
                    TToNextTime[lineCount] = new int[Line.Split('#').Length + 1];
                    for (int i = 0; i < ItemLine.Length; i++)
                        TToNextTime[lineCount][i + 1] = int.Parse(ItemLine[i]);
                }
            }
            SR1.Close();

            //是否带有小孩
            if (int.Parse(companyPeo[2]) == 1)
            {
                for (int x = 0; x < childrenEnj.Length; x++)
                {
                    if (!ClickSce.Contains(childrenEnj[x]))
                        ClickSce.Add(childrenEnj[x]);
                }
            }
            //算法逻辑
            int k = 0;
            List<Routes> RecRoute = new List<Routes>();
            String[] tmpSce;
            for (int ii = 0; ii < RelSet.Count && k < 5; ii++)
            {
                tmpSce = RelSet[ii].items.Split('-');
                //String[] tmpSeq = RelSet[ii].seq.Split('-');
                //String[] tmpSloan = RelSet[ii].slalon.Split('-');
                String[] tmpSeq, tmpSloan, tmpTimeSpan;
                String[] nextSce, nextSeq, nextSloan, nextTimeSpan;
                if (ClickSce.Contains(tmpSce[0]))
                {
                    tmpSeq = RelSet[ii].seq.Split('-');
                    tmpSloan = RelSet[ii].slalon.Split('-');
                    tmpTimeSpan = RelSet[ii].timeSpan.Split('-');
                    //
                    nextSce = tmpSce[1].Split(',');
                    nextSeq = tmpSeq[1].Split(',');
                    nextSloan = tmpSloan[1].Split(',');
                    nextTimeSpan = tmpTimeSpan[1].Split(',');
                    #region
                    int timeSpan, timeSpan2, Add, fsceType, nextType,tmpNextTime;
                    int t0, t1;
                    //int[] tmpTime;
                    for (int ic = 0; ic < nextSce.Length && k < 5; ++ic)
                    {
                        Routes Rou = new Routes();
                        RecRoute.Add(Rou);
                        RecRoute[k].sceStr = tmpSce[0] + ",";
                        RecRoute[k].seqStr = tmpSeq[0] + ",";
                        RecRoute[k].slalon = tmpSloan[0] + ",";
                        RecRoute[k].timeSpans = tmpTimeSpan[0] + ",";
                        //获取适游时间
                        //更新数据库，改写：GetSeqSlalonBySceName , select: + TimeSpan + SceType 
                        ddt = _SceneryInfoBLL.GetSeqSlalonBySceName(tmpSce[0]);
                        timeSpan = int.Parse(ddt.Rows[0]["TimeSpan"].ToString());
                        fsceType = int.Parse(ddt.Rows[0]["SceType"].ToString());
                        RecRoute[k].SceType = fsceType + ",";
                        RecRoute[k].AddTime(timeSpan); //适游时间timeSpan
                        //tmpTime = RecRoute[k].rouTime; 
                        ddt = _SceneryInfoBLL.GetSeqSlalonBySceName(nextSce[ic]);
                        nextType = int.Parse(ddt.Rows[0]["SceType"].ToString());
                        timeSpan2 = int.Parse(ddt.Rows[0]["TimeSpan"].ToString());
                        //tmpNextTime = TToNextTime[Max(int.Parse(tmpSeq[0]), int.Parse(nextSeq[ic]))][Min(int.Parse(tmpSeq[0]), int.Parse(nextSeq[ic]))];
                        Add = TToNextTime[Max(int.Parse(tmpSeq[0]), int.Parse(nextSeq[ic]))][Min(int.Parse(tmpSeq[0]), int.Parse(nextSeq[ic]))] + timeSpan2; //到达下一景点时间 + 适游时间
                        if (RecRoute[k].AddTry(Add, Days))
                        {
                            RecRoute[k].sceStr += nextSce[ic] + ",";
                            RecRoute[k].seqStr += nextSeq[ic] + ",";
                            RecRoute[k].slalon += nextSloan[ic] + ",";
                            RecRoute[k].SceType += nextType + ",";
                            RecRoute[k].timeSpans += nextTimeSpan[ic] + ",";
                            //
                            RecRoute[k].toNextTimes += TToNextTime[Max(int.Parse(tmpSeq[0]), int.Parse(nextSeq[ic]))][Min(int.Parse(tmpSeq[0]), int.Parse(nextSeq[ic]))] + ",";
                            RecRoute[k].AddTime(Add);
                            //
                            #region
                            String SceRe = "";
                            int iii;
                            String[] SceStr;
                            int cishu = 0;  //与RelSeted有的flag（控制逻辑）
                            while ((iii = RelSeted(RelSet, nextSce[ic], RecRoute[k].sceStr, cishu)) != -1)
                            {
                                SceStr = RelSet[iii].items.Split('-')[1].Split(',');
                                int j;
                                for (j = 0; j < SceStr.Length; j++)
                                {
                                    if (!RecRoute[k].sceStr.Contains(SceStr[j]))
                                    {
                                        //..
                                        int[] ntmpTime = RecRoute[k].rouTime;
                                        String[] ntmpSeq = RelSet[k].seq.Split('-');
                                        ddt = _SceneryInfoBLL.GetSeqSlalonBySceName(SceStr[j]);
                                        int ntimeSpan = int.Parse(ddt.Rows[0]["timeSpan"].ToString()); //适游时间
                                        int nAdd = TToNextTime[Max(int.Parse(nextSeq[ic]), int.Parse(ntmpSeq[1].Split(',')[j]))][Min(int.Parse(ntmpSeq[1].Split(',')[j]), int.Parse(nextSeq[ic]))] + ntimeSpan;

                                        if (RecRoute[k].AddTry(nAdd, Days))
                                        {
                                            RecRoute[k].sceStr += SceStr[j] + ",";
                                            RecRoute[k].seqStr += RelSet[iii].seq.Split('-')[1].Split(',')[j] + ",";
                                            RecRoute[k].slalon += RelSet[iii].slalon.Split('-')[1].Split(',')[j] + ",";
                                            RecRoute[k].SceType += ddt.Rows[0]["SceType"] + ",";
                                            RecRoute[k].timeSpans += RelSet[iii].timeSpan.Split('-')[1].Split(',')[j] + ",";
                                            RecRoute[k].toNextTimes += TToNextTime[Max(int.Parse(nextSeq[ic]), int.Parse(ntmpSeq[1].Split(',')[j]))][Min(int.Parse(ntmpSeq[1].Split(',')[j]), int.Parse(nextSeq[ic]))] + ",";
                                            RecRoute[k].AddTime(nAdd);
                                            //
                                            nextSce[ic] = SceStr[j];
                                            SceRe = SceStr[j];//启下
                                            cishu = 0;
                                            break;
                                        }
                                    }//if
                                    else
                                    {
                                        cishu += 1;
                                    }
                                    //break;
                                }//for 
                            }//while
                            #endregion
                            //关联规则..断点，用大众旅游线路续接
                            #region
                            if (RecRoute[k].rouTime[0] < Days)
                            {
                                //List<String> ClassicRou = GetDFromTxt();
                                //List<String> ClassicRou = D;
                                bool outflag = true;
                                for (int ir = 0; ir < D.Count && outflag; ir++)
                                {
                                    String[] CItemSce = D[ir].Split(',');
                                    if (D[ir].Contains(SceRe) && !CItemSce[CItemSce.Length - 1].Equals(SceRe))
                                    {
                                        int id = 0;
                                        for (int cx = 0; cx < CItemSce.Length; cx++)
                                        {
                                            if (CItemSce[cx].Equals(SceRe))
                                            {
                                                id = cx;
                                                break;
                                            }
                                        }
                                        int rTimeSpan, rToNextTime, rToTalTime, rSeqLeft, rSeqRight, tmplen;
                                        int cxx;
                                        string fullSceName;
                                        for (cxx = id + 1; cxx < CItemSce.Length; cxx++)
                                        {
                                            fullSceName = GetFullSceName(CItemSce[cxx]);
                                            if (!RecRoute[k].sceStr.Contains(fullSceName))
                                            {
                                                ddt = _SceneryInfoBLL.GetSeqSlalonBySceName(fullSceName);  //加上判断逻辑
                                                rTimeSpan = int.Parse(ddt.Rows[0]["TimeSpan"].ToString());
                                                rSeqRight = int.Parse(ddt.Rows[0]["SceneryID"].ToString());
                                                tmplen = RecRoute[k].sceStr.Split(',').Length;
                                                rSeqLeft = int.Parse(RecRoute[k].seqStr.Split(',')[tmplen - 2]);  //输入字符串格式不对 ，有一个空的字符串 " "
                                                rToNextTime = TToNextTime[Max(rSeqLeft, rSeqRight)][Min(rSeqLeft, rSeqRight)];
                                                rToTalTime = rTimeSpan + rToNextTime; //到下一景点以及在下一景点时间
                                                if (RecRoute[k].AddTry(rToTalTime, Days))
                                                {
                                                    RecRoute[k].sceStr += fullSceName + ","; //CItemSce[cxx]
                                                    RecRoute[k].seqStr += rSeqRight + ",";
                                                    RecRoute[k].slalon += ddt.Rows[0]["SLongitude"] + "|" + ddt.Rows[0]["Slatitude"] + ",";
                                                    RecRoute[k].SceType += ddt.Rows[0]["SceType"] + ",";
                                                    RecRoute[k].timeSpans += ddt.Rows[0]["TimeSpan"] + ",";
                                                    RecRoute[k].toNextTimes += rToNextTime + ",";
                                                    RecRoute[k].AddTime(rToTalTime);
                                                    SceRe = CItemSce[cxx];
                                                }
                                                else
                                                {
                                                    outflag = false;
                                                    break;
                                                }
                                            }//if                                                                                                                           
                                        }//for
                                        //int tL;
                                        //String[] tLTemp;
                                        // if (cxx == CItemSce.Length) {
                                        //    tL = RecRoute[k].sceStr.Trim().Split(',').Length;
                                        //     SceRe = RecRoute[k].sceStr.Split(',')[tL-2];// -，
                                        //}                                                                                   
                                    }//if
                                }//for
                            }//if
                            #endregion
                            RecRoute[k].sceStr = RecRoute[k].sceStr.Substring(0, RecRoute[k].sceStr.Length - 1);
                            RecRoute[k].seqStr = RecRoute[k].seqStr.Substring(0, RecRoute[k].seqStr.Length - 1);
                            RecRoute[k].slalon = RecRoute[k].slalon.Substring(0, RecRoute[k].slalon.Length - 1);   //索引和引用不许引用字符串内的位置
                            RecRoute[k].timeSpans = RecRoute[k].timeSpans.Substring(0, RecRoute[k].timeSpans.Length - 1);
                            RecRoute[k].toNextTimes = RecRoute[k].toNextTimes.Substring(0, RecRoute[k].toNextTimes.Length - 1);
                        }//if
                        k++;
                    }//for 
                    #endregion
                }//if
            }//for

            //排序:根据线路类型计算出相似度
            int[] RoteTypeTemp1;
            String[] SceStrr;
            float Sim1, Sum11, Sum21, ComSum1;
            double PreCount;
            int sceType;
            for (int RouteCount = 0; RouteCount < k; RouteCount++)
            {
                RoteTypeTemp1 = new int[12] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
                SceStrr = RecRoute[RouteCount].sceStr.Split(',');     //下表超出
                for (int roulen = 0; roulen < SceStrr.Length; roulen++)
                {
                    ddt = _SceneryInfoBLL.GetSeqSlalonBySceName(SceStrr[roulen]);
                    sceType = int.Parse(ddt.Rows[0]["SceType"].ToString()); //DT 
                    RoteTypeTemp1[sceType - 1] = 1;
                }

                Sim1 = 0.0f;
                Sum11 = 0.0f;
                Sum21 = 0.0f;
                ComSum1 = 0.0f;
                for (int RTJ1 = 0; RTJ1 < 12; RTJ1++)
                {
                    if (PreVector[RTJ1] == 1)
                        Sum11++;
                    if (RoteTypeTemp1[RTJ1] == 1)
                        Sum21++;
                    if ((PreVector[RTJ1] == 1) && (RoteTypeTemp1[RTJ1] == 1))
                        ComSum1++;
                }
                PreCount = ComSum1 / Math.Sqrt(Sum11 * Sum21); //计算相似度
                RecRoute[RouteCount].rate = PreCount;
            }
            RecRoute.Sort(); //排序

            //求每一条线路的哈密顿通路
            #region
            
            #endregion




            //天数条件不满足时再增加景点


            //保存适游时间/到达下一景点时间
            String[] sceTimeSpan,sceToNextTime;
            for (int tT = 0; tT < k;tT++) {
                sceTimeSpan = RecRoute[tT].timeSpans.Split(',');
                sceToNextTime = RecRoute[tT].toNextTimes.Split(',');

                SceneryTime[tT] = new String[sceTimeSpan.Length];
                ToNextTime[tT]  = new String[sceTimeSpan.Length - 1];
                for (int tc = 0; tc < sceTimeSpan.Length; tc++)
                {
                    SceneryTime[tT][tc] = sceTimeSpan[tc];

                    if (tc == sceTimeSpan.Length - 1)
                        continue;
                    ToNextTime[tT][tc] = sceToNextTime[tc];               
                }
            } 

            //封装:   数据格式：景点,经度|纬度-......景点,经度|纬度*景点,经度|纬度
            String Routes = "";
            String[] ItemScenery, ItemSceSlalon;
            for (int rc = 0; rc < k; rc++)
            {
                ItemScenery = RecRoute[rc].sceStr.Split(',');
                ItemSceSlalon = RecRoute[rc].slalon.Split(',');
                for (int rouSceCount = 0; rouSceCount < ItemScenery.Length; rouSceCount++)
                {
                    Routes += ItemScenery[rouSceCount] + ",";
                    Routes += ItemSceSlalon[rouSceCount] + "-";
                }
                Routes = Routes.Substring(0, Routes.Length - 1);
                Routes += "*";
            }
            Routes = Routes.Substring(0, Routes.Length - 1);

            return Routes;
        }

        //从所有攻略中找出最想关的攻略名，最后返回路径
        public String[] RelatedStra(String[] SceNameList)
        {
            List<SceFre> FileList = new List<SceFre>();
            //String dir = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneTemPages\\Stragegy\\10492Strategy";
            String dir = "F:\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneFifPages\\Stragegy\\10492Strategy";
            DirectoryInfo StrDir = new DirectoryInfo(dir);
            FileSystemInfo[] Files = StrDir.GetFiles();
            for (int i = 0; i < Files.Length; i++)
            {   //统计一篇游记中出现若干关键字SceneNameList的次数，按次数排序
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

            FileList.Sort();//

            String[] txtPath = new string[10];
            for (int k = 0; k < 10; k++)
            {
                txtPath[k] = FileList[k].FileName;
            }
            return txtPath;
        }

        //以下5个方法用于产生推荐线路相关数据
        public String getFirRouteInfo()
        {
            String Result = "";
            if (RecommendRotes().Split('*').Length >= 1)
            {
                SceArr = RecommendRotes().Split('*')[0];
                DetailSceArr = SceArr.Split('-');
                String[] InfoList = new String[8 * DetailSceArr.Length - 1];
                for (int i = 0; i < DetailSceArr.Length; ++i)
                {
                    String Loc;
                    String url;
                    String SceName = DetailSceArr[i].Split(',')[0];
                    String Sla = DetailSceArr[i].Split(',')[1].Split('|')[1]; //经度
                    String SLon = DetailSceArr[i].Split(',')[1].Split('|')[0];//维度
                    string SceID;
                    BLL.Scenery.SceneryInfoBLL _SceneryInfoBLL = new BLL.Scenery.SceneryInfoBLL();
                    if (Sla == "" || SLon == "")
                        continue;
                    System.Data.DataTable DT = _SceneryInfoBLL.IsSceneryExist(float.Parse(Sla), float.Parse(SLon));
                    if (DT.Rows.Count > 0)
                    {

                        if (DT.Rows[0]["SceneryLoc"] != null)
                        {
                            Loc = DT.Rows[0]["SceneryLoc"].ToString();
                            SceID = GetPicUrlBySceID(int.Parse(DT.Rows[0]["SceneryID"].ToString()));
                            url = "Scenery.aspx?SceneryID=" + DT.Rows[0]["SceneryID"].ToString(); //跨页面传参
                            //依次为：景点名称 景点地址 详细跳转地址 经度 纬度 对应图片存储位置 适游时间 到下一景点时间
                            InfoList[8 * i] = SceName;
                            InfoList[8 * i + 1] = Loc;
                            InfoList[8 * i + 2] = url;
                            InfoList[8 * i + 3] = Sla;
                            InfoList[8 * i + 4] = SLon;
                            InfoList[8 * i + 5] = SceID;
                            InfoList[8 * i + 6] = SceneryTime[0][i];
                            if (i == DetailSceArr.Length - 1)
                                break;
                            InfoList[8 * i + 7] = ToNextTime[0][i];
                        }
                    }
                    //与推荐结果相关的游记图片PicUrlList
                    System.Data.DataTable PicDT = _PicInfoBLL.GetPicBySceID(int.Parse(DT.Rows[0]["SceneryID"].ToString()));
                    for (int PI = 0; PI < PicDT.Rows.Count; PI++)
                    {
                        String PicUrl = PicDT.Rows[PI]["PicPath"].ToString();
                        PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                        PicUrl = "../../../" + "Admin/" + PicUrl;
                        PicUrlList.Add(PicUrl);
                    }
                }
                //
                for (int k = 0; k < InfoList.Length; k++)
                {
                    Result += InfoList[k];
                    Result += "|";
                }
                Result = Result.Substring(0, Result.Length - 1);
            }
            return Result;
        }

        public String getSecRouteInfo()
        {
            String Result = "";
            if (RecommendRotes().Split('*').Length >= 2)
            {
                SceArr = RecommendRotes().Split('*')[1];
                DetailSceArr = SceArr.Split('-');
                String[] InfoList = new String[8 * DetailSceArr.Length - 1];
                for (int i = 0; i < DetailSceArr.Length; i++)
                {
                    String Loc;
                    String url;
                    String SceName = DetailSceArr[i].Split(',')[0];
                    String SLon = "";
                    String Sla = "";
                    if (DetailSceArr[i].Split(',').Length == 2 && DetailSceArr[i].Split(',')[1].Split('|').Length == 2)
                    {
                        SLon = DetailSceArr[i].Split(',')[1].Split('|')[0];//维度
                        Sla = DetailSceArr[i].Split(',')[1].Split('|')[1]; //经度
                    }

                    String SceID;
                    BLL.Scenery.SceneryInfoBLL _SceneryInfoBLL = new BLL.Scenery.SceneryInfoBLL();
                    if (Sla == "" || SLon == "")
                        continue;
                    System.Data.DataTable DT = _SceneryInfoBLL.IsSceneryExist(float.Parse(Sla), float.Parse(SLon));
                    if (DT.Rows.Count > 0)
                    {

                        if (DT.Rows[0]["SceneryLoc"] != null)
                        {
                            Loc = DT.Rows[0]["SceneryLoc"].ToString();
                            SceID = GetPicUrlBySceID(int.Parse(DT.Rows[0]["SceneryID"].ToString()));
                            url = "Scenery.aspx?SceneryID=" + DT.Rows[0]["SceneryID"].ToString(); //跨页面传参

                            InfoList[8 * i] = SceName;
                            InfoList[8 * i + 1] = Loc;
                            InfoList[8 * i + 2] = url;
                            InfoList[8 * i + 3] = Sla;
                            InfoList[8 * i + 4] = SLon;
                            InfoList[8 * i + 5] = SceID;
                            InfoList[8 * i + 6] = SceneryTime[1][i];
                            if (i == DetailSceArr.Length - 1)
                                break;
                            InfoList[8 * i + 7] = ToNextTime[1][i];
                        }
                        //与推荐结果相关的游记图片PicUrlList
                        System.Data.DataTable PicDT = _PicInfoBLL.GetPicBySceID(int.Parse(DT.Rows[0]["SceneryID"].ToString()));
                        for (int PI = 0; PI < PicDT.Rows.Count; PI++)
                        {
                            String PicUrl = PicDT.Rows[PI]["PicPath"].ToString();
                            PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                            PicUrl = "../../../" + "Admin/" + PicUrl;
                            PicUrlList.Add(PicUrl);
                        }
                    }
                }
                for (int k = 0; k < InfoList.Length; k++)
                {
                    Result += InfoList[k];
                    Result += "|";
                }
                Result = Result.Substring(0, Result.Length - 1);
            }
            return Result;
        }

        private void alert(bool p)
        {
            throw new NotImplementedException();
        }

        public String getThiRouteInfo()
        {
            String Result = "";
            if (RecommendRotes().Split('*').Length >= 3)
            {
                SceArr = RecommendRotes().Split('*')[2];
                DetailSceArr = SceArr.Split('-');
                String[] InfoList = new String[8 * DetailSceArr.Length - 1];
                for (int i = 0; i < DetailSceArr.Length; ++i)
                {
                    String Loc;
                    String url;
                    String SceName = DetailSceArr[i].Split(',')[0];
                    String Sla = DetailSceArr[i].Split(',')[1].Split('|')[1]; //经度
                    String SLon = DetailSceArr[i].Split(',')[1].Split('|')[0];//维度
                    String SceID;
                    BLL.Scenery.SceneryInfoBLL _SceneryInfoBLL = new BLL.Scenery.SceneryInfoBLL();
                    if (Sla == "" || SLon == "")
                        continue;
                    System.Data.DataTable DT = _SceneryInfoBLL.IsSceneryExist(float.Parse(Sla), float.Parse(SLon));
                    if (DT.Rows.Count > 0)
                    {

                        if (DT.Rows[0]["SceneryLoc"] != null)
                        {
                            Loc = DT.Rows[0]["SceneryLoc"].ToString();
                            SceID = GetPicUrlBySceID(int.Parse(DT.Rows[0]["SceneryID"].ToString()));
                            url = "Scenery.aspx?SceneryID=" + DT.Rows[0]["SceneryID"].ToString(); //跨页面传参

                            InfoList[8 * i] = SceName;
                            InfoList[8 * i + 1] = Loc;
                            InfoList[8 * i + 2] = url;
                            InfoList[8 * i + 3] = Sla;
                            InfoList[8 * i + 4] = SLon;
                            InfoList[8 * i + 5] = SceID;
                            InfoList[8 * i + 6] = SceneryTime[2][i];
                            if (i == DetailSceArr.Length - 1)
                                break;
                            InfoList[8 * i + 7] = ToNextTime[2][i];
                        }
                        //与推荐结果相关的游记图片PicUrlList
                        System.Data.DataTable PicDT = _PicInfoBLL.GetPicBySceID(int.Parse(DT.Rows[0]["SceneryID"].ToString()));
                        for (int PI = 0; PI < PicDT.Rows.Count; PI++)
                        {
                            String PicUrl = PicDT.Rows[PI]["PicPath"].ToString();
                            PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                            PicUrl = "../../../" + "Admin/" + PicUrl;
                            PicUrlList.Add(PicUrl);
                        }
                    }
                }
                for (int k = 0; k < InfoList.Length; k++)
                {
                    Result += InfoList[k];
                    Result += "|";
                }
                Result = Result.Substring(0, Result.Length - 1);
            }
            return Result;
        }

        public String getForRouteInfo()
        {
            String Result = "";
            if (RecommendRotes().Split('*').Length >= 4)
            {
                SceArr = RecommendRotes().Split('*')[3];
                DetailSceArr = SceArr.Split('-');
                String[] InfoList = new String[8 * DetailSceArr.Length - 1];
                for (int i = 0; i < DetailSceArr.Length; ++i)
                {
                    String Loc;
                    String url;
                    String SceName = DetailSceArr[i].Split(',')[0];
                    String Sla = DetailSceArr[i].Split(',')[1].Split('|')[1]; //经度
                    String SLon = DetailSceArr[i].Split(',')[1].Split('|')[0];//维度
                    String SceID;
                    BLL.Scenery.SceneryInfoBLL _SceneryInfoBLL = new BLL.Scenery.SceneryInfoBLL();
                    if (Sla == "" || SLon == "")
                        continue;
                    System.Data.DataTable DT = _SceneryInfoBLL.IsSceneryExist(float.Parse(Sla), float.Parse(SLon));
                    if (DT.Rows.Count > 0)
                    {

                        if (DT.Rows[0]["SceneryLoc"] != null)
                        {
                            Loc = DT.Rows[0]["SceneryLoc"].ToString();

                            SceID = GetPicUrlBySceID(int.Parse(DT.Rows[0]["SceneryID"].ToString()));
                            url = "Scenery.aspx?SceneryID=" + DT.Rows[0]["SceneryID"].ToString(); //跨页面传参

                            InfoList[8 * i] = SceName;
                            InfoList[8 * i + 1] = Loc;
                            InfoList[8 * i + 2] = url;
                            InfoList[8 * i + 3] = Sla;
                            InfoList[8 * i + 4] = SLon;
                            InfoList[8 * i + 5] = SceID;
                            InfoList[8 * i + 6] = SceneryTime[3][i];
                            if (i == DetailSceArr.Length - 1)
                                break;
                            InfoList[8 * i + 7] = ToNextTime[3][i];
                        }
                    }
                    //与推荐结果相关的游记图片PicUrlList
                    System.Data.DataTable PicDT = _PicInfoBLL.GetPicBySceID(int.Parse(DT.Rows[0]["SceneryID"].ToString()));
                    for (int PI = 0; PI < PicDT.Rows.Count; PI++)
                    {
                        String PicUrl = PicDT.Rows[PI]["PicPath"].ToString();
                        PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                        PicUrl = "../../../" + "Admin/" + PicUrl;
                        PicUrlList.Add(PicUrl);
                    }
                }
                for (int k = 0; k < InfoList.Length; k++)
                {
                    Result += InfoList[k];
                    Result += "|";
                }
                Result = Result.Substring(0, Result.Length - 1);
            }
            return Result;
        }

        public String getFifRouteInfo()
        {
            String Result = "";
            if (RecommendRotes().Split('*').Length >= 5)
            {
                SceArr = RecommendRotes().Split('*')[4];
                DetailSceArr = SceArr.Split('-');
                String[] InfoList = new String[8 * DetailSceArr.Length - 1];
                for (int i = 0; i < DetailSceArr.Length; ++i)
                {
                    String Loc;
                    String url;
                    String SceName = DetailSceArr[i].Split(',')[0];
                    String Sla = DetailSceArr[i].Split(',')[1].Split('|')[1]; //经度
                    String SLon = DetailSceArr[i].Split(',')[1].Split('|')[0];//维度
                    String SceID;
                    BLL.Scenery.SceneryInfoBLL _SceneryInfoBLL = new BLL.Scenery.SceneryInfoBLL();
                    if (Sla == "" || SLon == "")
                        continue;
                    System.Data.DataTable DT = _SceneryInfoBLL.IsSceneryExist(float.Parse(Sla), float.Parse(SLon));
                    if (DT.Rows.Count > 0)
                    {

                        if (DT.Rows[0]["SceneryLoc"] != null)
                        {
                            Loc = DT.Rows[0]["SceneryLoc"].ToString();

                            SceID = GetPicUrlBySceID(int.Parse(DT.Rows[0]["SceneryID"].ToString()));
                            url = "Scenery.aspx?SceneryID=" + DT.Rows[0]["SceneryID"].ToString(); //跨页面传参

                            InfoList[8 * i] = SceName;
                            InfoList[8 * i + 1] = Loc;
                            InfoList[8 * i + 2] = url;
                            InfoList[8 * i + 3] = Sla;
                            InfoList[8 * i + 4] = SLon;
                            InfoList[8 * i + 5] = SceID;
                            InfoList[8 * i + 6] = SceneryTime[4][i];
                            if (i == DetailSceArr.Length - 1)
                                break;
                            InfoList[8 * i + 7] = ToNextTime[4][i];
                        }
                    }
                    //与推荐结果相关的游记图片PicUrlList
                    System.Data.DataTable PicDT = _PicInfoBLL.GetPicBySceID(int.Parse(DT.Rows[0]["SceneryID"].ToString()));
                    for (int PI = 0; PI < PicDT.Rows.Count; PI++)
                    {
                        String PicUrl = PicDT.Rows[PI]["PicPath"].ToString();
                        PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                        PicUrl = "../../../" + "Admin/" + PicUrl;
                        PicUrlList.Add(PicUrl);
                    }
                }
                for (int k = 0; k < InfoList.Length; k++)
                {
                    Result += InfoList[k];
                    Result += "|";
                }
                Result = Result.Substring(0, Result.Length - 1);
            }
            return Result;
        }

        //根据SceneryID获得相应图片的存储路径
        public String GetPicUrlBySceID(int SceID)
        {
            String PicUrl = "";
            DataTable PicInfoDT = new System.Data.DataTable();
            PicInfoDT = _PicInfoBLL.GetPicBySceID(SceID);
            if (PicInfoDT.Rows.Count > 0)
            {
                if (PicInfoDT.Rows[0]["PicPath"] != null)
                {
                    PicUrl = PicInfoDT.Rows[0]["PicPath"].ToString();
                    PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));//数据库中格式../../../UpLoadPics/.jpg，从U开始截取，修改PicUrl
                    PicUrl = "../../" + "Admin/" + PicUrl; //  ../../../

                }
            }
            return PicUrl;
        }
        //根据路径获取内容
        public String GetTxt(String FP)
        {
            StreamReader SR = new StreamReader(FP, System.Text.Encoding.Default);
            String Content = SR.ReadToEnd();
            SR.Close();
            return Content;
        }
        //------------------------------------------------------------------------------------------------
        //-----------------------------以下方法为Aprioi的相关函数

        //由Apriori算法产生关联规则
        //参数：
        // --   Set为频繁项集的集合
        // --   cup为置信度
        // --   D为事务数据库
        public List<FreSets> AprioriRelatedRule(List<String> D, List<ItemSets> Set, float cup)
        {

            List<ItemSets> Sets = Set;
            List<FreSets> ResultSets = new List<FreSets>();
            for (int cd = 0; cd < Sets.Count; cd++)
            {
                int count = Sets[cd].sup;
                String[] SplitItem = Set[cd].items.Split(',');
                String temp;
                int tempCount;

                List<String> H = new List<string>();

                for (int ii = 0; ii < SplitItem.Length; ii++)
                {
                    temp = "";
                    tempCount = 0;
                    FreSets It = new FreSets();
                    for (int jj = 0; jj < SplitItem.Length; jj++)
                    {
                        if (jj != ii)
                        {
                            temp += SplitItem[jj];
                            temp += ",";

                        }
                    }
                    temp = temp.Substring(0, temp.Length - 1); //
                    tempCount = CountS(D, temp);
                    temp = temp + "-" + SplitItem[ii];
                    //关联规则存储形式：It.items:A-B,C,D  It.fre:置信度                  
                    It.items = temp;
                    It.fre = (double)count / (double)tempCount;
                    if (It.fre >= cup)
                    {
                        H.Add(SplitItem[ii]);
                        // ResultSets.Add(It);
                    }

                }
                List<FreSets> tmp = ApRelatedRule(D, Sets[cd], H, cup, 1);

                if (tmp != null && tmp.Count > 0)
                {
                    //ResultSets.AddRange(tmp); 
                    for (int sd = 0; sd < tmp.Count; sd++)
                        ResultSets.Add(tmp[sd]);
                }
            }//for      
            return ResultSets;
        }

        public List<FreSets> ApRelatedRule(List<String> D, ItemSets Item, List<String> H, float cup, int m)
        {

            List<FreSets> ResultSets = new List<FreSets>();
            List<FreSets> NextResultSets = new List<FreSets>();
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            DataTable dt;
            String[] sItem = Item.items.Split(',');
            int k = sItem.Length;
            List<String> RL = new List<String>();
            List<String> Hm = H;
            float conf = 0;

            if ((k > m + 1) && Hm.Count > 0)
            {
                RL = AprioriGen(Hm);  //生成二、三......项集
                for (int i = 0; i < RL.Count; i++)
                {
                    String tmpStr = "";
                    String seq = "";
                    String slalon = "";
                    String timeSpan = "";
                    FreSets ItemFreSets = new FreSets();
                    for (int j = 0; j < k; j++)
                    {
                        if (!RL[i].Contains(sItem[j]))
                        {
                            tmpStr += sItem[j];
                            tmpStr += ",";
                            dt = _SceneryInfoBLL.GetSeqSlalonBySceName(sItem[j]);
                            seq += dt.Rows[0]["SceneryID"];
                            seq += ",";
                            slalon += dt.Rows[0]["SLongitude"] + "|" + dt.Rows[0]["Slatitude"];
                            slalon += ",";
                            timeSpan += dt.Rows[0]["TimeSpan"];
                            timeSpan += ",";
                        }
                    }
                    tmpStr = tmpStr.Substring(0, tmpStr.Length - 1);
                    seq = seq.Substring(0, seq.Length - 1);
                    slalon = slalon.Substring(0, slalon.Length - 1);
                    timeSpan = timeSpan.Substring(0, timeSpan.Length - 1);
                    int tmpCount = CountS(D, tmpStr);
                    conf = (float)Item.sup / (float)tmpCount;

                    String tmpRightStr = "";
                    String tmpRightSeq = "";
                    String tmpRightSlaon = "";
                    String tmpRightTimeSpan = "";
                    if (conf > cup)
                    {
                        for (int sk = 0; sk < RL[i].Split(',').Length; sk++)
                        {
                            tmpRightStr += RL[i].Split(',')[sk].ToString();
                            tmpRightStr += ",";
                            dt = _SceneryInfoBLL.GetSeqSlalonBySceName(RL[i].Split(',')[sk]);
                            tmpRightSeq += dt.Rows[0]["SceneryID"];
                            tmpRightSeq += ",";
                            tmpRightSlaon += dt.Rows[0]["Slongitude"] + "|" + dt.Rows[0]["Slatitude"];
                            tmpRightSlaon += ",";
                            tmpRightTimeSpan += dt.Rows[0]["TimeSpan"];
                            tmpRightTimeSpan += ",";
                        }
                        tmpRightStr = tmpRightStr.Substring(0, tmpRightStr.Length - 1);
                        tmpRightSeq = tmpRightSeq.Substring(0, tmpRightSeq.Length - 1);
                        tmpRightSlaon = tmpRightSlaon.Substring(0, tmpRightSlaon.Length - 1);
                        tmpRightTimeSpan = tmpRightTimeSpan.Substring(0,tmpRightTimeSpan.Length - 1);
                        //
                        ItemFreSets.items = tmpStr + "-" + tmpRightStr;
                        ItemFreSets.fre = conf;
                        ItemFreSets.seq = seq + "-" + tmpRightSeq;
                        ItemFreSets.slalon = slalon + "-" + tmpRightSlaon;
                        ItemFreSets.timeSpan = timeSpan + "-" + tmpRightTimeSpan;   //
                        //+if
                        if (k == m + 2)
                        {   //只获取A->B，C，D这种格式的
                            ResultSets.Add(ItemFreSets);
                        }

                    }
                    else
                    {
                        RL.Remove(RL[i]);
                    }
                }//for

                NextResultSets = ApRelatedRule(D, Item, RL, cup, m + 1); //递归
                //ResultSets.AddRange(NextResultSets);
                if (NextResultSets != null && NextResultSets.Count > 0)
                {
                    for (int sd = 0; sd < NextResultSets.Count; sd++)
                        ResultSets.Add(NextResultSets[sd]);
                }

            }//if              
            return ResultSets;
        }

        public int CountS(List<String> D, String str)
        {
            int cou = 0;
            String[] ItemStr = str.Split(',');
            for (int i = 0; i < D.Count; i++)
            {
                bool flag = true;
                for (int j = 0; j < ItemStr.Length; j++)
                {
                    if (!D[i].ToString().Contains(ItemStr[j]))
                    {
                        flag = false;
                        break;
                    }
                }
                if (flag)
                    cou++;
            }
            return cou;
        }

        //用Apriori算法
        //参数：
        // --   D为事务数据库， 类型：List<String>，其中元素格式：项,项,项
        // --   I为1项集的集合，类型：List<String>，其中元素格式：项,项,项
        // --   sup为最小支持度(百分比)
        public List<ItemSets> Apriori(List<String> D, List<String> I, float sup)
        {
            List<ItemSets> L = new List<ItemSets>();//所有频繁项集

            do
            {
                int[] Icount = new int[I.Count];      //初始项集计数器,初始化为0
                List<ItemSets> LTemp = new List<ItemSets>();
                List<String> Ifrequent = new List<String>();
                // List<String> II = new List<string> ();
                //[计数]:对数据集中的每一个元素，判断其在所有项集是否存在，遍历完数据集，也就计算出了所有项集在数据集中计数
                Regex r = new Regex(",");
                for (int i = 0; i < D.Count; i++)
                {
                    string[] subD = r.Split(D[i].ToString());
                    for (int j = 0; j < I.Count; j++)
                    {
                        string[] subI = r.Split(I[j].ToString());
                        bool subImInsubD = true;
                        for (int m = 0; m < subI.Length && subImInsubD; m++)
                        {
                            if (!subD.Contains(subI[m]))
                                subImInsubD = false;
                        }
                        if (subImInsubD == true)
                            Icount[j]++;
                    }
                }//for
                //[筛选]：从初始项集中将支持度大于给定值的项转到L中
                int LengthD = D.Count;
                for (int ii = 0; ii < Icount.Length; ii++)
                {
                    if (Icount[ii] >= sup * LengthD)
                    {
                        Ifrequent.Add(I[ii]);//Ifrequest:新的频繁的集合
                        ItemSets iSet = new ItemSets();
                        iSet.Items = I[ii].ToString();
                        iSet.Sup = Icount[ii];
                        LTemp.Add(iSet); //记录所有的项集以及对应的支持度计数
                    }
                }
                I.Clear();
                I = AprioriGen(Ifrequent);

                if (LTemp.Count != 0)
                    L = LTemp;              //
            } while (I.Count != 0);

            return L;
        }

        // Apriori-gen:生成候选项集,包括连接，剪枝两个过程
        public List<String> AprioriGen(List<String> L)
        {
            List<String> Lk = new List<String>();
            Regex r = new Regex(",");
            for (int i = 0; i < L.Count && L.Count > 1; ++i)
            {
                string[] subL1 = r.Split(L[i].ToString());
                for (int j = i + 1; j < L.Count && L.Count > 1; j++)
                {
                    string[] subL2 = r.Split(L[j].ToString());
                    //[连接]
                    string temp = L[i].ToString();//存储两个项集的并集

                    bool subL1mInsubL2 = true;   //标识是否可以合并
                    for (int n = 0; n < subL2.Length - 1; n++)
                    {
                        if (subL1[n] != subL2[n])
                        {
                            subL1mInsubL2 = false;
                            break;
                        }
                    }
                    if (subL1mInsubL2)
                    {
                        if (subL1[subL2.Length - 1] != subL2[subL2.Length - 1])
                            temp = temp + "," + subL2[subL2.Length - 1];
                    }

                    //当temp长度为Length(L1)+1时，利用先验性质剪枝
                    //[剪枝]
                    string[] subTemp = r.Split(temp);
                    if (subTemp.Length == subL1.Length + 1)
                    {
                        bool isExists = false;//标识是否存在非频繁子集

                        for (int m = 0; m < subTemp.Length && !isExists; m++)
                        {
                            String str = "";  //存放k项集subTemp的k-1项子集
                            for (int n = 0; n < subTemp.Length; n++)
                            {
                                if (n != m)
                                {
                                    str += subTemp[n];
                                    str += ",";
                                }

                            }
                            str = str.Substring(0, str.Length - 1);
                            //if (!sl.Contains(str))
                            if (!L.Contains(str))
                                isExists = true;
                        }
                        if (!isExists)
                            Lk.Add(temp);
                    }
                }//for
            }//for
            return Lk;
        }

        // 获取数据，提供给Apriori算法
        // --   D为事务数据库， 类型：List<String>，其中元素格式：项，项，项
        // --   I为1项集的集合，类型：List<String>，其中元素格式：项，项，项
        public List<String> GetIFromDB(int CommentCountlimit)
        {
            List<String> all = new List<String>();
            String sceName;

            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            System.Data.DataTable dt = _SceneryInfoBLL.GetSceneryInfoByCmt(CommentCountlimit); //
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sceName = "";
                sceName = dt.Rows[i]["SceneryName"].ToString() + "";
                if (!all.Contains(sceName))
                    all.Add(sceName);
            }
            return all;
        }

        public List<String> GetDFromTxt()
        {
            List<String> arr = new List<String>();
            String RotesFP = "F:\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneFifPages\\Stragegy\\FilterRotes.txt";
            String Item;
            String Line;
            String[] ItemLine;
            StreamReader SR1 = new StreamReader(RotesFP);

            while ((Line = SR1.ReadLine()) != null)
            {
                if (Line != "")
                {
                    ItemLine = new String[Line.Split(' ').Length]; //+? -
                    ItemLine = Line.Split(' ');
                    Item = "";
                    for (int i = 0; i < ItemLine.Length; i++)
                    {
                        Item += ItemLine[i];
                        Item += ",";
                    }
                    Item = Item.Substring(0, Item.Length - 1).Trim();
                    arr.Add(Item);
                }
            }
            return arr;
        }

        //---------------------------------------------------------------
        // -------------------------搜索实现

        //从FilterRotes获取用户搜索“字典”


        public List<ItemSets> SearchAllSceName()
        {
            //ArrayList sce = new ArrayList();
            List<ItemSets> Sce = new List<ItemSets>();
            ItemSets ItemSce = new ItemSets();
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            System.Data.DataTable dt = _SceneryInfoBLL.GetAllScenery(); //
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ItemSce.items = dt.Rows[i]["SceneryName"].ToString();
                    ItemSce.sup = int.Parse(dt.Rows[i]["SceneryID"].ToString());
                    Sce.Add(ItemSce);
                }
            }
            return Sce;
        }

        //用于将用户输入DialogInfo写入到指定文件
        [WebMethod]
        public static int searchSlaSLon(String DialogInfo)
        {
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            String ClickSceName = DialogInfo;
            DataTable SceInfoDT;
            int SceID = -1;
            // ClickSceName = Request["textSearchName"].ToString();
            // ClickSceName = Request.Form.Get("textSearchName").ToString();

            if (ClickSceName != "")
            {

                if (ClickSceName == "象鼻山")
                    SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName("象山公园");
                else
                {
                    SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName(ClickSceName);
                }
                if (SceInfoDT.Rows.Count == 0)
                    SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName(ClickSceName.Substring(0, 2));
                if (SceInfoDT.Rows.Count == 0)
                    SceInfoDT = _SceneryInfoBLL.GetSlaSLonBySceName(ClickSceName.Substring(ClickSceName.Length - 2, 2));

                if (SceInfoDT.Rows.Count > 0)
                {
                    SceID = int.Parse(SceInfoDT.Rows[0]["SceneryID"].ToString());
                }
            }

            return SceID;
        }
           
    }
}
