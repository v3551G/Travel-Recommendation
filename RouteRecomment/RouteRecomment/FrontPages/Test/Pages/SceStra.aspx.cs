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

namespace RouteRecomment.FrontPages.Test.Pages
{
    public partial class SceStra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InsertStraSce();
        }

        public void InsertStraSce()
        {
            OtherStraBLL _OtherStraBLL = new OtherStraBLL();
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();

            DataTable StraDT = _OtherStraBLL.GetAllStra();
            DataTable SceDT = _SceneryInfoBLL.GetCityScenery(1);

            int SceneryID;
            int StraID;
            String StraInfo;
            String SceneryInfo;
            int Count = 0;
            for (int i = 0; i < StraDT.Rows.Count; i++)
            {
                StraID = int.Parse(StraDT.Rows[i]["StrategyID"].ToString());
                StraInfo = StraDT.Rows[i]["StrategyContent"].ToString();
                for (int j = 0; j < SceDT.Rows.Count; j++)
                {
                    SceneryID = int.Parse(SceDT.Rows[j]["SceneryID"].ToString());
                    SceneryInfo = SceDT.Rows[j]["SceneryName"].ToString();
                    if (StraInfo.Contains(SceneryInfo))
                    {
                        _OtherStraBLL.InsertStraSce(SceneryID, StraID);
                        Count++;
                    }

                }
            }
        }



    }
}
