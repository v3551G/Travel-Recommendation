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
using Model;
using Model.City;
using BLL.CityBLL;

namespace RouteRecomment.Admin.SubPages.City.CityInfo
{
    public partial class CityInfoAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {    
            CityInfoBLL _CityInfoBLL = new CityInfoBLL();
            Model.City.CityInfo _CityInfo = new Model.City.CityInfo();
            _CityInfo.CityName = this.txtCityName.Text.Trim();
            _CityInfo.Introduction = this.txtCityIntroduce.Text.Trim();

            bool IsExist = _CityInfoBLL.IsCityExist(this.txtCityName.Text.Trim());
            if (IsExist)
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('该市已经录入');");
                Response.Write("document.location.href='CityInfoList.aspx';");
                Response.Write("</script>");
            }

            else
            {
                if (_CityInfoBLL.AddCityInfo(_CityInfo))   //
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('添加成功');");
                    Response.Write("document.location.href='CityInfoList.aspx';");
                    Response.Write("</script>");

                }
                else 
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('添加失败');");
                    Response.Write("</script>");

                }
            }

        }

    }
}
