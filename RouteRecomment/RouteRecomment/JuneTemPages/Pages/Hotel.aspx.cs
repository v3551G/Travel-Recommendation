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
using BLL.HotelBLL;
using BLL.PicBLL;
using BLL.LogBLL;
using Model.Log;

namespace RouteRecomment.JuneTemPages.Pages
{
    public partial class Hotel : System.Web.UI.Page
    {
        public HotelInfoBLL HtlBLL;

        public String StarNum;
        public String PhoneNum;
        public String Address;
        public String Introduce;
        public String HotelService;
        public String RestaurantDevice;
        public String EnterDevice;
        public String Name;

        public DataTable YiLongDT = new DataTable();
        public DataTable TongChenDT = new DataTable();
        public DataTable XinXinDT = new DataTable();

        public String YiLongTotalRate;
        public DataTable HtlPicDT;

        public int HotelID = 11;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.ScriptManager1.EnablePageMethods = true;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["HotelID"] != null)
                HotelID = int.Parse(Request.QueryString["HotelID"].ToString());
            HtlBLL = new HotelInfoBLL();
            DataTable HotelDT = HtlBLL.GetHotelInfoByHtlID(HotelID);

            if (HotelDT.Rows.Count > 0)
            {
                if (HotelDT.Rows[0]["Star"] != null && HotelDT.Rows[0]["Star"].ToString() != "")
                {
                    StarNum = HotelDT.Rows[0]["Star"].ToString();
                }
                else
                    StarNum = "--";
            }
            else
                StarNum = "--";

            PhoneNum = HotelDT.Rows[0]["PhoneNum"].ToString();
            Address = HotelDT.Rows[0]["Locate"].ToString();
            Introduce = HotelDT.Rows[0]["HotelIntroduction"].ToString();
            HotelService = HotelDT.Rows[0]["HotelService"].ToString();
            RestaurantDevice = HotelDT.Rows[0]["RestaurantDevice"].ToString();
            EnterDevice = HotelDT.Rows[0]["IndoorService"].ToString();
            Name = HotelDT.Rows[0]["HotelName"].ToString();

            int HtlID = HotelID;
            DataTable TotalRateDT = HtlBLL.GetHotelTotalComment(HtlID, "艺龙");
            if (TotalRateDT.Rows.Count > 0)
            {
                if (TotalRateDT.Rows[0]["RecommendRate"] != null && TotalRateDT.Rows[0]["RecommendRate"].ToString() != "")
                    YiLongTotalRate = TotalRateDT.Rows[0]["RecommendRate"].ToString() + "%";
                else
                    YiLongTotalRate = "__";

            }
            else
                YiLongTotalRate = "__";

            this.AspNetPager4.RecordCount = HtlBLL.GetCommentCount(HtlID, "艺龙");
            this.AspNetPager1.RecordCount = HtlBLL.GetCommentCount(HtlID, "同程网");
            this.AspNetPager2.RecordCount = HtlBLL.GetCommentCount(HtlID, "欣欣网");

            PicInfoBLL _PicInfoBLL = new PicInfoBLL();
            //获取该酒店的图片信息
            HtlPicDT = _PicInfoBLL.GetPicByHtlID(HtlID);
            if (!IsPostBack)
            {
                YiLongDT = HtlBLL.GetHotelCommentSplit(HtlID, "艺龙", 1, this.AspNetPager4.PageSize);
                TongChenDT = HtlBLL.GetHotelCommentSplit(HtlID, "同程网", 1, this.AspNetPager1.PageSize);
                XinXinDT = HtlBLL.GetHotelCommentSplit(HtlID, "欣欣网", 1, this.AspNetPager2.PageSize);

                //记录用户的点击日志
                ClickLogBLL _ClickLogBLL = new ClickLogBLL();
                ClickLogInfo _ClickLogInfo = new ClickLogInfo();
                _ClickLogInfo.ClickTime = System.DateTime.Now;
                //_ClickLogInfo.ClickContent = 

            }
        }

        private bool YiBool = true;
        protected void YiLong_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                YiLongDT = HtlBLL.GetHotelCommentSplit(11, "艺龙", PageIndex, this.AspNetPager4.PageSize);
                TongChenDT = HtlBLL.GetHotelCommentSplit(11, "同程网", 1, this.AspNetPager1.PageSize);
                XinXinDT = HtlBLL.GetHotelCommentSplit(11, "欣欣网", 1, this.AspNetPager2.PageSize);
                this.AspNetPager1.CurrentPageIndex = 1;
                this.AspNetPager2.CurrentPageIndex = 1;
            }
            /* if (YiBool)
             {
                 this.AspNetPager1.CurrentPageIndex = 1;
                 this.AspNetPager2.CurrentPageIndex = 1;
             }*/

        }

        protected void TongChen_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                TongChenDT = HtlBLL.GetHotelCommentSplit(11, "同程网", PageIndex, this.AspNetPager1.PageSize);
                YiLongDT = HtlBLL.GetHotelCommentSplit(11, "艺龙", 1, this.AspNetPager4.PageSize);
                XinXinDT = HtlBLL.GetHotelCommentSplit(11, "欣欣网", 1, this.AspNetPager2.PageSize);
                this.AspNetPager4.CurrentPageIndex = 1;
                this.AspNetPager2.CurrentPageIndex = 1;
            }

            /*if (YiBool)
            {
                this.AspNetPager4.CurrentPageIndex = 1;
                this.AspNetPager2.CurrentPageIndex = 1;
            }*/
        }
        protected void XinXin_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                XinXinDT = HtlBLL.GetHotelCommentSplit(11, "欣欣网", PageIndex, this.AspNetPager2.PageSize);
                YiLongDT = HtlBLL.GetHotelCommentSplit(11, "艺龙", 1, this.AspNetPager4.PageSize);
                TongChenDT = HtlBLL.GetHotelCommentSplit(11, "同程网", 1, this.AspNetPager1.PageSize);
                this.AspNetPager4.CurrentPageIndex = 1;
                this.AspNetPager1.CurrentPageIndex = 1;
            }
            /*if(YiBool)
            {
           this.AspNetPager4.CurrentPageIndex = 1;
           this.AspNetPager1.CurrentPageIndex = 1;
           }*/
        }
    }
}
