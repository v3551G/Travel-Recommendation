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
using BLL.Scenery;

namespace RouteRecomment.JuneThirdPages.Pages
{
    public partial class RotesNormal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RotesNormalAlg();
            this.TextBox1.Text = "完成";
        }

        //景点在数据库中信息不充分的景点名去掉
        public void RotesNormalAlg()
        {
            String OrgFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\5420Rotes.txt";
            String UseFulFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\Stragegy\\FilterRotes.txt";

            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            DataTable DT;
            StreamReader SR = new StreamReader(OrgFP);
            StreamWriter SW = new StreamWriter(UseFulFP);
            //如果路线中包含在数据库中没有的景点 或者 该景点在数据库中数据不充分则去掉该路线
            string Line = "";
            String[] SceList;
            bool IsUseFul = true;
            while ((Line = SR.ReadLine()) != null)
            {    
                IsUseFul = true;
                SceList = Line.Split(' ');
                for(int i=0;i<SceList.Length;i++)
                {
                    DT = _SceneryInfoBLL.GetSlaSLonBySceName(SceList[i]);
                    if (DT.Rows.Count == 0)
                    {
                        IsUseFul = false;
                        break;
                    }
                }

                if (IsUseFul)
                    SW.WriteLine(Line);
            }


            SR.Close();
            SW.Close();
        }
    }
}
