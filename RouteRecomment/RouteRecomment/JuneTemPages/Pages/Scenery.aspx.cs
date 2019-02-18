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
using BLL.Scenery;
using BLL.PicBLL;
using BLL.OtherStraSplit;
using BLL.LogBLL;
using Model.Log;

namespace RouteRecomment.JuneTemPages.Pages
{
    public partial class Scenery : System.Web.UI.Page
    {
        public SceneryInfoBLL _SIBLL;
        public PicInfoBLL _PIBLL;
        public OtherStraBLL _OtherStraBLL;

        public String Name;
        public String Loc;
        public String OpenTime;
        public String Introduce;
        public String Price;

        public DataTable SceneryPic;

        public DataTable TCTotalScore;
        public DataTable LMMTotalScore;

        public DataTable TongChenDT;
        public DataTable CommentScore;

        public DataTable LvMaMaDT;
        public DataTable LvMaMaCommentScore;

        private int SceneryID;

        //同程总体评分
        public String _TongChenRecommentRate = "--";
        public String _TongChenSatisfaction = "--";
        public String _TongChenXingJiaBi = "--";
        public String _TongChenService = "--";
        public String _TongChenConvenient = "--";
        //驴妈妈总体评分
        public String _LvMaMaTotalScore = "5";
        public String _LvMaMaPopurity = "5";
        public String _LvMaMaScale = "5";
        public String _LvMaMaSightSeeing = "5";
        public String _LvMaMaService = "5";

        //攻略分页
        public DataTable MaFengWoStrSplit;
        public DataTable TongChenStrSplit;
        public DataTable XinXinStrSplit;
        public DataTable XieChenStrSplit;
        protected void Page_Load(object sender, EventArgs e)
        {
            _SIBLL = new SceneryInfoBLL();
            _PIBLL = new PicInfoBLL();
            _OtherStraBLL = new OtherStraBLL();

            SceneryID = int.Parse(Request.QueryString["SceneryID"].ToString());

            DataTable SInfoDT = _SIBLL.GetSceneryInfoByID(SceneryID);
            Name = SInfoDT.Rows[0]["SceneryName"].ToString();
            Loc = SInfoDT.Rows[0]["SceneryLoc"].ToString();
            OpenTime = SInfoDT.Rows[0]["OpenTime"].ToString();
            Introduce = SInfoDT.Rows[0]["SceneryIntro"].ToString();
            if ((SInfoDT.Rows[0]["SceneryPrice"].ToString() == "") || (SInfoDT.Rows[0]["SceneryPrice"].ToString() == "0"))
                Price = "--";

            this.AspNetPager4.RecordCount = _SIBLL.GetCommentCount(SceneryID, "同程网");
            this.AspNetPager1.RecordCount = _SIBLL.GetCommentCount(SceneryID, "驴妈妈");

           
            this.AspNetPager3.RecordCount = _OtherStraBLL.GetStrCountByNameSceID("马蜂窝", SceneryID);
            this.AspNetPager2.RecordCount = _OtherStraBLL.GetStrCountByNameSceID("同程网", SceneryID);
            this.AspNetPager5.RecordCount = _OtherStraBLL.GetStrCountByNameSceID("携程", SceneryID);
            this.AspNetPager6.RecordCount = _OtherStraBLL.GetStrCountByNameSceID("欣欣网", SceneryID);
            SceneryPic = _PIBLL.GetPicBySceID(SceneryID);

            TCTotalScore = _SIBLL.GetTonChenTotalComment(SceneryID);
            LvMaMaCommentScore = _SIBLL.GetLvMaMaTotalComment(SceneryID);
            if (LvMaMaCommentScore.Rows.Count > 0)
            {
                if (LvMaMaCommentScore.Rows[0]["TotalScore"] != null)
                    if (LvMaMaCommentScore.Rows[0]["Popurity"].ToString() != "")
                    _LvMaMaTotalScore = LvMaMaCommentScore.Rows[0]["TotalGradeID"].ToString();

                if (LvMaMaCommentScore.Rows[0]["Popurity"] != null)
                    if (LvMaMaCommentScore.Rows[0]["Popurity"].ToString() != "")
                        _LvMaMaPopurity = LvMaMaCommentScore.Rows[0]["Popurity"].ToString();

                if (LvMaMaCommentScore.Rows[0]["Scale"] != null)
                    if (LvMaMaCommentScore.Rows[0]["Scale"].ToString() != "")
                        _LvMaMaScale = LvMaMaCommentScore.Rows[0]["Scale"].ToString();

                if (LvMaMaCommentScore.Rows[0]["SightSeeing"] != null)
                    if (LvMaMaCommentScore.Rows[0]["SightSeeing"].ToString() != "")
                        _LvMaMaSightSeeing = LvMaMaCommentScore.Rows[0]["SightSeeing"].ToString();

                if (LvMaMaCommentScore.Rows[0]["Service"] != null)
                    if (LvMaMaCommentScore.Rows[0]["Service"].ToString() != "")
                        _LvMaMaService = LvMaMaCommentScore.Rows[0]["Service"].ToString();
            }
           
            if (!IsPostBack)
            {
                TongChenDT = _SIBLL.GetTonChenCommentSplit(SceneryID, "同程网", 1, this.AspNetPager4.PageSize);
                LvMaMaDT = _SIBLL.GetLvMaMaCommentSplit(SceneryID, "驴妈妈", 1, this.AspNetPager1.PageSize);

                MaFengWoStrSplit = _OtherStraBLL.GetStraSplit(SceneryID,"马蜂窝", this.AspNetPager3.PageSize, 1);
                TongChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "同程网", this.AspNetPager2.PageSize, 1);
                XieChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "携程", this.AspNetPager5.PageSize, 1);
                XinXinStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "欣欣网", this.AspNetPager6.PageSize, 1);

                //添加点击日志
                ClickLogBLL _ClickLogBLL = new ClickLogBLL();
                ClickLogInfo _ClickLogInfo = new ClickLogInfo();

                _ClickLogInfo.ClickContent = Name;
                _ClickLogInfo.ClickTime = DateTime.Now;
                _ClickLogInfo.ContentFlag = SceneryID;
                _ClickLogInfo.ContentType = "景点";
                _ClickLogInfo.IP = GetUserIP();
                _ClickLogBLL.AddClickLog(_ClickLogInfo);

            }
        }

        private bool YiBool = true;
        protected void TongChen_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                TongChenDT = _SIBLL.GetTonChenCommentSplit(SceneryID, "同程网", PageIndex, this.AspNetPager4.PageSize);

                LvMaMaDT = _SIBLL.GetLvMaMaCommentSplit(SceneryID, "驴妈妈", 1, this.AspNetPager1.PageSize);
                this.AspNetPager1.CurrentPageIndex = 1;

                MaFengWoStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "马蜂窝", this.AspNetPager3.PageSize, 1);
                this.AspNetPager3.CurrentPageIndex = 1;
                TongChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "同程网", this.AspNetPager2.PageSize, 1);
                this.AspNetPager2.CurrentPageIndex = 1;
                XieChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "携程", this.AspNetPager5.PageSize, 1);
                this.AspNetPager5.CurrentPageIndex = 1;
                XinXinStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "欣欣网", this.AspNetPager6.PageSize, 1);

                this.AspNetPager6.CurrentPageIndex = 1;

            }


        }
        protected void LvMaMa_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                LvMaMaDT = _SIBLL.GetLvMaMaCommentSplit(SceneryID, "驴妈妈", PageIndex, this.AspNetPager1.PageSize);

                TongChenDT = _SIBLL.GetTonChenCommentSplit(SceneryID, "同程网", 1, this.AspNetPager4.PageSize);
                this.AspNetPager4.CurrentPageIndex = 1;


                MaFengWoStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "马蜂窝", this.AspNetPager3.PageSize, 1);
                this.AspNetPager3.CurrentPageIndex = 1;

                TongChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "同程网", this.AspNetPager2.PageSize, 1);
                this.AspNetPager2.CurrentPageIndex = 1;
                XieChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "携程", this.AspNetPager5.PageSize, 1);
                this.AspNetPager5.CurrentPageIndex = 1;
                XinXinStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "欣欣网", this.AspNetPager6.PageSize, 1);
                this.AspNetPager6.CurrentPageIndex = 1;

            }


        }

        protected void MaFengWoStr_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                MaFengWoStrSplit = _OtherStraBLL.GetStraSplit(SceneryID,"马蜂窝", this.AspNetPager3.PageSize, PageIndex);

                LvMaMaDT = _SIBLL.GetLvMaMaCommentSplit(SceneryID, "驴妈妈", 1, this.AspNetPager1.PageSize);
                this.AspNetPager1.CurrentPageIndex = 1;

                TongChenDT = _SIBLL.GetTonChenCommentSplit(SceneryID, "同程网", 1, this.AspNetPager4.PageSize);
                this.AspNetPager4.CurrentPageIndex = 1;

                TongChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "同程网", this.AspNetPager2.PageSize, 1);
                this.AspNetPager2.CurrentPageIndex = 1;
                XieChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "携程", this.AspNetPager5.PageSize, 1);
                this.AspNetPager5.CurrentPageIndex = 1;
                XinXinStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "欣欣网", this.AspNetPager6.PageSize, 1);
                this.AspNetPager6.CurrentPageIndex = 1;

            }
        }

        protected void TongChenStr_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                TongChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID,"同程网", this.AspNetPager2.PageSize, PageIndex);


                MaFengWoStrSplit = _OtherStraBLL.GetStraSplit(SceneryID,"马蜂窝", this.AspNetPager3.PageSize, 1);
                this.AspNetPager3.CurrentPageIndex = 1;

                LvMaMaDT = _SIBLL.GetLvMaMaCommentSplit(SceneryID, "驴妈妈", 1, this.AspNetPager1.PageSize);
                this.AspNetPager1.CurrentPageIndex = 1;

                TongChenDT = _SIBLL.GetTonChenCommentSplit(SceneryID, "同程网", 1, this.AspNetPager4.PageSize);
                this.AspNetPager4.CurrentPageIndex = 1;
                XieChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "携程", this.AspNetPager5.PageSize, 1);
                this.AspNetPager5.CurrentPageIndex = 1;
                XinXinStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "欣欣网", this.AspNetPager6.PageSize, 1);
                this.AspNetPager6.CurrentPageIndex = 1;


            }
        }


        protected void XieChenStr_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                XieChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "携程", this.AspNetPager5.PageSize, PageIndex);

                TongChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "同程网", this.AspNetPager2.PageSize, 1);
                this.AspNetPager2.CurrentPageIndex = 1;


                MaFengWoStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "马蜂窝", this.AspNetPager3.PageSize, 1);
                this.AspNetPager3.CurrentPageIndex = 1;

                LvMaMaDT = _SIBLL.GetLvMaMaCommentSplit(SceneryID, "驴妈妈", 1, this.AspNetPager1.PageSize);
                this.AspNetPager1.CurrentPageIndex = 1;

                TongChenDT = _SIBLL.GetTonChenCommentSplit(SceneryID, "同程网", 1, this.AspNetPager4.PageSize);
                this.AspNetPager4.CurrentPageIndex = 1;
                XinXinStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "欣欣网", this.AspNetPager6.PageSize, 1);
                this.AspNetPager6.CurrentPageIndex = 1;




            }
        }
        protected void XinXinStr_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                XinXinStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "欣欣网", this.AspNetPager6.PageSize, PageIndex);


                TongChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "同程网", this.AspNetPager2.PageSize, 1);
                this.AspNetPager2.CurrentPageIndex = 1;


                MaFengWoStrSplit = _OtherStraBLL.GetStraSplit(SceneryID, "马蜂窝", this.AspNetPager3.PageSize, 1);
                this.AspNetPager3.CurrentPageIndex = 1;

                LvMaMaDT = _SIBLL.GetLvMaMaCommentSplit(SceneryID, "驴妈妈", 1, this.AspNetPager1.PageSize);
                this.AspNetPager1.CurrentPageIndex = 1;

                TongChenDT = _SIBLL.GetTonChenCommentSplit(SceneryID, "同程网", 1, this.AspNetPager4.PageSize);
                this.AspNetPager4.CurrentPageIndex = 1;

                XieChenStrSplit = _OtherStraBLL.GetStraSplit(SceneryID,"携程", this.AspNetPager5.PageSize, 1);
                this.AspNetPager6.CurrentPageIndex = 1;




            }
        }

        //获取用户IP
        public String GetUserIP()
        {
            //string loginIP = Request.UserHostAddress;
            string loginIP = Page.Request.UserHostAddress;

            return loginIP;
        }

        //添加拖拽功能
        // DragContent
        [WebMethod]
        public static void AddDragLog(String DragContent)
        {
            if (DragContent == "")
                return;
            DragLogBLL _DragLogBLL = new DragLogBLL();
            DragLogInfo _DragLogInfo = new DragLogInfo();

            _DragLogInfo.DateTime = DateTime.Now;
            _DragLogInfo.DragContent = DragContent;
            _DragLogInfo.IP = "127.0.0.1";



            _DragLogBLL.AddDragLog(_DragLogInfo);
            return;
        }
    }
}
