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

namespace RouteRecomment.Admin.SubPages.HotelManage
{
    public partial class HotelSubRmTypeList : System.Web.UI.Page
    {
        public String OptTitle;
        public String HotelName;
        public int HotelID;
        public int CityID;
        public int PageStart;
        public int HtlTypeID;
        public String HtlTypeName;
 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HtlTypeID = int.Parse(Request.QueryString["HtlTypeID"].ToString());
                HtlTypeName = Request.QueryString["HtlTypeName"].ToString();
                this.HotelName = Request.QueryString["HotelName"].ToString();
                this.HotelID = int.Parse(Request.QueryString["HotelID"].ToString());
                this.CityID = int.Parse(Request.QueryString["CityID"].ToString());
                this.PageStart = int.Parse(Request.QueryString["PageStart"].ToString());

                OptTitle = Request.QueryString["HotelName"].ToString()+"  "+HtlTypeName + "子房型管理";

            }
        }

    }
}
