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

namespace RouteRecomment.Admin.SubPages.SceneryManage.SceneryInfoManage
{
    public partial class SceneryInfoList : System.Web.UI.Page
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
                    Bind();
                    if (Request.QueryString["CityID"] != null)
                        this.DropDownCity.SelectedValue = Request.QueryString["CityID"].ToString();
                }
                                       
            }
        }

        private void Bind()
        {
            CityInfoBLL _CityInfoBLL = new CityInfoBLL();
            DataTable DT = _CityInfoBLL.GetAllCityInfo();
            this.DropDownCity.Items.Clear();
            DropDownCity.DataSource = DT;
            DropDownCity.DataTextField = "CityName";
            DropDownCity.DataValueField = "CityID";
            DropDownCity.DataBind();
        
        }
    }
}
