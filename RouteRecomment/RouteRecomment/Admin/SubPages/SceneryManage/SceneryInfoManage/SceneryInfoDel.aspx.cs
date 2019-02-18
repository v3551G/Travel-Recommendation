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
using BLL.Scenery;
using BLL.PicBLL;

namespace RouteRecomment.Admin.SubPages.SceneryManage.SceneryInfoManage
{
    public partial class SceneryInfoDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["SceneryID"] == null || "".Equals(Request.QueryString["SceneryID"])))
            {
                rqid = Request.QueryString["SceneryID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
            else
            {

                Response.Write("<script language='javascript'>");
                Response.Write("document.location.href='SceneryInfoList.aspx';");
                Response.Write("</script>");
            }
        }

        //根据市ID删除市信息
        protected void deleteThis()
        {
            try
            {
                Array delWitch = rqid.Split('|');
                bool isTrue = false;
                bool isPicTrue = false;
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));


                    SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
                    PicInfoBLL _PicInfoBLL = new PicInfoBLL ();
                    STypeBLL _STypeBLL = new STypeBLL();
                    DataTable ScePicDT;
                    

                    if (_SceneryInfoBLL.DelScenery(delid))
                    {
                        if (_STypeBLL.GetSceTypeCount(delid)>0)
                        {
                            if (_STypeBLL.DelSType(delid))
                                isTrue = true;
                        }
                        else
                            isTrue = true;

                        //加入删除图片信息
                        ScePicDT = _PicInfoBLL.GetPicBySceID(delid);
                        if (ScePicDT.Rows.Count > 0)
                        {
                            for (int j = 0; j < ScePicDT.Rows.Count; j++)
                            {
                                int PicTempID = int.Parse(ScePicDT.Rows[j]["PicID"].ToString());
                                if (_PicInfoBLL.DelPicByID(PicTempID)&&_PicInfoBLL.DelScePicByID(PicTempID))
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
                    Response.Write("document.location.href='SceneryInfoList.aspx';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='SceneryInfoList.aspx';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='SceneryInfoList.aspx';");
                Response.Write("</script>");
            }
        }
    }
}
