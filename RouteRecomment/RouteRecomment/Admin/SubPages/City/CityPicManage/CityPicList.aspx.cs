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

namespace RouteRecomment.Admin.SubPages.City.CityPicManage
{
    public partial class CityPicList : System.Web.UI.Page
    {

        public int CityID;
        /*public DataTable DT;*/
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool IsSysAdmin = true;
                bool IsCityAdmin = true;

                if (null == Session["IsSYS"] || (Boolean)Session["IsSYS"] != true)
                {
                    IsSysAdmin = false;
                    IsCityAdmin = false;

                    AdminInfoBLL _AdminInfoBLL = new AdminInfoBLL();
                    RoleBLL _RoleBLL = new RoleBLL();
                    int AdminID = int.Parse(Session["AdminID"].ToString());
                    int RoleID = _RoleBLL.GetRoleIDByAdminID(AdminID);
                    IsCityAdmin = _AdminInfoBLL.CheckFunction(RoleID, "市管理");
                }

                if (!(IsSysAdmin || IsCityAdmin))
                    Response.Redirect("../../NotAllowed.aspx");
                else
                    Bind();
                if(Request.QueryString["CityID"]!=null)
                {
                   CityID= int.Parse(Request.QueryString["CityID"].ToString());
                   this.DrpDownCity.SelectedValue = CityID.ToString() ;
                }

                
               
            }
        }


        private void Bind()
        {
            CityInfoBLL _CityInfoBLL = new CityInfoBLL();
            DataTable DT = _CityInfoBLL.GetAllCityInfo();
            this.DrpDownCity.Items.Clear();
            this.DrpDownCity.DataSource = DT;
            DrpDownCity.DataTextField = "CityName";
            DrpDownCity.DataValueField = "CityID";
            DrpDownCity.DataBind();
        
        }

    }
}
