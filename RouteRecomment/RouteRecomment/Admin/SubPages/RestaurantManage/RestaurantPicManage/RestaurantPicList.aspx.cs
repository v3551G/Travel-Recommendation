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
using BLL.CityBLL;
using BLL.AuthorityBLL;

namespace RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantPicManage
{
    public partial class RestaurantPicList : System.Web.UI.Page
    {
        public int CityID;
        public int RestaurantID;
        protected void Page_Load(object sender, EventArgs e)
        {                  
            //////判断权限
            bool IsSysAdmin = true;
            bool IsSceAdmin = true;

            if (null == Session["IsSYS"] || (Boolean)Session["IsSYS"] != true)
            {
                IsSysAdmin = false;
                IsSceAdmin = false;

                AdminInfoBLL _AdminInfoBLL = new AdminInfoBLL();
                RoleBLL _RoleBLL = new RoleBLL();
                int AdminID = int.Parse(Session["AdminID"].ToString());
                int RoleID = _RoleBLL.GetRoleIDByAdminID(AdminID);
                IsSceAdmin = _AdminInfoBLL.CheckFunction(RoleID, "餐馆管理");
            }

            if (!(IsSysAdmin || IsSceAdmin))
                Response.Redirect("../../NotAllowed.aspx");

            ////////////////
            if (!IsPostBack)
            {
                this.CityBind();
                CityID = int.Parse(this.DrpDownCity.SelectedValue.ToString());
                this.RestaurantBind(CityID);
                RestaurantID = int.Parse(this.DropDownRes.SelectedValue.ToString());
                if (Request.QueryString["RestaurantID"] !=null)
                {
                    RestaurantID = int.Parse(Request.QueryString["RestaurantID"].ToString());
                    RestaurantInfoBLL _ResInfoBLL = new RestaurantInfoBLL();
                    CityID = _ResInfoBLL.GetResCityByResID(RestaurantID);
                    this.DrpDownCity.SelectedValue = CityID.ToString();
                    this.DropDownRes.SelectedValue = RestaurantID.ToString();
                }
            }
            else
            {


            }
        }

        private void CityBind()
        {
            //绑定市
            CityInfoBLL _CityInfoBLL = new CityInfoBLL();
            DataTable CityDT = _CityInfoBLL.GetAllCityInfo();
            this.DrpDownCity.Items.Clear();
            this.DrpDownCity.DataSource = CityDT;
            this.DrpDownCity.DataTextField = "CityName";
            this.DrpDownCity.DataValueField = "CityID";
            this.DrpDownCity.DataBind();
        
        }

        private void RestaurantBind(int CityID)
        {
            RestaurantInfoBLL _ResBLL = new RestaurantInfoBLL();
            DataTable ResDT = _ResBLL.GetCityRes(CityID);

            this.DropDownRes.Items.Clear();
            this.DropDownRes.DataSource = ResDT;
            this.DropDownRes.DataTextField = "RestaurantName";
            this.DropDownRes.DataValueField = "RestaurantID";
            this.DropDownRes.DataBind();

            
        }

        protected void DrpDownCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            CityID = int.Parse(this.DrpDownCity.SelectedValue.ToString());
            this.CityBind();
            this.DrpDownCity.SelectedValue = CityID.ToString();
            this.RestaurantBind(CityID);
            RestaurantInfoBLL _ResInfoBLL = new RestaurantInfoBLL();
            if (_ResInfoBLL.GetCityRes(CityID).Rows.Count > 0)

                RestaurantID = int.Parse(this.DropDownRes.SelectedValue.ToString());
            else
                RestaurantID = 0;
        }

        protected void DropDownRes_SelectedIndexChanged(object sender, EventArgs e)
        {
            RestaurantID = int.Parse(this.DropDownRes.SelectedValue.ToString());
            RestaurantInfoBLL _ResInfoBLL = new RestaurantInfoBLL();
            CityID = _ResInfoBLL.GetResCityByResID(RestaurantID);
            this.DrpDownCity.SelectedValue = CityID.ToString();
        }
    }
}
