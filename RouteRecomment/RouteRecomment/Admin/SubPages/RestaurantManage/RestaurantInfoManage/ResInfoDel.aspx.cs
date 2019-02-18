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
    public partial class ResInfoDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["RestaurantID"] == null || "".Equals(Request.QueryString["RestaurantID"])))
            {
                rqid = Request.QueryString["RestaurantID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
        }

        //根据餐馆ID删除餐馆信息
        protected void deleteThis()
        {
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            int PageStart = int.Parse(Request.QueryString["PageStart"].ToString());

            try
            {
                Array delWitch = rqid.Split('|');
                bool isTrue = false;
                bool isResPicTrue = false;
                bool IsFoodTrue = false;
                bool IsFoodPicTrue = false;
               
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));

                    RestaurantInfoBLL _ResBLL = new RestaurantInfoBLL();
                    if (_ResBLL.DelResInfo(delid))
                        isTrue = true;
                    else
                        isTrue = false;
                    if (isTrue == false )
                    {

                        break;
                    }


                    //删除菜单
                    DataTable FoodDT = _ResBLL.GetResFood(delid);
                    if (FoodDT.Rows.Count > 0)
                    {
                        for (int j = 0; j < FoodDT.Rows.Count; j++)
                        {
                            int FoodID = int.Parse(FoodDT.Rows[j]["FoodID"].ToString());
                            if (_ResBLL.DelFoodByFoodID(FoodID))
                                IsFoodTrue = true;
                            else
                            {
                                IsFoodTrue = false;
                                break;
                            }
                        }
                    }
                    else
                        IsFoodTrue = true;
                    if (IsFoodTrue == false)
                    {

                        break;
                    }

                    PicInfoBLL _PicInfoBLL = new PicInfoBLL ();
                    //删除菜图片（考虑为0的情况）
                    if (FoodDT.Rows.Count > 0)
                    {
                        //删除每个菜的图片
                        for (int k = 0; k < FoodDT.Rows.Count; k++)
                        {
                            int FoodTempID = int.Parse(FoodDT.Rows[k]["FoodID"].ToString());
                            DataTable FoodPicDT = _PicInfoBLL.GetFoodPicByFID(FoodTempID);
                            if (FoodPicDT.Rows.Count > 0)
                            {
                                for (int l = 0; l < FoodPicDT.Rows.Count; l++)
                                {
                                    int TempPicID = int.Parse(FoodPicDT.Rows[l]["PicID"].ToString());
                                    if (_PicInfoBLL.DelFoodPicByPicID(TempPicID) && _PicInfoBLL.DelPicByID(TempPicID))
                                        IsFoodPicTrue = true;
                                    else
                                    {
                                        IsFoodPicTrue = false;
                                        break;
                                    }

                                }

                                   
                            }
                            else
                            
                                IsFoodPicTrue = true;

                            if (IsFoodPicTrue == false)
                                break;
                        
                          }
                    
                     }
                    else

                        IsFoodPicTrue = true;

                    if (IsFoodPicTrue == false)
                        
                        break;

                    //删除餐馆图片（考虑为0的情况）
                    DataTable ResPicDT = _PicInfoBLL.GetResPicByID(delid);
                    if (ResPicDT.Rows.Count > 0)
                    {
                        for (int m = 0; m < ResPicDT.Rows.Count;m++ )
                        {   
                            int TempResPic = int.Parse(ResPicDT.Rows[m]["PicID"].ToString());
                            if (_PicInfoBLL.DelResPicByPicID(TempResPic) && _PicInfoBLL.DelPicByID(TempResPic))
                                isResPicTrue = true;
                            else
                            {
                                isResPicTrue = false;
                                break;
                            }
                        }
                    }
                    else
                        isResPicTrue = true;
                    if (isResPicTrue == false)
                        break;


                }

                if (!(isTrue == false || IsFoodTrue == false||IsFoodPicTrue==false||isResPicTrue==false))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='ResInfoList.aspx?CityID=" + CityID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='ResInfoList.aspx?CityID=" + CityID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='ResInfoList.aspx?CityID=" + CityID.ToString() + "&PageStart=" + PageStart.ToString() + "';");
                Response.Write("</script>");
            }
        }
    }
}
