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
    public partial class DragLogList : System.Web.UI.Page
    {
        public DataTable DragLogDT;
        public DragLogBLL _DragLogBLL = new DragLogBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DragLogDT = _DragLogBLL.DragLogSplit(AspNetPager4.PageSize,1);
                this.AspNetPager4.RecordCount = _DragLogBLL.GetDragLogCount();
            }
        }

        protected void AspNetPager4_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            int PageIndex = e.NewPageIndex;
            DragLogDT = _DragLogBLL.DragLogSplit(AspNetPager4.PageSize,PageIndex);
        }
    }
}
