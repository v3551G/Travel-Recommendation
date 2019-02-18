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
using Model.Restaurant;
using BLL.RestaurantBLL;

namespace RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantInfoManage
{
    public partial class ResInfoAdd : System.Web.UI.Page
    {
        public String OPPTitle;
        public int CityID;
        public String CityName;
        public int PageStart;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["CityID"] != null)
                    CityID = int.Parse(Request.QueryString["CityID"].ToString());
                if (Request.QueryString["CityName"] != null)
                    CityName = Request.QueryString["CityName"].ToString();


                OPPTitle = "添加" + CityName + "餐馆";
            }
            else
                OPPTitle = "";
        }

        protected void btEdit_Click(object sender, EventArgs e)
        {
            RestaurantInfo _Res = new RestaurantInfo();
            RestaurantInfoBLL _ResBLL = new RestaurantInfoBLL();

            _Res.CityID = int.Parse(Request.QueryString["CityID"].ToString());
            _Res.Introduction = this.TxtResIntroduce.Text.Trim();
            _Res.Local = this.TxtResLoc.Text.Trim();
            _Res.OpenTime = this.txtOpenTime.Text.Trim();
            _Res.PhoneNum = this.TxtResNum.Text.Trim();
            _Res.RestaurantName = this.txtResName.Text.Trim();
          

            if (this.txtResLgt.Text.Trim() != "")
                _Res.SLongitude = float.Parse(txtResLgt.Text.Trim().ToString());
            else
                _Res.SLongitude = 0.0f;

            if (this.txtResLat.Text.Trim() != "")
                _Res.SLongitude = float.Parse(txtResLat.Text.Trim().ToString());
            else
                _Res.SLongitude = 0.0f;

            if (Request.QueryString["PageStart"] != null)
                PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
            if (_ResBLL.AddResInfo(_Res))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='ResInfoList.aspx?&CityID=" + _Res.CityID.ToString() + "&CityName=" + CityName + "&PageStart=" + PageStart.ToString() + "';");
                Response.Write("</script>");
                       
            }
        }
    }
}
