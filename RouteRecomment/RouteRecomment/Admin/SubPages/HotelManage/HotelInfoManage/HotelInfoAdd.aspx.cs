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
using Model.Hotel;

namespace RouteRecomment.Admin.SubPages.HotelManage.HotelInfoManage
{
    public partial class HotelInfoAdd : System.Web.UI.Page
    {
        public String CityName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CityName = Request.QueryString["CityName"].ToString() + "酒店添加";

            }
        }

        protected void btEdit_Click(object sender, EventArgs e)
        {
            HotelInfoBLL _HotelInfoBLL = new HotelInfoBLL();
            HotelInfo _HotelInfo = new HotelInfo();

            _HotelInfo.CityID = int.Parse(Request.QueryString["CityID"].ToString());
            _HotelInfo.HotelName = txtHotelName.Text.Trim();
            _HotelInfo.Local = TxtHotelLoc.Text.Trim();
            _HotelInfo.PhoneNum = TxtHotelNum.Text.Trim();
            _HotelInfo.HotelService = TxtHtlService.Text.Trim();
            _HotelInfo.HotelIntroduction = TxtHotelIntroduce.Text.Trim();
            _HotelInfo.RestaurantDevice = TxtResScrvice.Text.Trim();
            _HotelInfo.IndoorService = txtIdrService.Text.Trim();



            if (txtHotelLgt.Text.Trim() != "")
                _HotelInfo.SLongitude = float.Parse(txtHotelLgt.Text.Trim().ToString());
            else
                _HotelInfo.SLongitude = 0.0f;

            if (txtHotelLat.Text.Trim() != "")
                _HotelInfo.Slatitude = float.Parse(txtHotelLat.Text.Trim().ToString());
            else
                _HotelInfo.Slatitude = 0.0f;
            if (txtHotelStar.Text != "")
                _HotelInfo.Star = int.Parse(txtHotelStar.Text.Trim());
            else
                _HotelInfo.Star = 0;

            if (_HotelInfoBLL.AddHotel(_HotelInfo))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='HotelInfoList.aspx';");
                Response.Write("</script>");
                       
            }

        }
    }
}
