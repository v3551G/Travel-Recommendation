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
using BLL.LogBLL;

namespace RouteRecomment.Admin.SubPages.LogManage.DragLogManage
{
    public partial class DragLogDel : System.Web.UI.Page
    {
        private String rqid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Request.QueryString["ID"] == null || "".Equals(Request.QueryString["ID"])))
            {
                rqid = Request.QueryString["ID"];
                if (!Page.IsPostBack)
                {
                    deleteThis();
                }
            }
            else
            {

                Response.Write("<script language='javascript'>");
                Response.Write("document.location.href='DragLogList.aspx';");
                Response.Write("</script>");
            }
        }

        //根据拖拽日志ID删除日志
        protected void deleteThis()
        {
            try
            {
                Array delWitch = rqid.Split('|');
                bool isTrue = false;

                for (int i = 0; i < delWitch.Length - 1; i++)
                {
                    int delid = Convert.ToInt32(delWitch.GetValue(i));


                    DragLogBLL _DragLogBLL = new DragLogBLL();


                    if (_DragLogBLL.DelDragLog(delid))
                    {
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
                    Response.Write("document.location.href='DragLogList.aspx';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('删除失败!');");
                    Response.Write("document.location.href='DragLogList.aspx';");
                    Response.Write("</script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('删除失败!');");
                Response.Write("document.location.href='DragLogList.aspx';");
                Response.Write("</script>");
            }
        }
    }
}
