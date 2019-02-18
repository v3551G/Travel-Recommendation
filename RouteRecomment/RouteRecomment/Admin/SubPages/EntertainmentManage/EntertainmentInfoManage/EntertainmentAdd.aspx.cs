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
using Model.Entertainment;
using BLL.EntertainmentBLL;

namespace RouteRecomment.Admin.SubPages.EntertainmentManage.EntertainmentInfoManage
{
    public partial class EntertainmentAdd : System.Web.UI.Page
    {
        public String OPPTitle;
        protected void Page_Load(object sender, EventArgs e)
        {
            String CityName;
            if(Request.QueryString["CityName"] != "" && Request.QueryString["CityName"] != null)
            {
                OPPTitle = "添加" + Request.QueryString["CityName"].ToString() + "娱乐场所";
            }
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

            if (_EntertainmentBLL.AddEntertainMent(_EntertainmentInfo))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='EntertainmentList.aspx?&CityID=" + CityID.ToString()+ "';");
                Response.Write("</script>");
            
            }
        }
    }
}
