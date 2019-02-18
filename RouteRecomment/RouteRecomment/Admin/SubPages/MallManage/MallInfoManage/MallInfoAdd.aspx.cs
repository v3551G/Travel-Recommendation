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
using BLL.MallInfoBLL;
using Model.Mall;

namespace RouteRecomment.Admin.SubPages.MallManage.MallInfoManage
{
    public partial class MallInfoAdd : System.Web.UI.Page
    {
        public String OPPTitle;
        protected void Page_Load(object sender, EventArgs e)
        {
            String CityName;
            if (Request.QueryString["CityName"] != "" && Request.QueryString["CityName"] != null)
            {
                OPPTitle = "添加" + Request.QueryString["CityName"].ToString() + "商场";
            }
        }

        protected void btEdit_Click(object sender, EventArgs e)
        {
            MallInfoBLL _MallInfoBLL = new MallInfoBLL();
            MallInfo _MallInfo = new MallInfo();
            _MallInfo.Local = this.TxtLoc.Text.Trim();
            _MallInfo.PhoneNum = this.txtPhoneNum.Text.Trim();
            _MallInfo.Introduction = this.TxtIntroduce.Text.Trim();
            _MallInfo.OpenTime = this.TxtOpenTime.Text.Trim();
            _MallInfo.CityID = int.Parse(Request.QueryString["CityID"].ToString());
            _MallInfo.MallName = this.txtMallName.Text.Trim();


            if (this.txtMallLgt.Text.Trim() != "")
                _MallInfo.SLongitude = float.Parse(txtMallLgt.Text.Trim().ToString());
            else
                _MallInfo.SLongitude = 0.0f;

            if (this.txtMallLat.Text.Trim() != "")
                _MallInfo.Slatitude = float.Parse(txtMallLat.Text.Trim().ToString());
            else
                _MallInfo.Slatitude = 0.0f;


            int CityID = int.Parse(Request.QueryString["CityID"].ToString());

            if (_MallInfoBLL.AddMallInfo(_MallInfo))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='MallInfoList.aspx?&CityID=" + CityID.ToString() + "';");
                Response.Write("</script>");

            }
        }
    }
}
