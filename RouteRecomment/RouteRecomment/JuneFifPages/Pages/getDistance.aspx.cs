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
using System.Web.Services;
using System.Xml.Linq;
using BLL.Scenery;
using BLL.PicBLL;
using BLL.OtherStraSplit;
using BLL.LogBLL;
using Model.Log;
using Model.User;  //
using System.IO;
using DAL.Scenery;
//

namespace RouteRecomment.JuneFifPages.Pages
{
    public partial class getDistance : System.Web.UI.Page
    {
        public SceneryInfoBLL _SceneryInfoBLL;
        public double[][] Latlon ;
        public double[][] Distance;
        public DataTable SLL;
        public int RowCount;
        //
        protected void Page_Load(object sender, EventArgs e)
        {
            _SceneryInfoBLL = new SceneryInfoBLL();
            //Latlon = new double[165][];
        }

        public void GetLonLat() {

            SLL = _SceneryInfoBLL.GetDLL();
            RowCount = SLL.Rows.Count;
            Latlon = new double[RowCount][];
            for (int i = 0; i < RowCount; i++)
            {
                Latlon[i] = new double[2];
                Latlon[i][0] = double.Parse(SLL.Rows[0]["SLongitude"].ToString());
                Latlon[i][1] = double.Parse(SLL.Rows[0]["Slatitude"].ToString());
            }


        }

        [WebMethod]
        public static void writeDisToFile(String[] Dist) {

            String[] Info = Dist;
            String RevealPreFP = "F:\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneFifPages\\Stragegy\\distance.txt";


            StreamWriter RevealSW = new StreamWriter(RevealPreFP);
            for (int i = 0; i < Info.Length; i++ )
                RevealSW.Write(Info[i]);
            RevealSW.Close();
            return;
             
        }     

    }
}