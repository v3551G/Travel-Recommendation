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
using BLL.EntertainmentBLL;
using Model.Entertainment;

namespace RouteRecomment.Admin.SubPages.EntertainmentManage.EntertainmentInfoManage
{
    public partial class EntertainmentEdi : System.Web.UI.Page
    {
        public String OPPTitle;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["CityName"] != null && Request.QueryString["CityName"] != "")
                {
                    OPPTitle = "编辑" + Request.QueryString["CityName"].ToString() + "娱乐场所";
                }
                EnterDataBind();
            }
        }

        private void EnterDataBind()
        {
            int EntertainmentID = int.Parse(Request.QueryString["EntertainmentID"].ToString());
            EntertainmentBLL _EntertainmentBLL = new EntertainmentBLL();
            DataTable EnterDT = _EntertainmentBLL.GetEnterInfoByID(EntertainmentID);

            this.TxtLoc.Text = EnterDT.Rows[0]["Local"].ToString();
            this.txtPhoneNum.Text = EnterDT.Rows[0]["PhoneNum"].ToString();
            this.TxtIntroduce.Text = EnterDT.Rows[0]["Introduction"].ToString();
            this.TxtOpenTime.Text = EnterDT.Rows[0]["OpenTime"].ToString();

            this.txtEntertainName.Text = EnterDT.Rows[0]["EntertainmentName"].ToString();
            this.txtEntertainName.Enabled = false;

            if (float.Parse(EnterDT.Rows[0]["SLongitude"].ToString()) != 0.0f)
                this.txtEntertainLgt.Text = EnterDT.Rows[0]["SLongitude"].ToString();
            else
                this.txtEntertainLgt.Text = "";

            if (float.Parse(EnterDT.Rows[0]["Slatitude"].ToString()) != 0.0f)
                this.txtEntertainLgt.Text = EnterDT.Rows[0]["Slatitude"].ToString();
            else
                this.txtEntertainLgt.Text = "";


        }

        protected void btEdit_Click(object sender, EventArgs e)
        {
            EntertainmentBLL _EntertainmentBLL = new EntertainmentBLL();
            EntertainmentInfo _EntertainmentInfo = new EntertainmentInfo();
            _EntertainmentInfo.Local = this.TxtLoc.Text.Trim();
            _EntertainmentInfo.PhoneNum = this.txtPhoneNum.Text.Trim();
            _EntertainmentInfo.Introduction = this.TxtIntroduce.Text.Trim();
            _EntertainmentInfo.OpenTime = this.TxtOpenTime.Text.Trim();
            _EntertainmentInfo.CityID = int.Parse(Request.QueryString["CityID"].ToString());
            _EntertainmentInfo.EntertainmentName = this.txtEntertainName.Text.Trim();


            if (this.txtEntertainLgt.Text.Trim() != "")
                _EntertainmentInfo.SLongitude = float.Parse(txtEntertainLgt.Text.Trim().ToString());
            else
                _EntertainmentInfo.SLongitude = 0.0f;

            if (this.txtEntertainLat.Text.Trim() != "")
                _EntertainmentInfo.Slatitude = float.Parse(txtEntertainLat.Text.Trim().ToString());
            else
                _EntertainmentInfo.Slatitude = 0.0f;


            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            int EntertainmentID = int.Parse(Request.QueryString["EntertainmentID"].ToString());
            int PageStart = int.Parse(Request.QueryString["PageStart"].ToString());

            if (_EntertainmentBLL.UpdEnterInfo(EntertainmentID,_EntertainmentInfo))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='EntertainmentList.aspx?&CityID=" + CityID.ToString() + "&PageStart="+PageStart.ToString() + "';");
                Response.Write("</script>");

            }
        }
    }
}
