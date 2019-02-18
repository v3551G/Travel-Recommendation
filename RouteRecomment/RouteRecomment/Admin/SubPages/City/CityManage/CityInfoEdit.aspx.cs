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
using BLL.CityBLL;

namespace RouteRecomment.Admin.SubPages.City.CityInfo
{
    public partial class CityInfoEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if(!IsPostBack)
             {
                 this.Bind();
             }
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            Model.City.CityInfo _CityInfo = new Model.City.CityInfo();

            _CityInfo.CityName = this.txtCityName.Text.Trim();
            _CityInfo.Introduction = this.txtCityIntroduce.Text.Trim();

            CityInfoBLL _CityInfoBLL = new CityInfoBLL();

            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            if (_CityInfoBLL.UpdateCityInfoBy(CityID, _CityInfo))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('更改成功');");
                Response.Write("document.location.href='CityInfoList.aspx';");
                Response.Write("</script>");
                    
            }
        }

        private void Bind()
        { 
           //绑定数据
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
            CityInfoBLL _CityInfoBLL = new CityInfoBLL();
            DataTable DT = _CityInfoBLL.GetCityInfoByID(CityID);
            this.txtCityName.Text = DT.Rows[0]["CityName"].ToString();
            this.txtCityIntroduce.Text = DT.Rows[0]["Introduction"].ToString();               
        }
    }
}
