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

namespace RouteRecomment.JuneFifPages.Pages
{
    public partial class LvMaMaTotal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdLvMamaScore();
            this.TextBox1.Text = "执行完成";
        }

        public void UpdLvMamaScore()
        {
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            String FileFP = "F:\\网站代码2014\\大家的进度\\潘英杰经纬度数据\\景点总体评论.txt";
            StreamReader SR = new StreamReader(FileFP);
            String Line = "";
            String[] TempStr;
            while((Line=SR.ReadLine())!=null)
            {
                if (Line != "")
                {
                    TempStr = Line.Trim().Split(' ');
                    if (TempStr[1] != "NULL")
                    {
                        int TotalGradID = int.Parse(TempStr[0]);
                        float TotalScore = float.Parse(TempStr[1]);
                        _SceneryInfoBLL.UpdLvMaMaTotalGrade(TotalGradID,TotalScore);
                    }
                }
            }

            SR.Close();
        
        }
    }
}
