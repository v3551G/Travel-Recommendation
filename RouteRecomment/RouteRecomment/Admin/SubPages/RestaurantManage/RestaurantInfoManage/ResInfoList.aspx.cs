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
using BLL.AuthorityBLL;

namespace RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantInfoManage
{
    public partial class ResInfoList : System.Web.UI.Page
    {   

        public int CityID;
        public int PageStart;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                CityBind();
                if (Request.QueryString["CityID"] != null)
                {
                    this.CityID = int.Parse(Request.QueryString["CityID"].ToString());
                    this.DropDownCity.SelectedValue = CityID.ToString();
                }
                else
                    CityID = int.Parse(this.DropDownCity.SelectedValue.ToString());
                if (Request.QueryString["PageStart"] != null)
                {
                    if (int.Parse(Request.QueryString["PageStart"]) != 0)
                        this.PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
                }
                else
                    this.PageStart = 1;
            }
            else
            {
                CityID = int.Parse(this.DropDownCity.SelectedValue.ToString());
                this.PageStart = 1;
            }

        }

        private void CityBind()
        {
            CityInfoBLL _CityInfoBLL = new CityInfoBLL();
            DataTable CityDT = _CityInfoBLL.GetAllCityInfo();
            this.DropDownCity.Items.Clear();
            this.DropDownCity.DataSource = CityDT;
            this.DropDownCity.DataTextField = "CityName";
            this.DropDownCity.DataValueField = "CityID";
            this.DropDownCity.DataBind();

        }
    }
}
