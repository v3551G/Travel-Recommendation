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
using BLL.MallInfoBLL;
using BLL.PicBLL;

namespace RouteRecomment.FrontPages.Pages
{
    public partial class Shopping : System.Web.UI.Page
    {
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

        private int MallID;
        protected void Page_Load(object sender, EventArgs e)
        {
            MallID = int.Parse(Request.QueryString["ShopID"].ToString());
            _MallInfoBLL = new MallInfoBLL();
            _PicInfoBLL = new PicInfoBLL();

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
            if(!IsPostBack )
            {
                DZhongDT = _MallInfoBLL.DaZhongMallCommentSplitPage(MallID,"大众点评",this.AspNetPager4.PageSize,1);
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
    }
}
