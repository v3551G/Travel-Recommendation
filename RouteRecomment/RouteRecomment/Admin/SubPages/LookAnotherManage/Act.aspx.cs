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
using BLL.LookAnotherBLL;
using BLL.Algorithm;

namespace RouteRecomment.Admin.SubPages.LookAnotherManage
{
    public partial class Act : System.Web.UI.Page
    {
        private String id;
        private SeeCountBLL _SeeCountBLL = new SeeCountBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"].ToString();

            if (id =="Scenery")
            {
                UpdScenery();
            }
            else if (id == "Hotel")
            {
                UpdHotel();
            }
            else if (id == "Mall")
            {
                UpdMall();
            }
            else if (id == "Enter")
            {
                UpdEnter();
            }
            else if (id == "Res")
            {
                UpdRes();
            }
            
        }

        private void UpdScenery()
        {
            if (_SeeCountBLL.UpdScenerySeeAndSee())
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('景点看了又看更新成功');");
                Response.Write("</script>");
            
            }
        
        }

        private void UpdHotel()
        {
            if (_SeeCountBLL.UpdHotelSeeAndSee())
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('酒店看了又看更新成功');");
                Response.Write("</script>");

            }
        
        }

        private void UpdMall()
        {
            if (_SeeCountBLL.UpdMallSeeAndSee())
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('购物看了又看更新成功');");
                Response.Write("</script>");

            }

        }

        private void UpdEnter()
        {
            if (_SeeCountBLL.UpdEnterSeeAndSee())
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('娱乐看了又看更新成功');");
                Response.Write("</script>");

            }

        }

        private void UpdRes()
        {
            if (_SeeCountBLL.UpdResSeeAndSee())
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('餐馆看了又看更新成功');");
                Response.Write("</script>");

            }

        }
    }
}
