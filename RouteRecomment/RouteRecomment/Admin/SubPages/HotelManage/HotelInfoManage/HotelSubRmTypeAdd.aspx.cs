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
    public partial class HotelSubRmTypeAdd : System.Web.UI.Page
    {
        public String OPPTitle;
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
             * HotelSubRmTypeAdd.aspx?HotelID=<%=HotelID%>&HotelName=<%=HotelName%>&CityID=<%=CityID%>&PageStart=<%=PageStart%>&HtlTypeID=<%=HtlTypeID%>
             */
            if (!IsPostBack)
            {
                OPPTitle = "添加" + Request.QueryString["HotelName"].ToString() + Request.QueryString["HtlTypeName"].ToString() + "房型的子房型";
            }
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            HtlTypeDetail _HtlTypeDetail = new HtlTypeDetail();
            HtlTypeDetailBLL _HtlTypeDetailBLL = new HtlTypeDetailBLL();

            _HtlTypeDetail.HouseType = this.txtHouseType.Text;
            _HtlTypeDetail.BedType = this.txtBed.Text;
            _HtlTypeDetail.HaveBreakfast = this.txtBreakfast.Text;
            _HtlTypeDetail.Broadband = this.txtBroadBand.Text;
            _HtlTypeDetail.TypeID = int.Parse(Request.QueryString["HtlTypeID"].ToString());
            
            _HtlTypeDetail.Price = TxtPrice.Text;

            int HotelID = int.Parse(Request.QueryString["HotelID"].ToString());
            String HotelName = Request.QueryString["HotelName"].ToString();
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            int PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
            int HtlTypeID = int.Parse(Request.QueryString["HtlTypeID"].ToString());
            String HtlTypeName = Request.QueryString["HtlTypeName"].ToString();
            if(_HtlTypeDetailBLL.AddHotelTypeDetail(_HtlTypeDetail))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='HotelSubRmTypeList.aspx?CityID=" + CityID.ToString() + "&HotelName=" + HotelName.ToString() + "&HtlTypeID" + HtlTypeID.ToString()+ "&HotelID=" + HotelID.ToString() + "&PageStart=" + PageStart.ToString() + "&HtlTypeID=" + HtlTypeID.ToString() + "&HtlTypeName=" + HtlTypeName.ToString() + "';");
                Response.Write("</script>");
            }
        }
    }
}
