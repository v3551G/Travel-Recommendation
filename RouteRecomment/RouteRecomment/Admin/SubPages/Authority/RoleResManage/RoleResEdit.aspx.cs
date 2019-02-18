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
using BLL.AuthorityBLL;
using Model.Authority;

namespace RouteRecomment.Admin.SubPages.Authority.RoleResManage
{
    public partial class RoleResAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Bind();
            }
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            String RoleResName = Request.QueryString["RoleResName"].ToString();
            int RoleID = int.Parse(Request.QueryString["RoleID"].ToString());
            
            //若原来没有则新增
            //若原来已分配资源则更新
            int ResID = int.Parse(this.DropDownRes.SelectedValue.ToString());
            RoleResourceBLL _RoleResourceBLL = new RoleResourceBLL();
            RoleResource _RoleResource = new RoleResource();
            _RoleResource.RoleID = RoleID;
            _RoleResource.ResourceID = ResID;
            bool IsTrue = false;

            if("".Equals(RoleResName))   //原来没有，新增
            {
                if(_RoleResourceBLL.AddRoleResource(_RoleResource))
                {
                    IsTrue = true;
                }
            }
            else     //原来有，更新
            {
                if (_RoleResourceBLL.UpdateRoleRes(RoleID, ResID))
                {
                    IsTrue = true;
                }
               
            }

            if (IsTrue)
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('更新成功');");
                Response.Write("document.location.href='RoleResList.aspx';");
                Response.Write("</script>");
            }
            else
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('更新失败');");
                Response.Write("</script>");
            
            }

        }

        private void Bind()
        {    
            RoleBLL _RoleBLL = new RoleBLL ();
            ResourceBLL _ResourceBLL = new ResourceBLL ();
            //角色名绑定
            int RoleID = int.Parse(Request.QueryString["RoleID"].ToString());
            String RoleResName = Request.QueryString["RoleResName"].ToString();

            String RoleName = _RoleBLL.GetRoleNameByRoleID(RoleID);
            this.txtRole.Text = RoleName;
            this.txtRole.Enabled = false;
            
            //绑定DropDownList
            DataTable DT = _ResourceBLL.GetAllResource();
            DropDownRes.Items.Clear();
            DropDownRes.DataSource = DT;
            DropDownRes.DataTextField = "ResourceName";
            DropDownRes.DataValueField = "ResourceID";
            DropDownRes.DataBind();

            //锁定到当前资源名

            if ("" != RoleResName)
            {
                int ResID = _ResourceBLL.GetIDByResName(RoleResName);
                this.DropDownRes.SelectedValue = ResID.ToString();
            }
        }
    }
}
