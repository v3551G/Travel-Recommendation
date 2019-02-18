using System;
using System.Collections;
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
using System.Xml.Linq;
using BLL.MallInfoBLL;
using BLL.PicBLL;
using Model.Mall;

namespace RouteRecomment.JuneFifPages.Pages
{
    public partial class Shopping : System.Web.UI.Page
    {
        SqlConnection tr_conn;

        public MallInfoBLL _MallInfoBLL;
        public PicInfoBLL _PicInfoBLL;

        public string Local;
        public String PhoneNum;
        public String Introduction;
        public String OpenTime;
        public String MallName;

        public DataTable DZhongDT = new DataTable();
        public DataTable DZTotalRate = new DataTable();

        public DataTable AiBangDT = new DataTable();
        public DataTable ABTotalRate = new DataTable();

        public DataTable MallPicDT = new DataTable();
        //+
        public DataTable PublicComment;  //+用户点评
        public DataTable CmtUser;
        //public static int ShopID;
        public static bool flag = true;
        public int CurrentCmtValue; //当前用户的评分值
        public static  int MallID;

        public string login;
        public string person;
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
                person = "login2.aspx";
            }

            //MallID = int.Parse(Request.QueryString["ShopID"].ToString());
            _MallInfoBLL = new MallInfoBLL();
            _PicInfoBLL = new PicInfoBLL();

            if (Request.QueryString["ShopID"] != null)
            {
                MallID = int.Parse(Request.QueryString["ShopID"].ToString());  //接收跨页传过来的参数
                //flag = false;
            }
            PublicComment = _MallInfoBLL.GetUserCmtByShopID(MallID); //



            DataTable MallDT = _MallInfoBLL.GetMallInfoByID(MallID);
            Local = MallDT.Rows[0]["Local"].ToString();
            PhoneNum = MallDT.Rows[0]["PhoneNum"].ToString();
            Introduction = MallDT.Rows[0]["Introduction"].ToString();
            OpenTime = MallDT.Rows[0]["OpenTime"].ToString();
            MallName = MallDT.Rows[0]["MallName"].ToString();

            DZTotalRate = _MallInfoBLL.DaZhongMallTotalComment(MallID);
            ABTotalRate = _MallInfoBLL.AibangMallTotalComment(MallID);

            this.AspNetPager4.RecordCount = _MallInfoBLL.DaZhongMallCommentCount(MallID);
            this.AspNetPager1.RecordCount = _MallInfoBLL.GetAiBangCommentCount(MallID);

            MallPicDT = _PicInfoBLL.GetMallPic(MallID);
            if (!IsPostBack)
            {
                DZhongDT = _MallInfoBLL.DaZhongMallCommentSplitPage(MallID, "大众点评", this.AspNetPager4.PageSize, 1);
                AiBangDT = _MallInfoBLL.AiBangMallCommentSplitPage(MallID, "爱帮网", this.AspNetPager1.PageSize, 1);
            }
        }

        private bool YiBool = true;
        protected void DZhong_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                DZhongDT = _MallInfoBLL.DaZhongMallCommentSplitPage(MallID, "大众点评", this.AspNetPager4.PageSize, PageIndex);

                AiBangDT = _MallInfoBLL.AiBangMallCommentSplitPage(MallID, "爱帮网", this.AspNetPager1.PageSize, 1);
                this.AspNetPager1.CurrentPageIndex = 1;

            }

        }
        protected void AiBang_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                AiBangDT = _MallInfoBLL.AiBangMallCommentSplitPage(MallID, "爱帮网", this.AspNetPager1.PageSize, PageIndex);

                DZhongDT = _MallInfoBLL.DaZhongMallCommentSplitPage(MallID, "大众点评", this.AspNetPager4.PageSize, 1);
                this.AspNetPager4.CurrentPageIndex = 1;

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string str = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
            if (Session["UserAccount"] == null)
            {
                Response.Write("<Script labuage='javascript'>");
                Response.Write("<alert('请登录之后再发表评论！')>");
                Response.Write("</Script>");
                //Timer t = t.Tick();

                //
                return;
            }

            DataTable dt = _MallInfoBLL.GetUserIDByAccount(Convert.ToString(Session["UserAccount"].ToString()));
            CurrentCmtValue = int.Parse(CmtValue.Value);   // 获取评分值
            //获取UserSceneryComment对象数据          
            String CmtContent = Request.Form.GetValues("textarea")[0]; //获取表单中指定标签textarea的内容         
            //String CommentTime = DateTime.Today.ToString("yyyy-mm-dd");
            //ScenneryID在Page_Load方法中已获取
            int State = 1;
            int UserID = int.Parse(dt.Rows[0]["UserID"].ToString());

            //int CommentID,int UserID,string CommentContent,string CommentTime,int SceneryRate,int SceneryID,int State 
            UserMallComment _UserCmtObj; 
            _UserCmtObj = new UserMallComment(UserID, CmtContent, CurrentCmtValue, MallID, State); //只能调用构造函数来初始化，与java不同
            //_SIBLL.InsertToUserSceneryCmt(UserCmtObj); //将数据插入数据库         
            if (_MallInfoBLL.InsertToMallCmt(_UserCmtObj))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='Shopping.aspx';");
                Response.Write("</script>");
            }
        }
    }
}
