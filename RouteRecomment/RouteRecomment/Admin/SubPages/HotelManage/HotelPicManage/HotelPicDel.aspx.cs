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
using BLL.PicBLL;

namespace RouteRecomment.Admin.SubPages.HotelManage.HotelPicManage
{
    public partial class HotelPicDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["PicID"] == null || "".Equals(Request.QueryString["PicID"])))
            {
                rqid = Request.QueryString["PicID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
            else
            {

                Response.Write("<script language='javascript'>");
                Response.Write("document.location.href='HotelPicList.aspx';");
                Response.Write("</script>");
            }
        }

        //根据图片ID删除图片
        protected void deleteThis()
        {
            int HotelID = int.Parse(Request.QueryString["HotelID"].ToString());
            try
            {
           
                Array delWitch = rqid.Split('|');
                bool isTrue = false;
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));


                    PicInfoBLL _PicInfoBLL = new PicInfoBLL();

                    if (_PicInfoBLL.DelHtlPicByID(delid) && _PicInfoBLL.DelPicByID(delid))
                        isTrue = true;
                    else
                        isTrue = false;


                    if (isTrue == false)
                    { break; }

                }
                if (!(isTrue == false))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='HotelPicList.aspx?Times=1&HotelID=" + HotelID + "';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='HotelPicList.aspx?HotelID=" + HotelID + "';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='HotelPicList.aspx?HotelID=" + HotelID + "';");
                Response.Write("</script>");
            }
        }
    }
}
