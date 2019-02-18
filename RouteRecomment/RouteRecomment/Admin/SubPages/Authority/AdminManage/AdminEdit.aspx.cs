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
    public partial class AdminEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {  
            if(!IsPostBack)
            {
                if ((Boolean)Session["IsSYS"] == true )
                {
                    string _AdminID = Request.QueryString["AdminID"].ToString();
                    int AdminID = int.Parse(_AdminID);
                    AdminInfoBind(AdminID);
                    AdminRoleBind(AdminID);
                }
                else
                    Response.Redirect("../../NotAllowed.aspx");
            }
            
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            AdminInfoBLL _AdminInfoBLL = new AdminInfoBLL();
            AdminInfo _AdminInfo = new AdminInfo();

            _AdminInfo.AdminAccount = this.txtAccount.Text;
            _AdminInfo.PassWord = this.txtPass.Text;
            string _AdminID = Request.QueryString["AdminID"].ToString();
            int AdminID = int.Parse(_AdminID);
            

            _AdminInfo.IsSYS = _AdminInfoBLL.IsSys(AdminID);

            if (_AdminInfo.IsSYS)
            {
                if (_AdminInfoBLL.UpdateAdminInfo(AdminID, _AdminInfo))
                {

                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('更新成功');");
                    Response.Write("document.location.href='AdminList.aspx';");
                    Response.Write("</script>");
                }
            }
            else
            {
                int RoleID = int.Parse(DropDownRole.SelectedValue.ToString());             
                AdminRoleBLL _AdminRoleBLL = new AdminRoleBLL();

                bool StepOne = false;
                bool StepTwo = false;
                if (_AdminInfoBLL.UpdateAdminInfo(AdminID, _AdminInfo))
                
                    StepOne = true;
                               
                
                int AdminRoleCount = _AdminRoleBLL.GetCountByAdminID(AdminID);

                if (AdminRoleCount > 0)
                {
                    if (_AdminRoleBLL.UpdateAdminRole(AdminID, RoleID))
                        StepTwo = true;
                }
                else
                {  
                    AdminRole _AdminRole = new AdminRole();
                    _AdminRole.AdminID = AdminID;
                    _AdminRole.RoleID = RoleID;
                    if (_AdminRoleBLL.AddAdminRole(_AdminRole))
                        StepTwo = true;
                
                }
                  

                if (StepOne && StepTwo)
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('更新成功');");
                    Response.Write("document.location.href='AdminList.aspx';");
                    Response.Write("</script>");
                }
            }
            
        }
        
        //管理员账号密码绑定
        private void AdminInfoBind(int AdminID)
        {  
           AdminInfoBLL _AdminInfoBLL = new AdminInfoBLL();
           DataTable DT = _AdminInfoBLL.GetAdminInfoByID(AdminID);
           this.txtAccount.Text = DT.Rows[0]["AdminAccount"].ToString();
           this.txtPass.Text = DT.Rows[0]["AdminPass"].ToString();
        
        }

        //管理员角色绑定
        private void AdminRoleBind(int AdminID)
        {   
            AdminInfoBLL _AdminInfoBLL = new AdminInfoBLL();
            bool IsSys = _AdminInfoBLL.IsSys(AdminID);
            if (IsSys)
            {
                this.DropDownRole.Items.Clear();
                ListItem item = new ListItem("系统管理员");
                this.DropDownRole.Items.Add(item);
                this.DropDownRole.Enabled = false;
            }
            else
            { 
                //与角色表中的数据绑定
                RoleBLL _RoleBLL = new RoleBLL();
                DataTable DT = _RoleBLL.GetAllRoleInfo();
                DropDownRole.Items.Clear();
                DropDownRole.DataSource = DT;
                DropDownRole.DataTextField = "RoleName";
                DropDownRole.DataValueField = "RoleID";
                DropDownRole.DataBind();

                //获得当前编辑对象的管理角色个数
                AdminRoleBLL _AdminRoleBLL= new AdminRoleBLL ();
                int AdminRoleCount = _AdminRoleBLL.GetCountByAdminID(AdminID);
                if (AdminRoleCount > 0)
                {
                    int RoleID = _RoleBLL.GetRoleIDByAdminID(AdminID);
                    DropDownRole.SelectedValue = RoleID.ToString();
                }


            }
        
        }
    }
}
