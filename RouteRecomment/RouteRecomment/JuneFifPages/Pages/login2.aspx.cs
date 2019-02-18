using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using BLL.UserBLL;

namespace RouteRecomment.JuneFifPages.Pages
{
    public partial class login2 : System.Web.UI.Page
    {
        SqlConnection tr_conn;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Validatacode = Session["ValidateCode"].ToString().ToUpper();
            string InputCode = ValidateCode.Text.ToString().ToUpper();

            if (UserAccount.Text.Length == 0)
            {
                Response.Write("<script language ='javascript'>");
                Response.Write("alert('请输入账号');");
                Response.Write("</script>");
            }
            else
            {
                if (UserPassWord.Text.Length == 0)
                {
                    Response.Write("<script language ='javascript'>");
                    Response.Write("alert('请输入密码！');");
                    Response.Write("</script>");
                }
                else if (ValidateCode.Text.Length == 0)
                //if (Session["ValidateCode"] == null)
                {
                    Response.Write("<script language ='javascript'>");
                    Response.Write("alert('请输入验证码');");
                    Response.Write("</script>");
                }
                else if (Validatacode != InputCode)
                //if (ValidateCode.Text.ToString().ToUpper() != Session["ValidateCode"].ToString().ToUpper())
                {
                    Response.Write("<script language ='javascript'>");
                    Response.Write("alert('对不起，验证码不正确，请重新输入！');");
                    Response.Write("</script>");
                }
                else if (Validatacode == InputCode)
                //if (ValidateCode.Text.ToString().ToUpper() == Session["ValidateCode"].ToString().ToUpper())
                {
                    string str = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
                    SqlConnection sqlcon = new SqlConnection(str);
                    tr_conn = new SqlConnection(str);
                    tr_conn.Open();
                    string sqlstr = "select * from UserInfo where UserAccount='" + UserAccount.Text + "'and UserPassWord='" + UserPassWord.Text + "'";
                    SqlCommand tr_comm = new SqlCommand(sqlstr, tr_conn);
                    SqlDataReader tr_dreader = tr_comm.ExecuteReader();
                    if (tr_dreader.Read())
                    {
                        Session["UserAccount"] = tr_dreader["UserAccount"];
                        Session["UserPassWord"] = tr_dreader["UserPassWord"];
                        Response.Write("<script language ='javascript'>");
                        Response.Write("alert('登录成功！');");
                        Response.Write("</script>");
                        Response.Redirect("SubPage.aspx");
                    }
                    else
                    {
                        Response.Write("<script language ='javascript'>");
                        Response.Write("alert('登录失败！');");
                        Response.Write("</script>");
                    }
                    tr_conn.Close();
                }
                else
                {
                    Response.Write("<script language ='javascript'>");
                    Response.Write("alert('用户不存在和密码不正确！');");
                    Response.Write("</script>");
                }
            }
        }
    }
}