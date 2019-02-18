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

namespace RouteRecomment.FrontPages.Test.Pages.用户IP
{
    public partial class IP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          String ip=  getiptest();
        }


        /// <summary>     
        /// 获得用户“真实IP”    
        /// </summary>   
        
         public  string GetUserIp()    
         {         
             string ip = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];          
             if (System.String.IsNullOrEmpty(ip))      
             {              
                 ip = System.Web.HttpContext.Current.Request.UserHostAddress;   
             }        
             else      
             {              
                 ip = ip.ToString();      
                 string pattern = @"^((2[01]\d|22[0-3]|1\d{2}|[1-9]\d|[1-9])\.)((25[0-5]|2[0-4]\d|1?\d{1,2})\.){2}((25[0-5]|2[0-4]\d|1?\d{1,2}))$";     
                 if (!Regex.IsMatch(ip, pattern))        
                 {               
                     ip = "0.0.0.0";       
                 }      
             }
             Response.Write("<script language='javascript'>");
             Response.Write(ip);
             Response.Write("</script>");
             return ip;     
         }

         public String GetIp()
         {
             string ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
             if (null == ip || ip == String.Empty)
             {
                 ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
             }
             if (null == ip || ip == String.Empty)
             {
                 ip = HttpContext.Current.Request.UserHostAddress;
             }
             return ip;
         
         }
         public String GetIP()
         {
             String ip;
             if (Context.Request.ServerVariables["HTTP_VIA"] != null) // 服务器， using proxy 
             {
                 //得到真实的客户端地址
               ip = Context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();  // Return real client IP. 
             }
             else//如果没有使用代理服务器或者得不到客户端的ip  not using proxy or can't get the Client IP 
             {

                 //得到服务端的地址 
                 ip = Context.Request.ServerVariables["REMOTE_ADDR"].ToString(); //While it can't get the Client IP, it will return proxy IP. 
             }
             return ip;
         }

         public String getiptest()
         {
             //string loginIP = Request.UserHostAddress;
             string loginIP=Page.Request.UserHostAddress;

             return loginIP;
         }
    }
}
