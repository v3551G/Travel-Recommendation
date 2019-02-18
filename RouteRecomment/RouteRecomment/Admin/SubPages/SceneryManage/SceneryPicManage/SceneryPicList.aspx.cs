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
using BLL.CityBLL;
using BLL.Scenery;
using BLL.AuthorityBLL;

namespace RouteRecomment.Admin.SubPages.SceneryManage.SceneryPicManage
{
    public partial class SceneryPicList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                    IsSceAdmin = _AdminInfoBLL.CheckFunction(RoleID, "景点管理");
                }

                if (!(IsSysAdmin || IsSceAdmin))
                    Response.Redirect("../../NotAllowed.aspx");
                else
                {
                    DropDownBind();
                    if (Request.QueryString["CityID"] != null)
                    {
                        this.DrpDownCity.SelectedValue = Request.QueryString["CityID"].ToString();

                    }
                    if (Request.QueryString["SceneryID"] != null)
                    {
                        this.DropDownScenery.SelectedValue = Request.QueryString["SceneryID"].ToString();
                    }
            
                }

            }
        }

        private void DropDownBind()
        { 
         //绑定市
            CityInfoBLL _CityInfoBLL = new CityInfoBLL();
            DataTable CityDT = _CityInfoBLL.GetAllCityInfo();
            this.DrpDownCity.Items.Clear();
            this.DrpDownCity.DataSource = CityDT;
            this.DrpDownCity.DataTextField = "CityName";
            this.DrpDownCity.DataValueField = "CityID";
            this.DrpDownCity.DataBind();
         //绑定景点
            int CityID = int.Parse(this.DrpDownCity.SelectedValue);
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL(); 
            DataTable SceDT = _SceneryInfoBLL.GetCityScenery(CityID);
            this.DropDownScenery.Items.Clear();
            this.DropDownScenery.DataSource = SceDT;
            this.DropDownScenery.DataTextField = "SceneryName";
            this.DropDownScenery.DataValueField = "SceneryID";
            this.DropDownScenery.DataBind();
        
        }
    }
}
