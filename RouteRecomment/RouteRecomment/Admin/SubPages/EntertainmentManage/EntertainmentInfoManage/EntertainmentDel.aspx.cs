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
using BLL.PicBLL;

namespace RouteRecomment.Admin.SubPages.EntertainmentManage.EntertainmentInfoManage
{
    public partial class EntertainmentDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["EntertainmentID"] == null || "".Equals(Request.QueryString["EntertainmentID"])))
            {
                rqid = Request.QueryString["EntertainmentID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
            else
            {

                Response.Write("<script language='javascript'>");
                Response.Write("document.location.href='EntertainmentPicList.aspx';");
                Response.Write("</script>");
            }
        }


        //根据娱乐场所ID删除娱乐场所信息
        protected void deleteThis()
        {
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
           
            try
            {
                Array delWitch = rqid.Split('|');
                bool isTrue = false;
                bool isPicTrue = false;
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));


                    EntertainmentBLL _EntertainmentBLL = new EntertainmentBLL();
                    PicInfoBLL _PicInfoBLL = new PicInfoBLL();

                    if (_EntertainmentBLL.DelEnterInfo(delid))
                    {
                        isTrue = true;
                        DataTable EnterPicDT = _PicInfoBLL.GetEnterPicByEnterID(delid);
                        if (EnterPicDT.Rows.Count > 0)
                        {
                            for (int j = 0; j < EnterPicDT.Rows.Count; j++)
                            {  
                               int tempPicID = int.Parse(EnterPicDT.Rows[j]["PicID"].ToString());
                               if (_PicInfoBLL.DelEntetPicByID(tempPicID) && _PicInfoBLL.DelPicByID(tempPicID))
                                   isPicTrue = true;
                               else
                               {
                                   isPicTrue = false;
                                   break;
                               }
                            
                            }
                        }
                        else
                        {
                            isPicTrue = true;
                          
                        }
                       
                    }
                    else
                        isTrue = false;

                    if (isTrue == false||isPicTrue==false)
                    { break; }

                }
                if (!(isTrue == false || isPicTrue == false))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='EntertainmentList.aspx?CityID=" + CityID.ToString() + "';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='EntertainmentList.aspx?CityID" + CityID.ToString() + "';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='EntertainmentList.aspx?CityID" + CityID.ToString() + "';");
                Response.Write("</script>");
            }
        }
    }
}
