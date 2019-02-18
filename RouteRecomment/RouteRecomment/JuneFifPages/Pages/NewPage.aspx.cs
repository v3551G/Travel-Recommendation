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
using System.IO;

namespace RouteRecomment.JuneFifPages.Pages
{
    public partial class NewPage : System.Web.UI.Page
    {
        public String Stra;
        private String ReqStr;
        private String FileP;
        public String section = "";
        private String[] sectionStra;

        protected void Page_Load(object sender, EventArgs e)
        {
            ReqStr = Request.QueryString["FP"].ToString();

            String[] SplitStr = ReqStr.Split('|');
            FileP = SplitStr[0].Trim();
            Stra = GetTxt(FileP);

            if (Stra.Contains("Baidu Button END"))
            {
                //先从这个位置直接截取后面的内容

                int S = Stra.IndexOf("Baidu Button END");
                Stra = Stra.Substring(S + 16, Stra.Length - 16 - S);

            }
            Stra = Stra.Trim();


            /*
            for (int i = 0; i < SplitStr.Length - 1; i++)
            {
                String geshi = "<b style='color:Red;'>" + SplitStr[i + 1] + "</b>";
                if (Stra.Contains(SplitStr[i + 1]))
                    Stra = Stra.Replace(SplitStr[i + 1], geshi);

            }
         */
            //修改
            sectionStra = Stra.Split(' ');

            for (int i = 0; i < sectionStra.Length; i++)
            {

                section += "<p>&nbsp&nbsp" + sectionStra[i] + "</p>";
            }
            for (int i = 0; i < SplitStr.Length - 1; i++)
            {
                String geshi = "<b style='color:Red;'>" + SplitStr[i + 1] + "</b>";
                if (section.Contains(SplitStr[i + 1]))
                    section = section.Replace(SplitStr[i + 1], geshi);
            }

        }

        public String GetTxt(String FP)
        {
            StreamReader SR = new StreamReader(FP, System.Text.Encoding.Default);
            String Content = SR.ReadToEnd();
            SR.Close();
            return Content;
        }
    }
}
