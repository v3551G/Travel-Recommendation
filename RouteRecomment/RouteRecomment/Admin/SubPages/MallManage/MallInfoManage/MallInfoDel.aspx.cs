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
using BLL.MallInfoBLL;
using BLL.PicBLL;

namespace RouteRecomment.Admin.SubPages.MallManage.MallInfoManage
{
    public partial class MallInfoDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["MallID"] == null || "".Equals(Request.QueryString["MallID"])))
            {
                rqid = Request.QueryString["MallID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
            else
            {

                Response.Write("<script language='javascript'>");
                Response.Write("document.location.href='MallInfoList.aspx';");
                Response.Write("</script>");
            }
        }

        //根据购物场所删除购物场所信息
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


                    MallInfoBLL _MallInfoBLL = new MallInfoBLL();
                    PicInfoBLL _PicInfoBLL = new PicInfoBLL();

                    if (_MallInfoBLL.DelMallInfoByID(delid))
                    {
                        isTrue = true;

                        DataTable PicDT = _PicInfoBLL.GetMallPic(delid);
                        if(PicDT.Rows.Count>0)
                        {
                            for (int j = 0; j < PicDT.Rows.Count;j++ )
                            {
                                int tempID = int.Parse(PicDT.Rows[j]["PicID"].ToString());
                                if (_PicInfoBLL.DelMallPic(tempID) && _PicInfoBLL.DelPicByID(tempID))
                                {
                                    isPicTrue = true;

                                }
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

                    if (isTrue == false||isPicTrue==false )
                    { break; }

                }
                if (!(isTrue == false || isPicTrue == false))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='MallInfoList.aspx?CityID=" + CityID.ToString() + "';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='MallInfoList.aspx?CityID" + CityID.ToString() + "';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='MallInfoList.aspx?CityID" + CityID.ToString() + "';");
                Response.Write("</script>");
            }
        }
    }
}
