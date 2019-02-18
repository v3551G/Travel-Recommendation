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
    public partial class MallInfoEdi : System.Web.UI.Page
    {
        public String OPPTitle;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["CityName"] != null && Request.QueryString["CityName"] != "")
                {
                    OPPTitle = "编辑" + Request.QueryString["CityName"].ToString() + "商场信息";
                }
                MallBind();
            }
        }

        private void MallBind()
        {
            int MallID = int.Parse(Request.QueryString["MallID"].ToString());
            MallInfoBLL _MallInfoBLL = new MallInfoBLL();
            DataTable DT = _MallInfoBLL.GetMallInfoByID(MallID);

            this.TxtLoc.Text = DT.Rows[0]["Local"].ToString();
            this.txtPhoneNum.Text = DT.Rows[0]["PhoneNum"].ToString();
            this.TxtIntroduce.Text = DT.Rows[0]["Introduction"].ToString();
            this.TxtOpenTime.Text = DT.Rows[0]["OpenTime"].ToString();

            this.txtMallName.Text = DT.Rows[0]["MallName"].ToString();
            this.txtMallName.Enabled = false;

            if (float.Parse(DT.Rows[0]["SLongitude"].ToString()) != 0.0f)
                this.txtMallLgt.Text = DT.Rows[0]["SLongitude"].ToString();
            else
                this.txtMallLgt.Text = "";

            if (float.Parse(DT.Rows[0]["Slatitude"].ToString()) != 0.0f)
                this.txtMallLat.Text =DT.Rows[0]["Slatitude"].ToString();
            else
                this.txtMallLat.Text = "";
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
                _MallInfo.SLongitude = float.Parse(this.txtMallLgt.Text.Trim().ToString());
            else
                _MallInfo.SLongitude = 0.0f;

            if (this.txtMallLat.Text.Trim() != "")
                _MallInfo.Slatitude = float.Parse(txtMallLat.Text.Trim().ToString());
            else
                _MallInfo.Slatitude = 0.0f;


            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            int MallID = int.Parse(Request.QueryString["MallID"].ToString());

            if (_MallInfoBLL.UpdMallInfo(MallID, _MallInfo))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('更改成功');");
                Response.Write("document.location.href='MallInfoList.aspx?&CityID=" + CityID.ToString() + "';");
                Response.Write("</script>");

            }
        }
    }
}
