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
using System.Web.Services;
using BLL.LogBLL;
using Model.Log;

namespace RouteRecomment.FrontPages.Test.Pages
{
    public partial class Hotel : System.Web.UI.Page
    {
        public HotelInfoBLL HtlBLL;
        public HtlTypeBLL HtlTypeBLL;
        public HtlTypeDetailBLL HtlTypeDetailBLL;

        public int StarNum;
        public String PhoneNum;
        public String Address;
        public String Introduce;
        public String HotelService;
        public String RestaurantDevice;
        public String EnterDevice;

        public DataTable YiLongDT = new DataTable();
        public DataTable TongChenDT = new DataTable();
        public DataTable XinXinDT = new DataTable();

        public String YiLongTotalRate;
        public DataTable HtlPicDT;
        public int HtlID;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.ScriptManager1.EnablePageMethods = true;
        
        }
        protected void Page_Load(object sender, EventArgs e)
        {   

            HtlBLL = new HotelInfoBLL();
            HtlTypeBLL = new HtlTypeBLL();
            HtlTypeDetailBLL = new HtlTypeDetailBLL();
            HtlID = int.Parse(Request.QueryString["HotelID"].ToString());
            DataTable HotelDT = HtlBLL.GetHotelInfoByHtlID(11);

            StarNum = int.Parse(HotelDT.Rows[0]["Star"].ToString());
            PhoneNum = HotelDT.Rows[0]["PhoneNum"].ToString();
            Address = HotelDT.Rows[0]["Locate"].ToString();
            Introduce = HotelDT.Rows[0]["HotelIntroduction"].ToString();
            HotelService = HotelDT.Rows[0]["HotelService"].ToString();
            RestaurantDevice = HotelDT.Rows[0]["RestaurantDevice"].ToString();
            EnterDevice = HotelDT.Rows[0]["IndoorService"].ToString();

            
            DataTable TotalRateDT = HtlBLL.GetHotelTotalComment(HtlID,"艺龙");
            YiLongTotalRate = TotalRateDT.Rows[0]["RecommendRate"].ToString()+"%";

            this.AspNetPager4.RecordCount = HtlBLL.GetCommentCount(HtlID, "艺龙");
            this.AspNetPager1.RecordCount = HtlBLL.GetCommentCount(HtlID,"同程网");
            this.AspNetPager2.RecordCount = HtlBLL.GetCommentCount(HtlID,"欣欣网");

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

        [WebMethod]
        public static void AddViewLog(String time,String ip)
        {
            ViewLogBLL _ViewLogBLL = new ViewLogBLL();
            ViewLogInfo _ViewLogInfo = new ViewLogInfo();

            float Time =(float)(int.Parse(time)/60000.0) ;//转换成分钟

            _ViewLogInfo.IP = ip;
            _ViewLogInfo.TimeSpan = Time;
            _ViewLogInfo.ViewContent = "***大酒店";
            _ViewLogInfo.ViewTime = System.DateTime.Now;

            _ViewLogBLL.AddViewLog(_ViewLogInfo);
            
          
         
        }

        public String GetIP()
        {
            String ip;
            if (Context.Request.ServerVariables["HTTP_VIA"] != null) // 服务器， using proxy 
            {
                //得到真实的客户端地址
                ip = Context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();  // Return real client IP. 
            }
            else//如果没有使用代理服务器或者得不到客户端的ip  not using proxy or can't get the Client IP 
            {

                //得到服务端的地址 
                ip = Context.Request.ServerVariables["REMOTE_ADDR"].ToString(); //While it can't get the Client IP, it will return proxy IP. 
            }
            return ip;
        }

        //用户拖选日志的添加

        [WebMethod]
        public static void DragLogAdd(String ip,String SelectText)
        {   
            if(SelectText=="")
                return ;
            DragLogInfo _DragLogInfo = new DragLogInfo();
            DragLogBLL _DragLogBLL = new DragLogBLL();
            _DragLogInfo.DateTime = System.DateTime.Now;
            _DragLogInfo.DragContent = SelectText;
            _DragLogInfo.IP = ip;

            _DragLogBLL.AddDragLog(_DragLogInfo);
        }


        public string Test()
        {
            return "TestSuccess";
        }
  
    }
}
