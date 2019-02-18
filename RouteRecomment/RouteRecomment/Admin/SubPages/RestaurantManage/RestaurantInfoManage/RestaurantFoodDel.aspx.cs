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
using BLL.RestaurantBLL;
using BLL.PicBLL;

namespace RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantInfoManage
{
    public partial class RestaurantDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["FoodID"] == null || "".Equals(Request.QueryString["FoodID"])))
            {
                rqid = Request.QueryString["FoodID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
        }

        //根据美食ID删除美食信息
        protected void deleteThis()
        {
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            int PageStart = int.Parse(Request.QueryString["PageStart"].ToString());
            String RestaurantName = Request.QueryString["RestaurantName"].ToString();
            int RestaurantID = int.Parse(Request.QueryString["RestaurantID"].ToString());

            try
            {
                Array delWitch = rqid.Split('|');
                bool isPicTrue = false;
                bool isTrue = false;

                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));

                    RestaurantInfoBLL _ResBLL = new RestaurantInfoBLL();
                    PicInfoBLL _PicInfoBLL = new PicInfoBLL(); 
                    if (_ResBLL.DelFoodByFoodID(delid))
                        isTrue = true;
                    else
                        isTrue = false;


                    if (isTrue == false)
                    {
                        break;
                    }
                    //删除美食图片
                    DataTable FoodDT = _PicInfoBLL.GetFoodPicByFID(delid);
                    if (FoodDT.Rows.Count > 0)
                    {
                        for (int j = 0; j < FoodDT.Rows.Count;j++ )
                        {
                            int PicTempID = int.Parse(FoodDT.Rows[j]["PicID"].ToString());

                            if (_PicInfoBLL.DelFoodPicByPicID(PicTempID) && _PicInfoBLL.DelPicByID(PicTempID))
                                isPicTrue = true;
                            else
                            {
                                isPicTrue = false;
                                break;
                            }
                        }
                    }
                    else
                        isPicTrue = true;
                    if (isPicTrue == false)
                        break;
                }

                if (!(isTrue == false||isPicTrue ==false))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='RestaurantFoodList.aspx?RestaurantID=" + RestaurantID.ToString() + "&RestaurantName=" + RestaurantName + "&CityID=" + CityID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='RestaurantFoodList.aspx?RestaurantID=" + RestaurantID.ToString() + "&RestaurantName=" + RestaurantName + "&CityID=" + CityID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='RestaurantFoodList.aspx?RestaurantID=" + RestaurantID.ToString() + "&RestaurantName=" + RestaurantName + "&CityID=" + CityID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                Response.Write("</script>");
            }
        }
    }
}
