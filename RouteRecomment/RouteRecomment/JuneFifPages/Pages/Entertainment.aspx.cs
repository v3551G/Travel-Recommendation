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
using BLL.EntertainmentBLL;
using BLL.PicBLL;
using Model.Entertainment;//

namespace RouteRecomment.JuneFifPages.Pages
{
    public partial class Entertainment : System.Web.UI.Page
    {
        public EntertainmentBLL _EntertainmentBLL;
        public PicInfoBLL _PicInfoBLL;

        public String PhoneNum;
        public String Local;
        public String Introduce;
        public String OpenTime;
        public String EntertainmentName;

        public DataTable DZTotalDT = new DataTable();
        public DataTable DaZhongDT = new DataTable();

        public DataTable ABTotalDT = new DataTable();
        public DataTable AiBangDT = new DataTable();

        public DataTable EnterPicDT = new DataTable();
        //+
        public DataTable PublicComment;  //+用户点评
        public static bool flag = true;
        public DataTable CmtUser;
        public int CurrentCmtValue; //当前用户的评分值
        private static int EnterID;

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

            _EntertainmentBLL = new EntertainmentBLL();
            _PicInfoBLL = new PicInfoBLL();
            //
            if (Request.QueryString["EnterID"] != null)
            {
                EnterID = int.Parse(Request.QueryString["EnterID"].ToString());  //接收跨页传过来的参数
                //flag = false;
            }

            PublicComment = _EntertainmentBLL.GetUserCmtByEnterID(EnterID); //

            //EnterID = int.Parse(Request.QueryString["EnterID"].ToString());
            DataTable EnterDT = _EntertainmentBLL.GetEnterInfoByID(EnterID);
            PhoneNum = EnterDT.Rows[0]["PhoneNum"].ToString();
            Local = EnterDT.Rows[0]["Local"].ToString();
            Introduce = EnterDT.Rows[0]["Introduction"].ToString();
            OpenTime = EnterDT.Rows[0]["OpenTime"].ToString();
            EntertainmentName = EnterDT.Rows[0]["EntertainmentName"].ToString();

            DZTotalDT = _EntertainmentBLL.DaZhongEnterTotalAssesment(EnterID);
            ABTotalDT = _EntertainmentBLL.AiBangEnterttTotalAssessment(EnterID);

            this.AspNetPager4.RecordCount = _EntertainmentBLL.GetDaZhongCommentCount(EnterID);
            this.AspNetPager2.RecordCount = _EntertainmentBLL.GetAiBangCommentCount(EnterID);
            EnterPicDT = _PicInfoBLL.GetEnterPicByEnterID(EnterID);

            if (!IsPostBack)
            {
                DaZhongDT = _EntertainmentBLL.DaZhongEnterCommentSplit(EnterID, "大众点评", this.AspNetPager4.PageSize, 1);
                AiBangDT = _EntertainmentBLL.AiBangEnterCommentSplit(EnterID, "爱帮网", this.AspNetPager2.PageSize, 1);
            }
        }


        private bool YiBool = true;
        protected void DaZhong_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                DaZhongDT = _EntertainmentBLL.DaZhongEnterCommentSplit(EnterID, "大众点评", this.AspNetPager4.PageSize, PageIndex);
                AiBangDT = _EntertainmentBLL.AiBangEnterCommentSplit(EnterID, "爱帮网", this.AspNetPager2.PageSize, 1);
                this.AspNetPager2.CurrentPageIndex = 1;

            }


        }

        protected void AiBang_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                AiBangDT = _EntertainmentBLL.AiBangEnterCommentSplit(EnterID, "爱帮网", this.AspNetPager2.PageSize, PageIndex);

                DaZhongDT = _EntertainmentBLL.DaZhongEnterCommentSplit(EnterID, "大众点评", this.AspNetPager4.PageSize, 1);
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

            DataTable dt = _EntertainmentBLL.GetUserIDByAccount(Convert.ToString(Session["UserAccount"].ToString()));
            CurrentCmtValue = int.Parse(CmtValue.Value);   // 获取评分值
            //获取UserSceneryComment对象数据          
            String CmtContent = Request.Form.GetValues("textarea")[0]; //获取表单中指定标签textarea的内容         
            //String CommentTime = DateTime.Today.ToString("yyyy-mm-dd");
            //ScenneryID在Page_Load方法中已获取
            int State = 1;
            int UserID = int.Parse(dt.Rows[0]["UserID"].ToString());

            //int CommentID,int UserID,string CommentContent,string CommentTime,int SceneryRate,int SceneryID,int State 
            EntertainmentComment _UserCmtObj;
            _UserCmtObj = new EntertainmentComment(UserID, CmtContent, CurrentCmtValue, EnterID, State); //只能调用构造函数来初始化，与java不同
            //_SIBLL.InsertToUserSceneryCmt(UserCmtObj); //将数据插入数据库         
            if (_EntertainmentBLL.InsertToEntertainCmt(_UserCmtObj))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='Entertainment.aspx';");
                Response.Write("</script>");
            }
        }
    }
}
