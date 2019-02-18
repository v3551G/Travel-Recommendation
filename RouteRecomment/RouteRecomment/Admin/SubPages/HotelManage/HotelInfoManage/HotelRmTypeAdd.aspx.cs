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
using Model.Hotel;
using BLL.HotelBLL;

namespace RouteRecomment.Admin.SubPages.HotelManage
{
    public partial class HotelRmTypeAdd : System.Web.UI.Page
    {
        public String OPPTitle;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                 OPPTitle = "添加"+Request.QueryString["HotelName"].ToString() +"房型";
            }
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {    
            HtlTypeBLL _HtlTypeBLL = new HtlTypeBLL ();
            HtlType _HtlType = new HtlType();

            _HtlType.HotelID = int.Parse(Request.QueryString["HotelID"].ToString());
            _HtlType.HouseType = this.txtHouseType.Text;
            _HtlType.Floor = this.txtFloor.Text;
            _HtlType.BedType = this.txtBedType.Text;
            _HtlType.Internet = this.TxtInternet.Text;

            if (this.txtSqure.Text != "")
                _HtlType.Squre = int.Parse(this.txtSqure.Text);
            else
                _HtlType.Squre = 0;
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            int HotelID = int.Parse(Request.QueryString["HotelID"].ToString());
            String HotelName = Request.QueryString["HotelName"].ToString();
            int PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
            if(_HtlTypeBLL.AddHtlType(_HtlType))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='HotelRmTypeList.aspx?CityID="+CityID.ToString()+"&HotelName="+HotelName.ToString()+"&HotelID="+HotelID.ToString()+"&PageStart="+PageStart.ToString()+"';");
                Response.Write("</script>");
            
            }
        }



    }
}
