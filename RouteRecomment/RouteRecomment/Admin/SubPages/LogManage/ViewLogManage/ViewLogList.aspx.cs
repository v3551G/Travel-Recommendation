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

namespace RouteRecomment.Admin.SubPages.LogManage.ViewLogManage
{
    public partial class ViewLogList : System.Web.UI.Page
    {
        public DataTable ViewLogDT;
        public ViewLogBLL _ViewLogBLL = new ViewLogBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ViewLogDT = this._ViewLogBLL.GetViewLogSplit(1,this.AspNetPager4.PageSize);
                this.AspNetPager4.RecordCount = this._ViewLogBLL.GetViewLogCount();
            }
        }

        protected void AspNetPager4_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            int PageIndex = e.NewPageIndex;
            ViewLogDT = this._ViewLogBLL.GetViewLogSplit(PageIndex,this.AspNetPager4.PageSize);
        }
    }
}
