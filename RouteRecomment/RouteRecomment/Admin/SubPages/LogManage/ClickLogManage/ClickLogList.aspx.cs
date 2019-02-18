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

namespace RouteRecomment.Admin.SubPages.LogManage.ClickLogManage
{
    public partial class ClickLogList : System.Web.UI.Page
    {
        public DataTable LogDT;
        public ClickLogBLL _ClickLogBLL = new ClickLogBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownTypeBind();
                String Type;
                if (Request.QueryString["Type"] != "" && Request.QueryString["Type"] != null)
                {
                    Type = Request.QueryString["Type"].ToString();
                    if (Type != "全部日志")
                    {
                        LogDT = this._ClickLogBLL.GetClickLogSplit(this.AspNetPager4.PageSize, 1, Type);
                        this.AspNetPager4.RecordCount = this._ClickLogBLL.GetClickTypeCount(Type);
                    }
                    else
                    {
                        LogDT = _ClickLogBLL.GetLogSplit(this.AspNetPager4.PageSize, 1);
                        this.AspNetPager4.RecordCount = this._ClickLogBLL.GetLogCount();
                    }
                    for (int i = 0; i < DropDownType.Items.Count; i++)
                    {
                        if (DropDownType.Items[i].Text == Type)
                            this.DropDownType.SelectedValue = DropDownType.Items[i].Value;
                    }


                }
                else
                {
                    Type = this.DropDownType.SelectedItem.Text;
                    LogDT = _ClickLogBLL.GetLogSplit(this.AspNetPager4.PageSize, 1);
                    this.AspNetPager4.RecordCount = this._ClickLogBLL.GetLogCount();
                }
            }
        }

        private void DropDownTypeBind()
       {
           ListItem Item0 = new ListItem("全部日志", "0");
           ListItem Item1 = new ListItem("景点", "1");
           ListItem Item2 = new ListItem("酒店", "2");
           ListItem Item3 = new ListItem("购物", "3");
           ListItem Item4 = new ListItem("娱乐", "4");
           ListItem Item5 = new ListItem("美食", "5");

             this.DropDownType.Items.Add(Item0);
             this.DropDownType.Items.Add(Item1);
             this.DropDownType.Items.Add(Item2);
             this.DropDownType.Items.Add(Item3);
             this.DropDownType.Items.Add(Item4);
             this.DropDownType.Items.Add(Item5);
        
        }

        protected void DropDownType_SelectedIndexChanged(object sender, EventArgs e)
        {
            String TypeName = this.DropDownType.SelectedItem.Text;
            if (TypeName != "全部日志")
            {
                LogDT = this._ClickLogBLL.GetClickLogSplit(this.AspNetPager4.PageSize, 1, TypeName);
                this.AspNetPager4.RecordCount = this._ClickLogBLL.GetClickTypeCount(TypeName);
            }
            else
            {
                LogDT = _ClickLogBLL.GetLogSplit(this.AspNetPager4.PageSize, 1);
                this.AspNetPager4.RecordCount = this._ClickLogBLL.GetLogCount();
            }

            this.AspNetPager4.CurrentPageIndex = 1;

            
        }

        protected void AspNetPager4_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            int PageIndex = e.NewPageIndex;
            String TypeName = this.DropDownType.SelectedItem.Text;
            if (TypeName != "全部日志")
            {
                LogDT = this._ClickLogBLL.GetClickLogSplit(this.AspNetPager4.PageSize, PageIndex, TypeName);

            }
            else
            {
                LogDT = _ClickLogBLL.GetLogSplit(this.AspNetPager4.PageSize, 1);

            }
        }
    }
}
