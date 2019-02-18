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
using BLL.MallInfoBLL;
using BLL.AuthorityBLL;

namespace RouteRecomment.Admin.SubPages.MallManage.MallInfoManage
{
    public partial class MallInfoList : System.Web.UI.Page
    {
        public int CityID;
        public bool IsDrop = true;
        public int PageStart = 1;
        public DataTable DT;
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
                   IsSceAdmin = _AdminInfoBLL.CheckFunction(RoleID, "购物场所管理");
               }

               if (!(IsSysAdmin || IsSceAdmin))
                   Response.Redirect("../../NotAllowed.aspx");
               else
               {
                   this.CityBind();
                   CityID = int.Parse(this.DropDownCity.SelectedValue.ToString());
                   if (Request.QueryString["CityID"] != null && Request.QueryString["CityID"] != "")
                   {
                       CityID = int.Parse(Request.QueryString["CityID"].ToString());
                       this.DropDownCity.SelectedValue = CityID.ToString();
                   }
                   MallInfoBLL _MallInfoBLL = new MallInfoBLL();
                   DT = _MallInfoBLL.GetCityMallSplit(CityID, this.AspNetPager4.PageSize, PageStart);
               }
           }
        }

        private void CityBind()
        {
            CityInfoBLL _CityInfoBLL = new CityInfoBLL();
            DataTable DT = _CityInfoBLL.GetAllCityInfo();
            this.DropDownCity.Items.Clear();
            DropDownCity.DataSource = DT;
            DropDownCity.DataTextField = "CityName";
            DropDownCity.DataValueField = "CityID";
            DropDownCity.DataBind();
        }

        protected void DropDownCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            CityID = int.Parse(this.DropDownCity.SelectedValue.ToString());
            PageStart = 1;
            this.AspNetPager4.CurrentPageIndex = PageStart;
            MallInfoBLL _MallInfoBLL = new MallInfoBLL();
            DT = _MallInfoBLL.GetCityMallSplit(CityID, this.AspNetPager4.PageSize, PageStart);
        }


        protected void AspNetPager4_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            MallInfoBLL _MallInfoBLL = new MallInfoBLL();
            CityID = int.Parse(this.DropDownCity.SelectedValue.ToString());
            PageStart = e.NewPageIndex;
            DT = _MallInfoBLL.GetCityMallSplit(CityID, this.AspNetPager4.PageSize, PageStart);
        }
    }
}
