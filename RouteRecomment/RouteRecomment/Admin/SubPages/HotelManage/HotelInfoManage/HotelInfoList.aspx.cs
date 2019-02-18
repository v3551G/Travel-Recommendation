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

namespace RouteRecomment.Admin.SubPages.HotelManage
{
    public partial class HotelInfoList : System.Web.UI.Page
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
                    IsSceAdmin = _AdminInfoBLL.CheckFunction(RoleID, "酒店管理");
                }

                if (!(IsSysAdmin || IsSceAdmin))
                    Response.Redirect("../../NotAllowed.aspx");
                else
                {
                    CityBind();

                }

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
