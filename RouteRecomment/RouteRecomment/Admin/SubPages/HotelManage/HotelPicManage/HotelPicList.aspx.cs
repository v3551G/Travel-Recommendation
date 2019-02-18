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
using BLL.HotelBLL;
using BLL.CityBLL;
using BLL.AuthorityBLL;

namespace RouteRecomment.Admin.SubPages.HotelManage.HotelPicManage
{
    public partial class HotelPicList : System.Web.UI.Page
    {
        public int HotelID;
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
                    this.CityBind();
                    int CityID = int.Parse(this.DrpDownCity.SelectedValue);
                    HtlBind(CityID);
                    if (Request.QueryString["HotelID"] != null)
                    {
                        HotelID = int.Parse(Request.QueryString["HotelID"].ToString());
                        this.DropDownHotel.SelectedValue = HotelID.ToString();
                    }
                    else
                    {
                        if (this.DropDownHotel.SelectedValue != null && this.DropDownHotel.SelectedValue!="")
                        HotelID = int.Parse(this.DropDownHotel.SelectedValue.ToString());
                    }
                }

            }
            else
            {
                HotelID = int.Parse(this.DropDownHotel.SelectedValue.ToString());
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
        private void HtlBind(int CityID)
        { 
            //绑定酒店
            HotelInfoBLL _HotelInfoBLL = new HotelInfoBLL();
            DataTable HtlDT = _HotelInfoBLL.GetHtlInfoByCtyID(CityID);
            this.DropDownHotel.Items.Clear();
            this.DropDownHotel.DataSource = HtlDT;
            this.DropDownHotel.DataTextField = "HotelName";
            this.DropDownHotel.DataValueField = "HotelID";
            this.DropDownHotel.DataBind();
        }
    }
}
