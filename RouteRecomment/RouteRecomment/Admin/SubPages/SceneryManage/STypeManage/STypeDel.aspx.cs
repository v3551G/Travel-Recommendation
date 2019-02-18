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

namespace RouteRecomment.Admin.SubPages.SceneryManage.STypeManage
{
    public partial class STypeDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["TypeID"] == null || "".Equals(Request.QueryString["TypeID"])))
            {
                rqid = Request.QueryString["TypeID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
            else
            {

                Response.Write("<script language='javascript'>");
                Response.Write("document.location.href='STypeList.aspx';");
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
                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));


                    STypeBLL _STypeBLL = new STypeBLL();

                    if (_STypeBLL.DelSTypebyTID(delid) )
                    {
                        if (_STypeBLL.GetSceTypeCountByTID(delid) > 0)
                        {
                            if (_STypeBLL.DelSceneryType(delid))
                                isTrue = true;
                        }
                        else
                            isTrue = true;
                    }
                    else
                        isTrue = false;

                    if (isTrue == false)
                    { break; }

                }
                if (!(isTrue == false))
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除成功!');");
                    Response.Write("document.location.href='STypeList.aspx';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='STypeList.aspx';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='STypeList.aspx';");
                Response.Write("</script>");
            }
        }
    }
}
