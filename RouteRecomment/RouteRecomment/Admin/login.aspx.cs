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

namespace RouteRecomment.Admin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ibtnLogin_Click(object sender, ImageClickEventArgs e)
        {
            String IsEmpty = CheckEmpty();

            //验证用户信息
            AdminInfoBLL _AdminInfoBLL = new AdminInfoBLL();
            int IsExist = _AdminInfoBLL.CheckLoginInfo(this.txtAccount.Text,this.txtPass.Text);
            
            //验证码核查
            String ValidateCode = Session["ValidateCode"].ToString().ToUpper();
            String _InPutCode = this.txtValidate.Text.ToString().ToUpper();

            if (IsEmpty != "")
                this.errorlbl.Text = IsEmpty;
            else if (IsExist == 0)
            {   
                               
              this.errorlbl.Text = "该用户不存在";
            
            }
            else if (ValidateCode != _InPutCode)
            {
                //检验验证码
              this.errorlbl.Text = "验证码错误";
            }
            else
            { 
              //记录RoleID、记录IsSYS、页面跳转
                RoleBLL _RoleBLL = new RoleBLL ();
                //系统管理员无角色
               // Session["RoleID"] = _RoleBLL.GetRoleIDByAccount(this.txtAccount.Text);
                Session["AdminID"] = _AdminInfoBLL.GetAdminID(this.txtAccount.Text);
                Session["IsSYS"] = _AdminInfoBLL.IsSys(this.txtAccount.Text,this.txtPass.Text);
                Response.Redirect("index.aspx");
            }
            return;
        }

        private String CheckEmpty()
        {
            String Result = "";

            if (this.txtAccount.Text == "")
                Result = "账号不能为空";
            else if (this.txtPass.Text == "")
                Result = "密码不能为空";
            else if (this.txtValidate.Text == "")
                Result = "验证码不能为空";

            return Result;
        }
    }
}
