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

namespace RouteRecomment.Admin.SubPages.HotelManage
{
    public partial class HotelRmTypeDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["HtlTypeID"] == null || "".Equals(Request.QueryString["HtlTypeID"])))
            {
                rqid = Request.QueryString["HtlTypeID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
        }

        //根据酒店子类型ID删除子类型
        protected void deleteThis()
        {
            //HotelID=<%=HotelID%>&HotelName=<%=HotelName%>&CityID=<%=CityID%>&
            //PageStart=<%=PageStart%>&HtlTypeID
            int HotelID = int.Parse(Request.QueryString["HotelID"].ToString());
            String HotelName = Request.QueryString["HotelName"].ToString();
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            int PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
            try
            {
                Array delWitch = rqid.Split('|');
                bool isTrue = false;
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));

                    HtlTypeBLL _HtlTypeBLL = new HtlTypeBLL();
                    HtlTypeDetailBLL _HtlTypeDetailBLL = new HtlTypeDetailBLL();
                    int DtlTypeCount = _HtlTypeDetailBLL.GetHtlDetailCountByID(delid);


                    if (DtlTypeCount > 0)
                    {
                        if (_HtlTypeBLL.DelHtlTypeByTypeID(delid) && _HtlTypeDetailBLL.DelHotelTypeDetailByTypeID(delid))
                            isTrue = true;
                    }
                    else
                    {
                        if (_HtlTypeBLL.DelHtlTypeByTypeID(delid))
                            isTrue = true;
                    }                                       
                    if (isTrue == false)
                    {
                        break;
                    }

                }

                if (!(isTrue == false))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='HotelRmTypeList.aspx?CityID=" + CityID.ToString() + "&HotelName=" + HotelName.ToString() + "&HotelID=" + HotelID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='HotelRmTypeList.aspx?CityID=" + CityID.ToString() + "&HotelName=" + HotelName.ToString() + "&HotelID=" + HotelID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='HotelRmTypeList.aspx?CityID=" + CityID.ToString() + "&HotelName=" + HotelName.ToString() + "&HotelID=" + HotelID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                Response.Write("</script>");
            }
        }
    }
}
