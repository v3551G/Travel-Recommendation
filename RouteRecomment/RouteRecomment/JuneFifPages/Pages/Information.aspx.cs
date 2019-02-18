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
    public partial class Information : System.Web.UI.Page
    {
        SqlConnection sqlcon;
        SqlCommand sqlcom;
        SqlConnection tr_con;
        string tr_conn = "Data Source=(local);UID=sa;PWD=123456;DATABASE=V3_Tourism_DB";
        protected void Page_Load(object sender, EventArgs e)
        {
          //SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ConnectionString);
         // SqlCommand command = new SqlCommand("select * from [UserInformation] where UserAccount = @account", connection);
            string connstr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
            SqlConnection connection = new SqlConnection(connstr );
            string sqlstr = "select * from UserInformation where UserAccount = @account";
            SqlCommand command = new SqlCommand(sqlstr,connection );
            command.Parameters.Add(new SqlParameter("@account",SqlDbType.VarChar,50));
            command.Parameters["@account"].Value = Session["UserAccount"].ToString();
            connection.Open();
            SqlDataReader dr = command.ExecuteReader();
            if(dr.Read())
            {
                txtAccount.Text = dr["UserAccount"].ToString();
                txtName.Text = dr["UserName"].ToString();
                txtSex.Text = dr["UserSex"].ToString();
                txtBirth.Text = dr["UserBirth"].ToString();
                txtJiguan.Text = dr["UserJiguan"].ToString();
                txtTele.Text = dr["UserTele"].ToString();
            }
      
        }
        //修改个人信息
        protected void Button1_Click(object sender, EventArgs e)
        {
            int intUpdateCount;
            string str = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(str);
            string strsql = "update UserInformation set UserName=@name,UserSex=@sex,UserBirth=@birth,UserJiguan=@jiguan,UserTele=@tele where UserAccount=@account";
            SqlCommand sqlcom = new SqlCommand(strsql, sqlcon);
            sqlcom.Parameters.Add(new SqlParameter("@account", SqlDbType.VarChar, 50));
            sqlcom.Parameters["@account"].Value = Session["UserAccount"].ToString();
            sqlcon.Open();

            //sqlcom.Parameters.AddWithValue("@name", txtName.Text);
            String newname = Request.Form["txtName"].ToString();
            sqlcom.Parameters.AddWithValue("@name", newname);

          //  sqlcom.Parameters.AddWithValue("@sex", txtSex.Text);
            string newsex = Request.Form["txtSex"].ToString();
            sqlcom.Parameters.AddWithValue("@sex", newsex);

        //    sqlcom.Parameters.AddWithValue("@birth", txtBirth.Text);
            string newbirth = Request.Form["txtBirth"].ToString();
            sqlcom.Parameters.AddWithValue("@birth",newbirth );

           // sqlcom.Parameters.AddWithValue("@jiguan", txtJiguan.Text);
            string newjiguan = Request.Form["txtJiguan"].ToString();
            sqlcom.Parameters.AddWithValue("@jiguan",newjiguan );

           // sqlcom.Parameters.AddWithValue("@tele", txtTele.Text);
            string newtele = Request.Form["txtTele"].ToString();
            sqlcom.Parameters.AddWithValue("@tele",newtele );

            try
            {
                intUpdateCount = sqlcom.ExecuteNonQuery();
                if (intUpdateCount > 0)
                {
                    Response.Write("<script language ='javascript'>");
                    Response.Write("alert('修改成功！');");
                    Response.Write("</script>");
                    Response.Redirect("Information.aspx");
                }
                else
                {
                    Response.Write("<script language ='javascript'>");
                    Response.Write("alert('该账号信息不存在！');");
                    Response.Write("</script>");
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "修改失败，错误原因是" + ex.Message;
                Label1.Style["color"] = "red";
            }
            finally
            {
                sqlcom = null;
                sqlcon.Close();
                sqlcon = null;
            }

            // Response.Write("名字是：" + txtUsername.Text);
        }
        //修改密码
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdatePSW.aspx");
        }
        //退出登录
        protected void Button3_Click(object sender, EventArgs e)
        {
            Session.Remove("UserAccount");
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Index.aspx");
        }

    }
}