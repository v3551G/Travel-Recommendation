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
    public partial class zhuce : System.Web.UI.Page
    {
        SqlConnection tr_conn;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string Validatecode = Session["ValidateCode"].ToString().ToUpper();
            //string InputCode = ValidateCode.Text.ToString().ToUpper();

            string str = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(str);
            tr_conn = new SqlConnection(str);
            sqlcon.Open();
            string checksql = "select * from UserInformation where UserAccount='" + txtAccount.Text + "'";
           // string checksql = "select *　from UserInformation where UserAccount='" + txtAccount.Text +"'";

            SqlCommand sqlcom = new SqlCommand(checksql,sqlcon);
            SqlDataReader dr = sqlcom.ExecuteReader();
            sqlcom.Connection = sqlcon;
            sqlcom.CommandText = "insert into UserInformation(UserAccount,UserName,UserSex,UserBirth,UserJiguan,UserTele) values (@account,@name,@sex,@birth,@jiguan,@tele)";
            sqlcom.Parameters.AddWithValue("@account",txtAccount.Text );
            sqlcom.Parameters.AddWithValue("@name",txtName.Text);
            sqlcom.Parameters.AddWithValue("@sex",txtSex.Text);
            sqlcom.Parameters.AddWithValue("@birth",txtBirth.Text);
            sqlcom.Parameters.AddWithValue("@jiguan",txtJiguan.Text);
            sqlcom.Parameters.AddWithValue("@tele",txtTele.Text);

            if(txtAccount.Text.Length == 0)
            {
                Response.Write("<script language ='javascript'>");
                Response.Write("alert('账号不为空！');");
                Response.Write("</script>");
            }
            else
            {
                if(dr.Read())
                {
                    Response.Write("<script language ='javascript'>");
                    Response.Write("alert('该账号已经存在！');");
                    Response.Write("</script>");
                }
                else
                {
                    dr.Close();
                    try
                    {
                        insert();
                        sqlcom.ExecuteNonQuery();
                        Response.Write("<script language ='javascript'>");
                        Response.Write("alert('恭喜您注册成功！');");
                        Response.Write("</script>");
                        Response.Redirect("Index.aspx");//注册之后是返回首页还是登录页？
                    }
                    catch(SqlException ex)
                    {
                        Label1.Text = "注册失败，错误原因是：" + ex.Message;
                        Label1.Style["color"] = "red";
                    }
                    finally
                    {
                        sqlcom = null;
                        sqlcon.Close();
                        sqlcon = null;
                    }
                }
            }
        }

        void insert()
        {
            string strsl = "insert into UserInfo(UserAccount,UserPassWord) values(@account,@password)";
            SqlCommand sqlcomm = new SqlCommand(strsl,tr_conn );
            sqlcomm.Parameters.AddWithValue("@account",txtAccount.Text);
            sqlcomm.Parameters.AddWithValue("@password",txtPassWord.Text);
            sqlcomm.Connection.Open();
            sqlcomm.ExecuteNonQuery();
            //if (txtSurePassWord.Text != txtPassWord.Text)
            //{
            //    Response.Write("<script language ='javascript'>");
            //    Response.Write("alert('两次密码不一致！');");
            //    Response.Write("</script>");
            //}
            //else
            //{
            //    sqlcomm.Connection.Close();
            //}
            sqlcomm.Connection.Close();
        }
    }
}