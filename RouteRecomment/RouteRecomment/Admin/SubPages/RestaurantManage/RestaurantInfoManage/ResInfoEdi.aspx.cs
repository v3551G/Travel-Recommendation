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
using BLL.RestaurantBLL;
using Model.Restaurant;

namespace RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantInfoManage
{
    public partial class ResInfoEdi : System.Web.UI.Page
    {
        public String OPPTitle;
        public int CityID;
        public String CityName;
        public int PageStart;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Bind();
                if (Request.QueryString["CityID"] != null)
                    CityID = int.Parse(Request.QueryString["CityID"].ToString());
                if (Request.QueryString["CityName"] != null)
                    CityName = Request.QueryString["CityName"].ToString();


                OPPTitle = "修改" + CityName + "餐馆";
            }
            else
                OPPTitle = "";
        }

        private void Bind()
        {
            //绑定餐馆信息
            RestaurantInfoBLL _ResBll = new RestaurantInfoBLL();
            int ResID = 0;
            if (Request.QueryString["RestaurantID"] != null)
                ResID = int.Parse(Request.QueryString["RestaurantID"].ToString());

            DataTable DT = _ResBll.GetResInfo(ResID);
            this.txtResName.Text = DT.Rows[0]["RestaurantName"].ToString();
            this.txtResName.Enabled = false;

            this.TxtResLoc.Text = DT.Rows[0]["Local"].ToString();
            this.TxtResNum.Text = DT.Rows[0]["PhoneNum"].ToString();

            this.TxtResIntroduce.Text = DT.Rows[0]["Introduction"].ToString();

            if (float.Parse(DT.Rows[0]["SLongitude"].ToString()) == 0.0f)
                this.txtResLgt.Text = "";
            else
               this.txtResLgt.Text = DT.Rows[0]["SLongitude"].ToString().Substring(0, 6);
            if (float.Parse(DT.Rows[0]["Slatitude"].ToString()) == 0.0f)
                this.txtResLat.Text = "";
            else
                this.txtResLat.Text = DT.Rows[0]["Slatitude"].ToString().Substring(0, 6);

            this.txtOpenTime.Text = DT.Rows[0]["OpenTime"].ToString();
           



        }

        protected void btEdit_Click(object sender, EventArgs e)
        {
            RestaurantInfo _Res = new RestaurantInfo();
            RestaurantInfoBLL _ResBLL = new RestaurantInfoBLL();


            _Res.Introduction = this.TxtResIntroduce.Text.Trim();
            _Res.Local = this.TxtResLoc.Text.Trim();
            _Res.OpenTime = this.txtOpenTime.Text.Trim();
            _Res.PhoneNum = this.TxtResNum.Text.Trim();

            if (this.txtResLgt.Text.Trim() != "")
                _Res.SLongitude = float.Parse(txtResLgt.Text.Trim().ToString());
            else
                _Res.SLongitude = 0.0f;

            if (this.txtResLat.Text.Trim() != "")
                _Res.SLongitude = float.Parse(txtResLat.Text.Trim().ToString());
            else
                _Res.Slatitude = 0.0f;

            if (Request.QueryString["CityID"] != null)
                CityID = int.Parse(Request.QueryString["CityID"].ToString());
            if (Request.QueryString["CityName"] != null)
                CityName = Request.QueryString["CityName"].ToString();
            if (Request.QueryString["PageStart"] != null)
                PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
            int ResID = int.Parse(Request.QueryString["RestaurantID"].ToString());
            if (_ResBLL.UpdResInfo(ResID,_Res))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('更新成功');");
                Response.Write("document.location.href='ResInfoList.aspx?&CityID=" + CityID.ToString() + "&CityName=" + CityName + "&PageStart=" + PageStart.ToString() + "';");
                Response.Write("</script>");

            }
        }
    }
}
