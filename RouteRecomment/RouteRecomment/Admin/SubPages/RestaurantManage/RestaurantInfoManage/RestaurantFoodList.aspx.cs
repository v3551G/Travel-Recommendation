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

namespace RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantInfoManage
{
    public partial class RestaurantMenuList : System.Web.UI.Page
    {
        public String OPPTitle;
        public String RestaurantName;
        public int CityID;
        public int RestaurantID;
        public int PageStart;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["RestaurantName"] != null)
                {  
                   RestaurantName = Request.QueryString["RestaurantName"].ToString();
                   
                }
                OPPTitle = RestaurantName + "菜单管理";
                if (Request.QueryString["CityID"] != null)
                {
                    CityID = int.Parse(Request.QueryString["CityID"].ToString());

                }
                if (Request.QueryString["RestaurantID"] != null)
                {
                    RestaurantID = int.Parse(Request.QueryString["RestaurantID"].ToString());

                }
                if (Request.QueryString["PageStart"] != null)
                {
                    PageStart = int.Parse(Request.QueryString["PageStart"].ToString());

                }
            }

        }


    }
}
