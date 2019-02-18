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

namespace RouteRecomment.Admin.SubPages.HotelManage
{
    public partial class HotelInfoEdi : System.Web.UI.Page
    {
        public String HotelName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                HotelInfoBind();
                this.HotelName = Request.QueryString["HotelName"].ToString();
            }
        }

        private void HotelInfoBind()
        {
            int HotelID = int.Parse(Request.QueryString["HotelID"].ToString());

            HotelInfoBLL _HotelInfoBLL = new HotelInfoBLL();
            DataTable HotelDT = _HotelInfoBLL.GetHotelInfoByHtlID(HotelID);

            this.txtHotelName.Text = HotelDT.Rows[0]["HotelName"].ToString();
            this.txtHotelName.Enabled = false;

            this.txtHotelStar.Text = HotelDT.Rows[0]["Star"].ToString();

            this.TxtHotelLoc.Text = HotelDT.Rows[0]["Locate"].ToString();

            this.TxtHotelNum.Text = HotelDT.Rows[0]["PhoneNum"].ToString();

            this.TxtHtlService.Text = HotelDT.Rows[0]["HotelService"].ToString();

            this.TxtHotelIntroduce.Text = HotelDT.Rows[0]["HotelIntroduction"].ToString();

            this.TxtResScrvice.Text = HotelDT.Rows[0]["RestaurantDevice"].ToString();

            this.txtIdrService.Text = HotelDT.Rows[0]["IndoorService"].ToString();

            if (float.Parse(HotelDT.Rows[0]["SLongitude"].ToString().Substring(0,6))!=0.0f)
                this.txtHotelLgt.Text = HotelDT.Rows[0]["SLongitude"].ToString();


            if (float.Parse(HotelDT.Rows[0]["Slatitude"].ToString().Substring(0,6)) != 0.0f)
            {
                this.txtHotelLgt.Text = HotelDT.Rows[0]["SLongitude"].ToString();
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

            int PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            if (_HotelInfoBLL.UpdHotelInfo(CityID,_HotelInfo))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('更改成功');");
                Response.Write("document.location.href='HotelInfoList.aspx?PageStart="+PageStart.ToString()+"&CityID="+CityID.ToString()+"';");
                Response.Write("</script>");

            }
        }
    
    
    
    }
}
