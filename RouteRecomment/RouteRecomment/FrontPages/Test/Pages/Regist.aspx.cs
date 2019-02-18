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
using System.Web.Services;
using System.Text.RegularExpressions;
using BLL.UserBLL;
using Model.User;
using System.Net.Mail;
using System.Net;

namespace RouteRecomment.FrontPages.Test.Pages
{
    public partial class Regist : System.Web.UI.Page
    {
        private static bool AccountFormat = false;
        private static bool EmailFormat = false;
        private static bool NickNameFormat = false;
        private static bool PassWordFormat = false;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.ScriptManager1.EnablePageMethods = true;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 检查用户的账号是否合法1.是否是3-10个字符 2.该账号是否存在
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string CheckUserAccount(string txtAccount)
        {
            Regex AccountRegex = new Regex(@"\w{3,5}");
            string Account = txtAccount.Trim();
            bool flagFormal = Regex.IsMatch(Account, @"^\w{3,10}$");

            if (flagFormal)
            {
                //检测账号是否重复
                UserInfoBLL _UserInfoBLL = new UserInfoBLL();
                int IsExist = _UserInfoBLL.IsAccountExist(Account);
                if (IsExist == 0)//不存在
                {
                    AccountFormat = true;
                    return "Access";
                }
                AccountFormat = false;
                return "该账号已经存在";

            }
            AccountFormat = false;
            return "账号是3-10个字符，请按指定的格式注册账号";


        }
        [WebMethod]
        public static string CheckUserEmail(string txtEmail)
        {
            string Email = txtEmail.Trim();
            bool flagFormat = Regex.IsMatch(Email, @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");

            if (flagFormat) //邮箱是否符合指定的格式
            {
                //验证该邮箱是否已用来注册过
                UserInfoBLL _UserInfoBLL = new UserInfoBLL();
                int IsExist = _UserInfoBLL.IsUserEmailExist(Email);
                if (IsExist == 0)//未注册
                {
                    EmailFormat = true;
                    return "Access";
                }
                EmailFormat = false;
                return "该邮箱已经注册过";            }

            EmailFormat = false;

            return "请按输入正确的邮箱格式";


        }
        [WebMethod]
        public static string ChcekNickName(string txtNickName)
        {
            string NickName = txtNickName.Trim();
            bool flagFormat = Regex.IsMatch(NickName, @"^\w{3,10}$");

            if (flagFormat) //符合要求
            {
                NickNameFormat = true;
                return "Access";

            }
            NickNameFormat = false;
            return "昵称是3-10个字符，按指定要求输入昵称";

        }
        [WebMethod]
        public static string ChcekPassWord(string txtNickName)
        {
            string PassWord = txtNickName.Trim();
            bool flagFormat = Regex.IsMatch(PassWord, @"^\w{6,16}$");

            if (flagFormat)//符合格式
            {
                PassWordFormat = true;
                return "Access";
            }
            PassWordFormat = false;
            return "密码是6-16个字符组成，请按指定格式输入密码";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (AccountFormat && EmailFormat && NickNameFormat && PassWordFormat)
            {
                UserInfoBLL _UserInfoBLL = new UserInfoBLL();
                UserInfo _User = new UserInfo();
                _User.NickName = NickName.Value.Trim();
                _User.UserAccount = Account.Value.Trim();
                _User.UserEmail = Email.Value.Trim();
                _User.UserPassWord = PassWord.Value.Trim();
                _User.IsActive = 0;
                bool Flag = _UserInfoBLL.AddUser(_User);
                if (Flag)
                {
                    string AlivationCode = Guid.NewGuid().ToString();
                    _UserInfoBLL.UpdateUserByAccount(_User.UserAccount, AlivationCode);
                    if (SendMail(AlivationCode))
                    {

                        Response.Write("<script language='javascript'>");
                        Response.Write("alert('请到邮箱验证');");
                        Response.Write("</script>");
                        return;
                    }
                }
                else
                {
                    Response.Write("<script language='javascript'>");
                    Response.Write("alert('注册失败');");
                    //Response.Write("document.location.href='admin_newsList.aspx?id=" + ids + "';");
                    Response.Write("</script>");
                    return;
                }
            }

        }

        private bool SendMail(string AlivationCode)
        {
            
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("lz1002621044@163.com");   //发件人的邮箱地址
            msg.Subject = "*欢迎您的注册" + NickName.Value.Trim() + "*";  //邮件主题
            msg.Body = "<a href='http://localhost:1991/FrontPages/Test/Pages/ConfirmEmail.aspx?CheckNum=" + AlivationCode + "'>点击激活您的账号</a>";//邮件正文
            msg.To.Add(Email.Value.Trim());
            msg.IsBodyHtml = true;  //邮件正文是否支持html的值
            SmtpClient sc = new SmtpClient();
            sc.Host = "smtp.163.com";
            sc.Port = 25;
            NetworkCredential nc = new NetworkCredential("lz1002621044@163.com","www1991418");  //验证凭据 1607977350：是邮箱账号，********：是邮箱密码
            sc.Credentials = nc;
            try
            {
                sc.Send(msg);
            }
            catch
            {
                return false;
            }
            return true;
        }
    }
}
