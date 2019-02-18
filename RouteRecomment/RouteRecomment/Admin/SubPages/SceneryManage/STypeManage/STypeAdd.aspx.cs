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
using Model.Scenery;
using BLL.Scenery;

namespace RouteRecomment.Admin.SubPages.SceneryManage.STypeManage
{
    public partial class STypeAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            SType _SType = new SType();
            STypeBLL _STypeBLL = new STypeBLL();
            _SType.TypeName = this.txtTypeName.Text.Trim();

            if (_STypeBLL.AddSType(_SType))
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='STypeList.aspx';");
                Response.Write("</script>");
            }
            else
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加失败');");
                Response.Write("document.location.href='STypeList.aspx';");
                Response.Write("</script>");
            }
        }
    }
}
