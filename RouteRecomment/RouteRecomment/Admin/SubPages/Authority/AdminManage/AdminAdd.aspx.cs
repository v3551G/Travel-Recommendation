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
using Model;
using Model.Authority;

namespace RouteRecomment.Admin.SubPages.Authority.AdminManage
{
    public partial class AdminAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                RoleBind();
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {   
            //管理员表与管理员角色表都需要更新
            AdminInfo _AdminInfo = new AdminInfo();
            AdminRole _AdminRole = new AdminRole();
            AdminRoleBLL _AdminRoleBLL = new AdminRoleBLL();
            RoleBLL  _RoleBLL = new RoleBLL ();
            AdminInfoBLL _AdminInfoBLL = new AdminInfoBLL();
            int Num = _AdminInfoBLL.AdminExist(this.txtAccount.Text.Trim());
            if (Num > 0)
            { 
                Response.Write("<script language='javascript'>");
                Response.Write("alert('该账号已存在');");
                Response.Write("</script>");
                return;
            }

            _AdminInfo.AdminAccount = this.txtAccount.Text.Trim();
            _AdminInfo.PassWord = this.txtPass.Text.Trim();
            _AdminInfo.IsSYS = false;

            bool StepOne = _AdminInfoBLL.AddAdminInfo(_AdminInfo);


            _AdminRole.AdminID = _AdminInfoBLL.GetAdminID(txtAccount.Text.Trim());
            _AdminRole.RoleID = int.Parse(this.DropDownRole.SelectedValue.ToString());
            bool StepTwo = _AdminRoleBLL.AddAdminRole(_AdminRole);

            if (StepOne && StepTwo)
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='AdminList.aspx';");
                Response.Write("</script>");
            
            }
        }

        private void RoleBind()
        {
            RoleBLL _RoleBLL = new RoleBLL();
            DataTable DT = _RoleBLL.GetAllRoleInfo();
            DropDownRole.Items.Clear();
            DropDownRole.DataSource = DT;
            DropDownRole.DataTextField = "RoleName";
            DropDownRole.DataValueField = "RoleID";
            DropDownRole.DataBind();
       
        }
    }
}
