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

namespace RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantPicManage
{
    public partial class RestaurantPicDel : System.Web.UI.Page
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


        }
        //根据图片ID删除图片信息
        protected void deleteThis()
        {
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            int RestaurantID = int.Parse(Request.QueryString["RestaurantID"].ToString());

            try
            {
                Array delWitch = rqid.Split('|');
                bool isTrue = false;
          
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));

                    PicInfoBLL _PicInfoBLL = new PicInfoBLL();
                    if (_PicInfoBLL.DelPicByID(delid)&&_PicInfoBLL.DelResPicByPicID(delid))
                        isTrue = true;
                    else
                        isTrue = false;
                    if (isTrue == false)
                    {

                        break;
                    }



                }

                if (!(isTrue == false ))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='RestaurantPicList.aspx?CityID=" + CityID.ToString() + "&RestaurantID=" + RestaurantID.ToString() + "'");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='RestaurantPicList.aspx?CityID=" + CityID.ToString() + "&RestaurantID=" + RestaurantID.ToString() + "'");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='RestaurantPicList.aspx?CityID=" + CityID.ToString() + "&RestaurantID=" + RestaurantID.ToString() + "'");
                Response.Write("</script>");
            }
        }
    }
}
