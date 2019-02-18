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
using System.Text;

namespace RouteRecomment.FrontPages.Test.Pages
{
    public partial class STSTime4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            /*
             *    pointArr =[{title:"遇龙河",point:'110.40895000000000000|24.79951000000000000',icon:{w:21,h:34,l:0,t:0,x:6,lb:5}},//1:0代表A
                {title:"蝴蝶泉",point:'110.49682000000000000|24.74003000000000000',icon:{w:21,h:34,l:21,t:0,x:6,lb:5}},//参数依次
                {title:"西街",point:'110.49450000000000000|24.77510000000000000',icon:{w:21,h:34,l:42,t:0,x:6,lb:5}}];//增加21
             * */
                       //西街,110.49450000000000000|24.77510000000000000-冠岩,110.45400000000000000|25.05600000000000000
            String Url = "http://api.map.baidu.com/direction/v1?mode=driving&origin=西街|24.77510000000000000,110.49450000000000000&destination=冠岩|25.05600000000000000,110.45400000000000000&origin_region"
+ "=桂林&destination_region=桂林&output=json&ak=C51768d657a80ebc94d29815b53b7415";
            /*String Url = "http://api.map.baidu.com/direction/v1?mode=driving&origin=恭城武庙|24.83167000000000000,110.82680000000000000&destination=恭城文庙|24.83438000000000000,110.83194000000000000&origin_region"
+ "=桂林&destination_region=桂林&output=json&ak=9da43ee7f7a626b1b669de6179e55a9f";*/
             /*String Url = "http://api.map.baidu.com/direction/v1?mode=driving&origin=恭城武庙|24.83167000000000000,110.82680000000000000&destination=恭城文庙|24.83438000000000000,110.83194000000000000&origin_region"
 + "=桂林&destination_region=桂林&output=json&ak=9da43ee7f7a626b1b669de6179e55a9f";*/
             String type="utf-8";

            this.TextBox1.Text = GetUrltoHtml(Url,type);
        }


               public static string GetUrltoHtml(string Url,string type)
        {
            try
            {
                System.Net.WebRequest wReq = System.Net.WebRequest.Create(Url);
                // Get the response instance.
                System.Net.WebResponse wResp = wReq.GetResponse();
                System.IO.Stream respStream = wResp.GetResponseStream();
                // Dim reader As StreamReader = New StreamReader(respStream)
                using (System.IO.StreamReader reader = new System.IO.StreamReader(respStream, Encoding.GetEncoding(type)))
                {
                    return reader.ReadToEnd();
                }
            }
            catch (System.Exception ex)
            {
                //errorMsg = ex.Message;
            }
            return"";
        }
    }
}
