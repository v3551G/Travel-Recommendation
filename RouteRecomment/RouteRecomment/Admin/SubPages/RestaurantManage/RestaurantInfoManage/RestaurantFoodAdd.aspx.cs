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
using Model.Restaurant;
using BLL.RestaurantBLL;

namespace RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantInfoManage
{
    public partial class RestaurantFoodAdd : System.Web.UI.Page
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

        protected void btEdit_Click(object sender, EventArgs e)
        {
            RestaurantName = Request.QueryString["RestaurantName"].ToString();
            CityID = int.Parse(Request.QueryString["CityID"].ToString());
            PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
            RestaurantID = int.Parse(Request.QueryString["RestaurantID"].ToString());

            RestaurantInfoBLL _ResInfoBLL = new RestaurantInfoBLL();
            RestaurantFoodInfo _ResFoodInfo = new RestaurantFoodInfo();

            _ResFoodInfo.FoodName = this.txtFoodName.Text.Trim();
            if (this.txtFoodPrice.Text.Trim() != "")
                _ResFoodInfo.FoodPrice = float.Parse(this.txtFoodPrice.Text.Trim());
            else
                _ResFoodInfo.FoodPrice = 0.0f;
            _ResFoodInfo.RestaurantID = RestaurantID;

            if (_ResInfoBLL.AddResFood(_ResFoodInfo))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='RestaurantFoodList.aspx?&CityID=" + CityID.ToString() + "&RestaurantID=" + RestaurantID.ToString() + "&PageStart=" + PageStart.ToString() + "&RestaurantName=" + RestaurantName + "';");
                Response.Write("</script>");


            }
        }
    }
}
