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

namespace RouteRecomment.JuneThirdPages.Pages
{
    public partial class entertainment : System.Web.UI.Page
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

        private int EnterID;
        protected void Page_Load(object sender, EventArgs e)
        {
            _EntertainmentBLL = new EntertainmentBLL();
            _PicInfoBLL = new PicInfoBLL();
            EnterID = int.Parse(Request.QueryString["EnterID"].ToString());
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
    }
}
