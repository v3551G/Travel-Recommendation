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
using BLL.PicBLL;
using BLL.MallInfoBLL;
using BLL.AuthorityBLL;

namespace RouteRecomment.Admin.SubPages.MallManage.MallPicManage
{
    public partial class MallPicList : System.Web.UI.Page
    {
        public int CityID;
        public int MallID;
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
                    IsSceAdmin = _AdminInfoBLL.CheckFunction(RoleID, "购物场所管理");
                }

                if (!(IsSysAdmin || IsSceAdmin))
                    Response.Redirect("../../NotAllowed.aspx");
                else
                {
                    this.CityBind();
                    CityID = int.Parse(this.DrpDownCity.SelectedValue.ToString());
                    if (CityID != 0)
                    {
                        this.MallBind(CityID); 
                        if(this.DropDownMall.SelectedValue!=""&&this.DropDownMall.SelectedValue!=null)
                        MallID = int.Parse(this.DropDownMall.SelectedValue.ToString());

                    }
                    if (Request.QueryString["CityID"] != null && Request.QueryString["CityID"] != "")
                    {
                         CityID = int.Parse(Request.QueryString["CityID"]);
                        this.DrpDownCity.SelectedValue = CityID.ToString();
                        this.MallBind(CityID);
                        if (Request.QueryString["MallID"] != null && Request.QueryString["MallID"] != "")
                        {
                            this.DropDownMall.SelectedValue = Request.QueryString["MallID"].ToString();
                            MallID = int.Parse(Request.QueryString["MallID"].ToString());

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

        private void MallBind(int CityID)
        {
            MallInfoBLL _MallInfoBLL = new MallInfoBLL();

            DataTable MallDT = _MallInfoBLL.GetCityMall(CityID);
            this.DropDownMall.Items.Clear();
            this.DropDownMall.DataSource = MallDT;
            this.DropDownMall.DataTextField = "MallName";
            this.DropDownMall.DataValueField = "MallID";
            this.DropDownMall.DataBind();

        }

        protected void DrpDownCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            CityID = int.Parse(this.DrpDownCity.SelectedValue.ToString());
            this.MallBind(CityID);
            if(this.DropDownMall.SelectedValue !="")
            MallID = int.Parse(this.DropDownMall.SelectedValue);
        }

        protected void DropDownMall_SelectedIndexChanged(object sender, EventArgs e)
        {
            MallID = int.Parse(this.DropDownMall.SelectedValue);
            MallInfoBLL _MallInfoBLL = new MallInfoBLL();
            CityID = _MallInfoBLL.GetMallCityID(MallID);
            this.DrpDownCity.SelectedValue = CityID.ToString();
        }
    }
}
