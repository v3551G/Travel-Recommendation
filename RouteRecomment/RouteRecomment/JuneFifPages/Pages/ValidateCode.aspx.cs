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
using System.Drawing;

namespace RouteRecomment.JuneFifPages.Pages
{
    public partial class ValidateCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ValidateCode = GetRandomCode(4);
            Session["ValidateCode"] = ValidateCode;
            SetPageNoCache();
            CreateImage(ValidateCode);
        }

        ///<summary>
        ///设置页面不被缓存
        ///</summary>
        private void SetPageNoCache()
        {
            Response.Buffer = true;
            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AppendHeader("Pargma","No_Cache");
        }

        private string CreateRandomCode(int codeCount)
        {
            string allChar = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
            string[] allCharArray = allChar.Split(',');
            string randomCode = "";
            int temp = -1;

            Random rand = new Random();
            for (int i = 0; i < codeCount; i++ )
            {
                if (temp !=-1)
                {
                    rand = new Random(i * temp *((int)DateTime .Now.Ticks ));
                }
                int t = rand.Next(35);
                if (temp == t)
                {
                    return CreateRandomCode(codeCount );//性能问题
                }
                temp = t;
                randomCode += allCharArray[t];
            }
            return randomCode;
        }

        private string GetRandomCode(int CodeCount)
        {
            string allChar = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
            string[] allCharArray = allChar.Split(',');
            string RandomCode = "";
            int temp = -1;

            Random rand = new Random();
            for (int i = 0; i < CodeCount;i ++ )
            {
                if (temp != -1)
                {
                    rand = new Random(temp * i * ((int)DateTime.Now.Ticks));
                }

                int t = rand.Next(33);

                while (temp == t )
                {
                    t = rand.Next(33);
                }

                temp = t;
                RandomCode +=allCharArray [t];
            }

            return RandomCode;
        }

        private void CreateImage(string checkCode)
        {
            int iwidth = (int) (checkCode.Length * 14);
            System.Drawing.Bitmap image = new System.Drawing.Bitmap(iwidth,20);
            Graphics g = Graphics.FromImage(image);
            g.Clear(System.Drawing.ColorTranslator.FromHtml("#99C1CB"));//背景色
            Font f = new System.Drawing.Font("Arial",10);
            Brush b = new System.Drawing.SolidBrush(Color.Black );
            Brush r = new System.Drawing.SolidBrush(Color.FromArgb(166,8,8));

            char[] ch = checkCode.ToCharArray();
            for (int i = 0; i < ch.Length;i++ )
            {
                if(ch[i ] >='0' && ch[i] <='9')
                {
                    //数字用红色显示
                    g.DrawString(ch[i].ToString(),f,r,3+(i * 12),3);
                }
                else
                {
                    //字母用黑色显示
                    g.DrawString(ch[i].ToString(),f,b,3+(i * 12),3);
                }
            }

            //for循环用来生成一些随机的水平线
            //            Pen blackPen = new Pen(Color.Black, 0);
            //            Random rand = new Random();
            //            for (int i=0;i<5;i++)
            //            {
            //                int y = rand.Next(image.Height);
            //                g.DrawLine(blackPen,0,y,image.Width,y);
            //            }
  
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            image.Save(ms,System.Drawing.Imaging.ImageFormat.Jpeg);
            //history back 不重复
            Response.Cache.SetNoStore();
            Response.ClearContent();
            Response.ContentType = "image/Jpeg";
            Response.BinaryWrite(ms.ToArray());
            g.Dispose();
            image.Dispose();
        }
    }
}