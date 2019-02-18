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
using BLL.EntertainmentBLL;
using BLL.AuthorityBLL;

namespace RouteRecomment.Admin.SubPages.EntertainmentManage.EntertainmentPicManage
{
    public partial class EntertainmentPicList : System.Web.UI.Page
    {
        public int CityID;
        public int EntertainmentID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
                    IsSceAdmin = _AdminInfoBLL.CheckFunction(RoleID, "娱乐场所管理");
                }
        
                    if (!(IsSysAdmin || IsSceAdmin))
                        Response.Redirect("../../NotAllowed.aspx");
               else
                 {
                    this.CityBind();
                    if(this.DrpDownCity.SelectedValue != "" && this.DrpDownCity.SelectedValue!=null)
                    CityID = int.Parse(this.DrpDownCity.SelectedValue.ToString());
                    if (CityID != 0)
                    {
                        this.EntertainmentBind(CityID);
                        if (this.DropDownEntertainment.SelectedValue != "" && this.DropDownEntertainment.SelectedValue!=null)
                        EntertainmentID = int.Parse(this.DropDownEntertainment.SelectedValue.ToString());

                    }
                    if (Request.QueryString["CityID"] != null && Request.QueryString["CityID"] != "")
                    {
                        CityID = int.Parse(Request.QueryString["CityID"]);
                        this.DrpDownCity.SelectedValue = CityID.ToString();
                        this.EntertainmentBind(CityID);
                        if (Request.QueryString["EntertainmentID"] != null && Request.QueryString["EntertainmentID"] != "")
                        {
                            this.DropDownEntertainment.SelectedValue = Request.QueryString["EntertainmentID"].ToString();
                            EntertainmentID = int.Parse(Request.QueryString["EntertainmentID"].ToString());

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

        private void EntertainmentBind(int CityID)
        {
            EntertainmentBLL _EntertainmentBLL = new EntertainmentBLL();

            DataTable EnterDT = _EntertainmentBLL.GetCityEntertainment(CityID);
            this.DropDownEntertainment.Items.Clear();
            this.DropDownEntertainment.DataSource = EnterDT;
            this.DropDownEntertainment.DataTextField = "EntertainmentName";
            this.DropDownEntertainment.DataValueField = "EntertainmentID";
            this.DropDownEntertainment.DataBind();
        
        }

        protected void DrpDownCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            CityID = int.Parse(this.DrpDownCity.SelectedValue.ToString());
            this.EntertainmentBind(CityID);
            EntertainmentID = int.Parse(this.DropDownEntertainment.SelectedValue);
        }

        protected void DropDownEntertainment_SelectedIndexChanged(object sender, EventArgs e)
        {
            EntertainmentID = int.Parse(this.DropDownEntertainment.SelectedValue);
            EntertainmentBLL _EntertainmentBLL = new EntertainmentBLL();
            CityID = _EntertainmentBLL.GetCityIDByEnterID(EntertainmentID);
            this.DrpDownCity.SelectedValue = CityID.ToString();
        }
    }
}
