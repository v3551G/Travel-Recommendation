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
    public partial class HotelSubRmTypeDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["TypeDetailID"] == null || "".Equals(Request.QueryString["TypeDetailID"])))
            {
                rqid = Request.QueryString["TypeDetailID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }

        }

        //根据酒店子类型ID删除子类型
        protected void deleteThis()
        {
            int HotelID = int.Parse(Request.QueryString["HotelID"].ToString());
            String HotelName = Request.QueryString["HotelName"].ToString();
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            int PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
            int HtlTypeID = int.Parse(Request.QueryString["HtlTypeID"].ToString());
            String HtlTypeName = Request.QueryString["HtlTypeName"].ToString();
            try
            {
                Array delWitch = rqid.Split('|');
                bool isTrue = false;
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));

                    HtlTypeDetailBLL _HtlTypeDetailBLL = new HtlTypeDetailBLL();

                    if (_HtlTypeDetailBLL.DelHotelTypeDetail(delid))
                          isTrue = true;                  
                    else
                          isTrue = false;


                    if (isTrue == false)
                    { 
                        break; 
                    }

                }

                if (!(isTrue == false))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='HotelSubRmTypeList.aspx?CityID=" + CityID.ToString() + "&HotelName=" + HotelName.ToString() + "&HotelID=" + HotelID.ToString() + "&PageStart=" + PageStart.ToString() + "&HtlTypeID=" + HtlTypeID.ToString() + "&HtlTypeName=" + HtlTypeName.ToString() + "';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='HotelSubRmTypeList.aspx?CityID=" + CityID.ToString() + "&HotelName=" + HotelName.ToString() + "&HotelID=" + HotelID.ToString() + "&PageStart=" + PageStart.ToString() + "&HtlTypeID=" + HtlTypeID.ToString() + "&HtlTypeName=" + HtlTypeName.ToString() + "';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='HotelSubRmTypeList.aspx?CityID=" + CityID.ToString() + "&HotelName=" + HotelName.ToString() + "&HotelID=" + HotelID.ToString() + "&PageStart=" + PageStart.ToString() + "&HtlTypeID=" + HtlTypeID.ToString() + "&HtlTypeName=" + HtlTypeName.ToString() + "';");
                Response.Write("</script>");
            }
        }
    }
}
