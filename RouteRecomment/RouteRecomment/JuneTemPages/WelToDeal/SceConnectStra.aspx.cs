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
using BLL.OtherStraSplit;
using BLL.Scenery;

namespace RouteRecomment.JuneTemPages.WelToDeal
{
    public partial class SceConnectStra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            this.TextBox1.Text = "success";
        }
        public void StraStrNormal()
        {
            OtherStraBLL _OtherStraBLL = new OtherStraBLL();

            DataTable StraDT = _OtherStraBLL.GetOtherStra();

            String StraContent = "";
            int StraID;
            for (int i = 0; i < StraDT.Rows.Count; i++)
            {
                StraContent = "";
                StraID = int.Parse(StraDT.Rows[i]["StrategyID"].ToString());
                StraContent = StraDT.Rows[i]["StrategyContent"].ToString();
                int httpID = StraContent.IndexOf("/");
                StraContent = StraContent.Substring(httpID+1,StraContent.Length-httpID-1);
                _OtherStraBLL.UpdStra(StraID,StraContent);
            }
        
        }

        public void AddOtherStraSce()
        {
            SceneryInfoBLL _SIB = new SceneryInfoBLL();
            DataTable ALLSceDT = _SIB.GetCityScenery(1);

            OtherStraBLL _OSBLL = new OtherStraBLL();
            DataTable ALLStra = _OSBLL.GetAllStra();

            int SceID;
            int StraID;
            String SceName = "";
            String StraContent = "";
            for (int i = 0; i < ALLStra.Rows.Count; i++)
            {
                StraID = int.Parse(ALLStra.Rows[i]["StrategyID"].ToString());
                StraContent = ALLStra.Rows[i]["StrategyContent"].ToString();
                for (int j = 0; j < ALLSceDT.Rows.Count; j++)
                { 
                   SceID = int.Parse(ALLSceDT.Rows[j]["SceneryID"].ToString());
                   SceName = ALLSceDT.Rows[j]["SceneryName"].ToString();

                   if (StraContent.Contains(SceName))
                       _OSBLL.AddStraSce(StraID,SceID);
                
                }            
            
            }


        
        
        }
        
    }
}
