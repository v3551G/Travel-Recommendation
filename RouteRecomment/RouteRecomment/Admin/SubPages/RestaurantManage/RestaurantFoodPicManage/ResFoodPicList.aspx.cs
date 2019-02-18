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

namespace RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantFoodPicManage
{
    public partial class ResFoodPicList : System.Web.UI.Page
    {
        public int CityID;
        public int RestaurantID;
        public int FoodID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {                  //////判断权限
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
                this.CityBind();
                CityID = int.Parse(this.DrpDownCity.SelectedValue.ToString());
                this.RestaurantBind(CityID);
                if (this.DropDownRes.SelectedValue != "")
                {
                    RestaurantID = int.Parse(this.DropDownRes.SelectedValue.ToString());
                    this.FoodBind(RestaurantID);
                    if (this.DrpDownFood.SelectedValue != "")
                        FoodID = int.Parse(this.DrpDownFood.SelectedValue.ToString());
                }

                if (Request.QueryString["CityID"] != "" && Request.QueryString["CityID"] != null)
                {
                    CityID = int.Parse(Request.QueryString["CityID"].ToString());
                    this.DrpDownCity.SelectedValue = CityID.ToString();
                    this.RestaurantBind(CityID);
                    if (Request.QueryString["RestaurantID"] != "" && Request.QueryString["RestaurantID"] != null)
                    {
                        RestaurantID = int.Parse(Request.QueryString["RestaurantID"].ToString());                
                        this.FoodBind(RestaurantID);
                        this.DropDownRes.SelectedValue = RestaurantID.ToString();
                        if (Request.QueryString["FoodID"] != "" && Request.QueryString["FoodID"] != null)
                        {
                            FoodID = int.Parse(Request.QueryString["FoodID"].ToString());
                            this.DrpDownFood.SelectedValue = FoodID.ToString();
                        }
                    }

                }
                
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

        private void FoodBind(int RestaurantID)
        {
            RestaurantInfoBLL _ResBLL = new RestaurantInfoBLL();
            DataTable DT = _ResBLL.GetResFood(RestaurantID);
            this.DrpDownFood.Items.Clear();
            this.DrpDownFood.DataSource = DT;
            this.DrpDownFood.DataTextField = "FoodName";
            this.DrpDownFood.DataValueField = "FoodID";
            this.DrpDownFood.DataBind();
        }

        protected void DrpDownCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            CityID = int.Parse(this.DrpDownCity.SelectedValue.ToString());
            this.DrpDownCity.SelectedValue = CityID.ToString();
            this.RestaurantBind(CityID);
            if (this.DropDownRes.SelectedValue != "")
            {
                RestaurantID = int.Parse(this.DropDownRes.SelectedValue.ToString());
                this.FoodBind(RestaurantID);
                if (this.DrpDownFood.SelectedValue != "")
                    FoodID = int.Parse(this.DrpDownFood.SelectedValue.ToString());
            }
            else
            {
                this.FoodBind(0);
            }

        }

        protected void DropDownRes_SelectedIndexChanged(object sender, EventArgs e)
        {
            RestaurantInfoBLL _ResInfoBLL = new RestaurantInfoBLL ();
            RestaurantID = int.Parse(this.DropDownRes.SelectedValue.ToString());
            CityID = _ResInfoBLL.GetResCityByResID(RestaurantID);
            this.DrpDownCity.SelectedValue = CityID.ToString();
            this.FoodBind(RestaurantID);
            if (this.DrpDownFood.SelectedValue != "")
                FoodID = int.Parse(this.DrpDownFood.SelectedValue.ToString());

        }

        protected void DrpDownFood_SelectedIndexChanged(object sender, EventArgs e)
        {
            CityID = int.Parse(this.DrpDownCity.SelectedValue.ToString());
            RestaurantID = int.Parse(this.DropDownRes.SelectedValue.ToString());
            FoodID = int.Parse(this.DrpDownFood.SelectedValue.ToString());
        }
    }
}
