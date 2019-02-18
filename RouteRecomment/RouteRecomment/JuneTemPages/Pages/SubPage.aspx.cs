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
using BLL.Scenery;
using BLL.PicBLL;
using BLL.HotelBLL;
using BLL.RestaurantBLL;
using BLL.MallInfoBLL;
using BLL.EntertainmentBLL;
using BLL.OtherStraSplit;
using System.Collections.Generic;
using System.Web.Services;
using System.IO;

namespace RouteRecomment.JuneTemPages.Pages
{
    public partial class SubPage : System.Web.UI.Page
    {   
        public SceneryInfoBLL _SceneryInfoBLL;
        public PicInfoBLL _PicInfoBLL;
        public HotelInfoBLL _HotelInfoBLL;
        public RestaurantInfoBLL _ResInfoBLL;
        public MallInfoBLL _MallInfoBLL;
        public EntertainmentBLL _EntertainmentBLL;


        public OtherStraBLL _OtherStraBLL;
        public DataTable DTOtherStraSplit = new DataTable ();
        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.ScriptManager1.EnablePageMethods = true;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            _SceneryInfoBLL = new SceneryInfoBLL();
            _PicInfoBLL = new PicInfoBLL();
            _HotelInfoBLL = new HotelInfoBLL();
            _ResInfoBLL = new RestaurantInfoBLL();
            _MallInfoBLL = new MallInfoBLL();
            _EntertainmentBLL = new EntertainmentBLL();

            _OtherStraBLL = new OtherStraBLL();
            if (!IsPostBack)
            {
                DTOtherStraSplit = _OtherStraBLL.OtherStraSplit(this.AspNetPager4.PageSize, 1);
                this.AspNetPager4.RecordCount = _OtherStraBLL.GetStrategyCount();
            }
        }

        [WebMethod]
        public static String GetScenery()
        {
            SceneryInfoBLL _SceneryInfoBLL1 = new SceneryInfoBLL();
            PicInfoBLL _PicInfoBLL1 = new PicInfoBLL();
            //获取所有桂林景点的ID
            DataTable SceneryDT = _SceneryInfoBLL1.GetCityScenery(1);
            List<int> IDList = new List<int>();
            List<int> UseList = new List<int>();
            for (int i = 0; i < SceneryDT.Rows.Count; i++)
            {
                int idTemp = int.Parse(SceneryDT.Rows[i]["SceneryID"].ToString());
                IDList.Add(idTemp);
            }
            //过滤出含有经纬度的景点ID 存在UseID中
            for (int j = 0; j < IDList.Count; j++)
            {
                DataTable InfoDT = _SceneryInfoBLL1.GetSceneryInfoByID(IDList[j]);
                try
                {
                    if (InfoDT.Rows[0]["Slatitude"] != null && (InfoDT.Rows[0]["Slatitude"].ToString() != ""))
                    {
                        if (float.Parse(InfoDT.Rows[0]["Slatitude"].ToString().Substring(0, 8)) != 0.0f)
                        {
                            UseList.Add(IDList[j]);
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }

            //该数组依次存储每个景点的名称、景点简介、经度、纬度、图片路径
            String[] InfoList = new String[6 * UseList.Count];
            for (int k = 0; k < UseList.Count; k++)
            {
                DataTable SceDT = _SceneryInfoBLL1.GetSceneryInfoByID(UseList[k]);
                InfoList[k * 6] = SceDT.Rows[0]["SceneryName"].ToString();
                if (SceDT.Rows[0]["SceneryLoc"].ToString().Length > 10)
                {
                    if (SceDT.Rows[0]["SceneryLoc"].ToString().Contains("\n"))
                        InfoList[k * 6 + 1] = SceDT.Rows[0]["SceneryLoc"].ToString().Replace("\n", ":").Substring(0, 10);
                    else
                        InfoList[k * 6 + 1] = SceDT.Rows[0]["SceneryLoc"].ToString().Substring(0, 10);
                }
                else
                {
                    if (SceDT.Rows[0]["SceneryLoc"].ToString().Contains("\n"))
                        InfoList[k * 6 + 1] = SceDT.Rows[0]["SceneryLoc"].ToString().Replace("\n", ":");
                    else
                        InfoList[k * 6 + 1] = SceDT.Rows[0]["SceneryLoc"].ToString();

                }
                InfoList[k * 6 + 2] = SceDT.Rows[0]["Slatitude"].ToString();
                InfoList[k * 6 + 3] = SceDT.Rows[0]["Slongitude"].ToString();
                InfoList[k * 6 + 4] = SceDT.Rows[0]["SceneryID"].ToString();

                DataTable PicDT = _PicInfoBLL1.GetPicBySceID(UseList[k]);
                if (PicDT.Rows.Count > 0)
                {
                    String PicUrl = PicDT.Rows[0]["PicPath"].ToString();
                    PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                    PicUrl = "../../../" + "Admin/" + PicUrl;
                    InfoList[k * 6 + 5] = PicUrl;
                }
                else
                {
                    InfoList[k * 6 + 5] = "../../../" + "Admin/UpLoadPics/20140419091208001300000914117127968044529870[1].jpg";
                }
            }
            String Result = "";
            for (int m = 0; m < InfoList.Length; m++)
            {
                Result += InfoList[m];
                Result += "|";
            }
            Result = Result.Substring(0, Result.Length - 1);

            return Result.ToString();
        }

        public String GetHotel()
        {

            //获取所有桂林酒店的ID
            DataTable HotelDT = _HotelInfoBLL.GetHtlInfoByCtyID(1);
            List<int> IDList = new List<int>();
            List<int> UseList = new List<int>();
            for (int i = 0; i < HotelDT.Rows.Count; i++)
            {
                int idTemp = int.Parse(HotelDT.Rows[i]["HotelID"].ToString());
                IDList.Add(idTemp);
            }
            //过滤出含有经纬度的酒店ID 存在UseID中
            for (int j = 0; j < IDList.Count; j++)
            {
                DataTable InfoDT = _HotelInfoBLL.GetHotelInfoByHtlID(IDList[j]);
                try
                {
                    if (InfoDT.Rows[0]["Slatitude"] != null && (InfoDT.Rows[0]["Slatitude"].ToString() != ""))
                    {
                        if (float.Parse(InfoDT.Rows[0]["Slatitude"].ToString().Substring(0, 8)) != 0.0f)
                        {
                            UseList.Add(IDList[j]);
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }

            //该数组依次存储每个酒店的名称、酒店简介、经度、纬度、酒店ID、图片路径
            String[] InfoList = new String[6 * UseList.Count];
            for (int k = 0; k < UseList.Count; k++)
            {
                DataTable HtlDT = _HotelInfoBLL.GetHotelInfoByHtlID(UseList[k]);
                InfoList[k * 6] = HtlDT.Rows[0]["HotelName"].ToString();
                if (HtlDT.Rows[0]["Locate"].ToString().Length > 10)
                    InfoList[k * 6 + 1] = HtlDT.Rows[0]["Locate"].ToString().Substring(0, 10);
                else
                    InfoList[k * 6 + 1] = HtlDT.Rows[0]["Locate"].ToString();
                InfoList[k * 6 + 2] = HtlDT.Rows[0]["Slatitude"].ToString();
                InfoList[k * 6 + 3] = HtlDT.Rows[0]["SLongitude"].ToString();

                InfoList[k * 6 + 4] = HtlDT.Rows[0]["HotelID"].ToString();

                DataTable PicDT = _PicInfoBLL.GetPicByHtlID(UseList[k]);
                if (PicDT.Rows.Count > 0)
                {
                    String PicUrl = PicDT.Rows[0]["PicPath"].ToString();
                    PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                    PicUrl = "../../../" + "Admin/" + PicUrl;
                    InfoList[k * 6 + 5] = PicUrl;
                }
                else
                {
                    InfoList[k * 6 + 5] = "../../../" + "Admin/UpLoadPics/2014041908555507@)6X6C2~P6M[`N9M(T`BAP.jpg";
                }
            }
            String Result = "";
            for (int m = 0; m < InfoList.Length; m++)
            {
                Result += InfoList[m];
                Result += "|";
            }
            Result = Result.Substring(0, Result.Length - 1);

            return Result.ToString();
        }

        public String GetRestaurant()
        {

            //获取所有桂林餐馆的ID
            DataTable ResDT = _ResInfoBLL.GetCityRes(1);
            List<int> IDList = new List<int>();
            List<int> UseList = new List<int>();
            for (int i = 0; i < ResDT.Rows.Count; i++)
            {
                int idTemp = int.Parse(ResDT.Rows[i]["RestaurantID"].ToString());
                IDList.Add(idTemp);
            }
            //过滤出含有经纬度的酒店ID 存在UseID中
            for (int j = 0; j < IDList.Count; j++)
            {
                DataTable InfoDT = _ResInfoBLL.GetResInfo(IDList[j]);
                try
                {
                    if (InfoDT.Rows[0]["Slatitude"] != null && (InfoDT.Rows[0]["Slatitude"].ToString() != ""))
                    {
                        if (float.Parse(InfoDT.Rows[0]["Slatitude"].ToString().Substring(0, 8)) != 0.0f)
                        {
                            UseList.Add(IDList[j]);
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }

            //该数组依次存储每个酒店的名称、酒店简介、经度、纬度、酒店ID、图片路径
            String[] InfoList = new String[6 * UseList.Count];
            for (int k = 0; k < UseList.Count; k++)
            {
                DataTable _ResDT = _ResInfoBLL.GetResInfo(UseList[k]);
                InfoList[k * 6] = _ResDT.Rows[0]["RestaurantName"].ToString();
                if (_ResDT.Rows[0]["Local"].ToString().Length > 10)
                {
                    if (_ResDT.Rows[0]["Local"].ToString().Contains("\n"))
                        InfoList[k * 6 + 1] = _ResDT.Rows[0]["Local"].ToString().Replace("\n", ":").Substring(0, 10);
                    else
                        InfoList[k * 6 + 1] = _ResDT.Rows[0]["Local"].ToString();
                }
                else
                {
                    if (_ResDT.Rows[0]["Local"].ToString().Contains("\n"))
                        InfoList[k * 6 + 1] = _ResDT.Rows[0]["Local"].ToString().Replace("\n", ":");
                    else
                        InfoList[k * 6 + 1] = _ResDT.Rows[0]["Local"].ToString();

                }
                InfoList[k * 6 + 2] = _ResDT.Rows[0]["Slatitude"].ToString();
                InfoList[k * 6 + 3] = _ResDT.Rows[0]["SLongitude"].ToString();
                InfoList[k * 6 + 4] = _ResDT.Rows[0]["RestaurantID"].ToString();

                DataTable PicDT = _PicInfoBLL.GetResPicByID(UseList[k]);
                if (PicDT.Rows.Count > 0)
                {
                    String PicUrl = PicDT.Rows[0]["PicPath"].ToString();
                    PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                    PicUrl = "../../../" + "Admin/" + PicUrl;
                    InfoList[k * 6 + 5] = PicUrl;
                }
                else
                {
                    InfoList[k * 6 + 5] = "../../../" + "Admin/UpLoadPics/2014041908555507@)6X6C2~P6M[`N9M(T`BAP.jpg";
                }
            }
            String Result = "";
            for (int m = 0; m < InfoList.Length; m++)
            {
                Result += InfoList[m];
                Result += "|";
            }
            Result = Result.Substring(0, Result.Length - 1);

            return Result.ToString();
        }

        public String GetShop()
        {

            //获取所有桂林购物的ID
            DataTable MallDT = _MallInfoBLL.GetCityMall(1);
            List<int> IDList = new List<int>();
            List<int> UseList = new List<int>();
            for (int i = 0; i < MallDT.Rows.Count; i++)
            {
                int idTemp = int.Parse(MallDT.Rows[i]["MallID"].ToString());
                IDList.Add(idTemp);
            }
            //过滤出含有经纬度的购物ID 存在UseID中
            for (int j = 0; j < IDList.Count; j++)
            {
                DataTable InfoDT = _MallInfoBLL.GetMallInfoByID(IDList[j]);
                try
                {
                    if (InfoDT.Rows[0]["Slatitude"] != null && (InfoDT.Rows[0]["Slatitude"].ToString() != ""))
                    {
                        if (float.Parse(InfoDT.Rows[0]["Slatitude"].ToString().Substring(0, 8)) != 0.0f)
                        {
                            UseList.Add(IDList[j]);
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }

            //该数组依次存储每个购物的名称、购物简介、经度、纬度、酒店ID、图片路径
            String[] InfoList = new String[6 * UseList.Count];
            for (int k = 0; k < UseList.Count; k++)
            {
                DataTable _MallDT = _MallInfoBLL.GetMallInfoByID(UseList[k]);
                InfoList[k * 6] = _MallDT.Rows[0]["MallName"].ToString();

                if (_MallDT.Rows[0]["Local"].ToString().Length > 10)
                    InfoList[k * 6 + 1] = _MallDT.Rows[0]["Local"].ToString().Substring(0, 10);
                else
                    InfoList[k * 6 + 1] = _MallDT.Rows[0]["Local"].ToString();
                InfoList[k * 6 + 2] = _MallDT.Rows[0]["Slatitude"].ToString();
                InfoList[k * 6 + 3] = _MallDT.Rows[0]["SLongitude"].ToString();
                InfoList[k * 6 + 4] = _MallDT.Rows[0]["MallID"].ToString();

                DataTable PicDT = _PicInfoBLL.GetResPicByID(UseList[k]);
                if (PicDT.Rows.Count > 0)
                {
                    String PicUrl = PicDT.Rows[0]["PicPath"].ToString();
                    PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                    PicUrl = "../../../" + "Admin/" + PicUrl;
                    InfoList[k * 6 + 5] = PicUrl;
                }
                else
                {
                    //设置默认图片
                    InfoList[k * 6 + 5] = "../../../" + "Admin/UpLoadPics/201404191250140img201031811541608.jpg";
                }
            }
            String Result = "";
            for (int m = 0; m < InfoList.Length; m++)
            {
                Result += InfoList[m];
                Result += "|";
            }
            Result = Result.Substring(0, Result.Length - 1);

            return Result.ToString();
        }

        public String GetEntertain()
        {

            //获取所有桂林购物的ID
            DataTable EnterDT = _EntertainmentBLL.GetCityEntertainment(1);
            List<int> IDList = new List<int>();
            List<int> UseList = new List<int>();
            for (int i = 0; i < EnterDT.Rows.Count; i++)
            {
                int idTemp = int.Parse(EnterDT.Rows[i]["EntertainmentID"].ToString());
                IDList.Add(idTemp);
            }
            //过滤出含有经纬度的购物ID 存在UseID中
            for (int j = 0; j < IDList.Count; j++)
            {
                DataTable InfoDT = _EntertainmentBLL.GetEnterInfoByID(IDList[j]);
                try
                {
                    if (InfoDT.Rows[0]["Slatitude"] != null && (InfoDT.Rows[0]["Slatitude"].ToString() != ""))
                    {
                        if (float.Parse(InfoDT.Rows[0]["Slatitude"].ToString().Substring(0, 8)) != 0.0f)
                        {
                            UseList.Add(IDList[j]);
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }

            //该数组依次存储每个购物的名称、购物简介、经度、纬度、酒店ID、图片路径
            String[] InfoList = new String[6 * UseList.Count];
            for (int k = 0; k < UseList.Count; k++)
            {
                DataTable _EnterDT = _EntertainmentBLL.GetEnterInfoByID(UseList[k]);
                InfoList[k * 6] = _EnterDT.Rows[0]["EntertainmentName"].ToString();
                if (_EnterDT.Rows[0]["Local"].ToString().Length > 10)
                    InfoList[k * 6 + 1] = _EnterDT.Rows[0]["Local"].ToString().Substring(0, 10);
                else
                    InfoList[k * 6 + 1] = _EnterDT.Rows[0]["Local"].ToString();
                InfoList[k * 6 + 2] = _EnterDT.Rows[0]["Slatitude"].ToString();
                InfoList[k * 6 + 3] = _EnterDT.Rows[0]["SLongitude"].ToString();
                InfoList[k * 6 + 4] = _EnterDT.Rows[0]["EntertainmentID"].ToString();

                DataTable PicDT = _PicInfoBLL.GetEnterPicByEnterID(UseList[k]);
                if (PicDT.Rows.Count > 0)
                {
                    String PicUrl = PicDT.Rows[0]["PicPath"].ToString();
                    PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                    PicUrl = "../../../" + "Admin/" + PicUrl;
                    InfoList[k * 6 + 5] = PicUrl;
                }
                else
                {
                    InfoList[k * 6 + 5] = "../../../" + "Admin/UpLoadPics/201404190157570thumb (1).jpg";

                }
            }
            String Result = "";
            for (int m = 0; m < InfoList.Length; m++)
            {
                Result += InfoList[m];
                Result += "|";
            }
            Result = Result.Substring(0, Result.Length - 1);

            return Result.ToString();
        }

        public String Get;
         [WebMethod]
        public static String GetTypeAndID(String LatLon)
        {
            String Res = "";
            //Res = LatLon;
            if (LatLon.Contains("|"))
            {
                SceneryInfoBLL _SceneryInfoBLL1 = new SceneryInfoBLL();
                PicInfoBLL _PicInfoBLL1 = new PicInfoBLL();
                HotelInfoBLL _HotelInfoBLL1 = new HotelInfoBLL();
                RestaurantInfoBLL _ResInfoBLL1 = new RestaurantInfoBLL();
                MallInfoBLL _MallInfoBLL1 = new MallInfoBLL();
                EntertainmentBLL _EntertainmentBLL1 = new EntertainmentBLL();

                float Slatitude = float.Parse(LatLon.Split('|')[0]);
                float Slongtitude = float.Parse(LatLon.Split('|')[1]);

                DataTable SceDT = _SceneryInfoBLL1.IsSceneryExist(Slatitude, Slongtitude);
                DataTable MallDT = _MallInfoBLL1.IsMallExist(Slatitude, Slongtitude);
                DataTable HtlDT = _HotelInfoBLL1.IsHotelExist(Slatitude, Slongtitude);
                DataTable EnterDT = _EntertainmentBLL1.IsEnterExist(Slatitude, Slongtitude);
                DataTable FoodDT = _ResInfoBLL1.IsResExist(Slatitude, Slongtitude);

                if (SceDT.Rows.Count > 0)
                {
                    Res += "Scenery.aspx?SceneryID=";
                    Res += SceDT.Rows[0]["SceneryID"].ToString();

                }

                else if (MallDT.Rows.Count > 0)
                {
                    Res += "Shopping.aspx?ShopID=";
                    Res += MallDT.Rows[0]["MallID"].ToString();

                }
                else if (HtlDT.Rows.Count > 0)
                {
                    Res += "Hotel.aspx?HotelID=";
                    Res += HtlDT.Rows[0]["HotelID"].ToString();

                }
                else if (EnterDT.Rows.Count > 0)
                {
                    Res += "Entertainment.aspx?EnterID=";
                    Res += EnterDT.Rows[0]["EntertainmentID"].ToString();
                }
                else if (FoodDT.Rows.Count > 0)
                {
                    Res += "Food.aspx?ResID=";
                    Res += FoodDT.Rows[0]["RestaurantID"].ToString();

                }
            }

       
            return Res;

        }

        public String test(String LatLon)
        {
            string s;
            return LatLon;
        }

        private bool YiBool = true;
        protected void StraSplit_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {

            if (YiBool)
            {
                YiBool = false;
                int PageIndex = e.NewPageIndex;
                DTOtherStraSplit = _OtherStraBLL.OtherStraSplit(this.AspNetPager4.PageSize, PageIndex);

            }


        }

        [WebMethod]
        public static void GetDiaLogInfo(String DiaLogInfo)
        {
            String Info = DiaLogInfo;
            String RevealPreFP = "F:\\旅游网站\\旅游网站\\RouteRecomment8_18\\RouteRecomment\\RouteRecomment\\JuneTemPages\\Stragegy\\RevealPre.txt";
            StreamWriter RevealSW = new StreamWriter(RevealPreFP);
            RevealSW.Write(Info);
            RevealSW.Close();
            return;
        }
    }
}
