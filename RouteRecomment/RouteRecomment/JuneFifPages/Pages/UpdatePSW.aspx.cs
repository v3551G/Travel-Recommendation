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
    public partial class UpdataPSW : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connstr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
            SqlConnection connection = new SqlConnection(connstr );
            string sqlstr = "select * from UserInfo where UserAccount = @account";
            SqlCommand command = new SqlCommand(sqlstr,connection );
            command.Parameters.Add(new SqlParameter("@account",SqlDbType.VarChar,50));
            command.Parameters["@account"].Value=Session["UserAccount"].ToString();
            connection.Open();
            SqlDataReader dr = command.ExecuteReader();
            if(dr.Read())
            {
                txtAccount.Text = dr["UserAccount"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connstr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
            SqlConnection connection = new SqlConnection(connstr );
            string sqlstr = "select * from UserInfo where UserAccount = @account and UserPassWord = '" + txtPassWord.Text + "'";
            SqlCommand command = new SqlCommand(sqlstr,connection );
            command.Parameters.Add(new SqlParameter("@account",SqlDbType.VarChar,50));
            command.Parameters["@account"].Value = Session["UserAccount"].ToString();
            connection.Open();
            SqlDataReader dr = command.ExecuteReader();
            if (dr.Read())
            {
                string conns = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
                SqlConnection conn = new SqlConnection(conns);
                string upstr = "update UserInfo set UserPassWord = '" + txtNewPass.Text + "'where UserAccount = '" + Session["UserAccount"].ToString() + "'";
                SqlCommand comm = new SqlCommand(upstr,conn );
                conn.Open();
                //SqlCommand comm = new SqlCommand(upstr,connection );
                try
                {
                    comm.ExecuteNonQuery();
                    Response.Write("<script language ='javascript'>");
                    Response.Write("alert('修改成功！');");
                    Response.Write("</script>");
                }
                catch (Exception ex)
                {
                    Label3.Text = "修改失败，错误原因是：" + ex.Message;
                    Label3.Style["color"]= "red";
                }
                finally
                {
                    comm = null;
                    connection.Close();
                    connection = null;
                }
            }
            else
            {
                Response.Write("<script language = 'javascript'>");
                Response.Write("alert ('原密码输入不正确，请重新输入！');");
                Response.Write("</script>");
            }
        }

        //检测原密码
        public void checkpsw ()
        {

        }
    }
}