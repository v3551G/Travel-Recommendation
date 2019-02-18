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
using BLL.RestaurantBLL;
using BLL.PicBLL;

namespace RouteRecomment.JuneThirdPages.Pages
{
    public partial class food : System.Web.UI.Page
    {
        public RestaurantInfoBLL _ResInfoBLL;

        public String ResName;
        public String Address;
        public String PhoneNum;
        public String OpenTime;
        public String Introduce;

        public DataTable XieChenDT = new DataTable();
        public DataTable DaZhongDT = new DataTable();
        public DataTable AiBangDT = new DataTable();

        public DataTable XCTotalRate = new DataTable();
        public DataTable DZTotalRate = new DataTable();
        public DataTable ABTotalTate = new DataTable();

        public String YiLongTotalRate;
        public DataTable ResPicDT;
        public int ResID;

        public DataTable FoodWithPic;
        public DataTable FoodNoPic;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.ScriptManager1.EnablePageMethods = true;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            _ResInfoBLL = new RestaurantInfoBLL();
            ResID = int.Parse(Request.QueryString["ResID"]);
            DataTable ResDT = _ResInfoBLL.GetResInfo(ResID);
            Address = ResDT.Rows[0]["Local"].ToString();
            PhoneNum = ResDT.Rows[0]["PhoneNUm"].ToString();
            OpenTime = ResDT.Rows[0]["OpenTime"].ToString();
            Introduce = ResDT.Rows[0]["Introduction"].ToString();
            ResName = ResDT.Rows[0]["RestaurantName"].ToString();

            PicInfoBLL _PicInfoBLL = new PicInfoBLL();

            ResPicDT = _PicInfoBLL.GetResPicByID(ResID);



            this.AspNetPager4.RecordCount = _ResInfoBLL.GetCommentCount(ResID, "携程");
            XCTotalRate = _ResInfoBLL.GetXieChenTotalComment(ResID);
            this.AspNetPager1.RecordCount = _ResInfoBLL.GetCommentCount(ResID, "大众点评");
            DZTotalRate = _ResInfoBLL.GetDaZhongTotalComment(ResID);
            this.AspNetPager2.RecordCount = _ResInfoBLL.GetCommentCount(ResID, "爱帮网");
            ABTotalTate = _ResInfoBLL.GetAiBangTotalComment(ResID);

            FoodWithPic = _ResInfoBLL.GetFoodWithPic(ResID);
            FoodNoPic = _ResInfoBLL.GetFoodNoPic(ResID);


            if (!IsPostBack)
            {
                XieChenDT = _ResInfoBLL.ResCommentSplitPage(ResID, "携程", this.AspNetPager4.PageSize, 1);
                DaZhongDT = _ResInfoBLL.ResCommentSplitPage(ResID, "大众点评", this.AspNetPager1.PageSize, 1);
                AiBangDT = _ResInfoBLL.ResCommentSplitPage(ResID, "爱帮网", this.AspNetPager2.PageSize, 1);
            }
        }

        private bool YiBool = true;
        protected void XieChen_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {

            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                XieChenDT = _ResInfoBLL.ResCommentSplitPage(ResID, "携程", this.AspNetPager4.PageSize, PageIndex);

                DaZhongDT = _ResInfoBLL.ResCommentSplitPage(ResID, "大众点评", this.AspNetPager1.PageSize, 1);
                this.AspNetPager1.CurrentPageIndex = 1;

                AiBangDT = _ResInfoBLL.ResCommentSplitPage(ResID, "爱帮网", this.AspNetPager2.PageSize, 1);
                this.AspNetPager2.CurrentPageIndex = 1;
                // YiLongDT = HtlBLL.GetHotelCommentSplit(11, "艺龙", PageIndex, this.AspNetPager4.PageSize);
                //TongChenDT = HtlBLL.GetHotelCommentSplit(11, "同程网", 1, this.AspNetPager1.PageSize);
                //XinXinDT = HtlBLL.GetHotelCommentSplit(11, "欣欣网", 1, this.AspNetPager2.PageSize);
                //this.AspNetPager1.CurrentPageIndex = 1;
                //this.AspNetPager2.CurrentPageIndex = 1;
            }
        }

        protected void DaZhong_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                DaZhongDT = _ResInfoBLL.ResCommentSplitPage(ResID, "大众点评", this.AspNetPager1.PageSize, PageIndex);

                XieChenDT = _ResInfoBLL.ResCommentSplitPage(ResID, "携程", this.AspNetPager4.PageSize, 1);
                this.AspNetPager4.CurrentPageIndex = 1;

                AiBangDT = _ResInfoBLL.ResCommentSplitPage(ResID, "爱帮网", this.AspNetPager2.PageSize, 1);
                this.AspNetPager2.CurrentPageIndex = 1;

            }

        }

        protected void AiBang_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                AiBangDT = _ResInfoBLL.ResCommentSplitPage(ResID, "爱帮网", this.AspNetPager2.PageSize, PageIndex);

                XieChenDT = _ResInfoBLL.ResCommentSplitPage(ResID, "携程", this.AspNetPager4.PageSize, 1);
                this.AspNetPager4.CurrentPageIndex = 1;

                DaZhongDT = _ResInfoBLL.ResCommentSplitPage(ResID, "大众点评", this.AspNetPager1.PageSize, 1);
                this.AspNetPager1.CurrentPageIndex = 1;
                // TongChenDT = HtlBLL.GetHotelCommentSplit(11, "同程网", PageIndex, this.AspNetPager1.PageSize);
                // YiLongDT = HtlBLL.GetHotelCommentSplit(11, "艺龙", 1, this.AspNetPager4.PageSize);
                // XinXinDT = HtlBLL.GetHotelCommentSplit(11, "欣欣网", 1, this.AspNetPager2.PageSize);
                // this.AspNetPager4.CurrentPageIndex = 1;
                // this.AspNetPager2.CurrentPageIndex = 1;
            }
        }
    }
}
