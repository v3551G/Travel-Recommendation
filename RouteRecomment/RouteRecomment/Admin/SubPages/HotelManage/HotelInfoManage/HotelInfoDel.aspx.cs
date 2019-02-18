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
using BLL.PicBLL;

namespace RouteRecomment.Admin.SubPages.HotelManage
{
    public partial class HotelInfoDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["HotelID"] == null || "".Equals(Request.QueryString["HotelID"])))
            {
                rqid = Request.QueryString["HotelID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
        }

        //根据酒店子类型ID删除子类型
        protected void deleteThis()
        {
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            int PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
           
            try
            {
                Array delWitch = rqid.Split('|');
                bool isTrue = false;
                bool isPicTrue = false;
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));
                    PicInfoBLL _PicInfoBLL = new PicInfoBLL ();
                    HotelInfoBLL _HotelInfoBLL = new HotelInfoBLL ();
                    HtlTypeBLL _HtlTypeBLL = new HtlTypeBLL ();
                    HtlTypeDetailBLL _HtlTypeDetailBLL = new HtlTypeDetailBLL ();

                    //
                    DataTable HtlTypeDT = _HtlTypeBLL.GetHtlTypeByID(delid);
                    DataTable HtlPicDT = _PicInfoBLL.GetPicByHtlID(delid);

                    if (HtlTypeDT.Rows.Count == 0)
                    {
                        if (_HotelInfoBLL.DelHotelByHotelID(delid))
                            isTrue = true;
                        else
                            isTrue = false;
                    }
                    else
                    {   
                        //删除子类型
                        for (int j = 0; j < HtlTypeDT.Rows.Count; j++)
                        {
                            int HtlType = int.Parse(HtlTypeDT.Rows[j]["ID"].ToString());//房型类型
                            int DetailTypeCount = _HtlTypeDetailBLL.GetHtlDetailCountByID(HtlType);
                            if (DetailTypeCount > 0)
                            {
                                if (_HtlTypeDetailBLL.DelHotelTypeDetailByTypeID(HtlType))
                                    isTrue = true;
                                else
                                {
                                    isTrue = false;
                                    break;
                                }
                            }
                            else
                                isTrue = true;

                                
                        }
                        if (isTrue == false)
                            break;
                        //删除房型信息，酒店信息
                        if (_HtlTypeBLL.DelHtlTypeByHtlID(delid) && _HotelInfoBLL.DelHotelByHotelID(delid))
                            isTrue = true;
                        else
                            isTrue = false;
                    
                    }

                    //删除图片信息
                    HtlPicDT = _PicInfoBLL.GetPicByHtlID(delid);
                    for (int k = 0; k < HtlPicDT.Rows.Count; k++)
                    {  
                      int PicID = int.Parse(HtlPicDT.Rows[k]["PicID"].ToString());
                      if (_PicInfoBLL.DelPicByID(PicID) && _PicInfoBLL.DelHtlPicByID(PicID))
                          isPicTrue = true;
                      else
                      {
                          isPicTrue = false;
                          break;
                      }
                    }

                    if (isTrue == false || isPicTrue ==false)
                        {

                            break;
                        }

                }

                if (!(isTrue == false || isPicTrue == false))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='HotelInfoList.aspx?CityID=" + CityID.ToString()  + "&PageStart=" + PageStart.ToString()+"';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='HotelInfoList.aspx?CityID=" + CityID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='HotelInfoList.aspx?CityID=" + CityID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                Response.Write("</script>");
            }
        }
    }
}
