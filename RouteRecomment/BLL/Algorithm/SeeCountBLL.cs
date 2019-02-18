using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model.LookAnother;
using BLL.Scenery;
using System.Data;
using BLL.LogBLL;
using BLL.HotelBLL;
using BLL.RestaurantBLL;
using BLL.MallInfoBLL;

namespace BLL.Algorithm
{
   public class SeeCountBLL
    {
       private LookAnotherBLL.LookAnotherBLL _LookAnotherBLL;
       
       public SeeCountBLL()
       {
           _LookAnotherBLL = new BLL.LookAnotherBLL.LookAnotherBLL();
       }
       /// <summary>
       /// 更新景点看了又看
       /// </summary>
       public bool UpdScenerySeeAndSee()
       {
           List<SeeCount> list = new List<SeeCount>();


           SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
           ClickLogBLL _ClickLogBLL = new ClickLogBLL();
           DataTable SceneryDT = _SceneryInfoBLL.GetCityScenery(1);

           for (int k = 0; k < SceneryDT.Rows.Count; k++)
           {
               int CurrentSceneryID = int.Parse(SceneryDT.Rows[k]["SceneryID"].ToString());
               list.Clear();
               //1.查询出所有景点信息 并加入链表
               for (int i = 0; i < SceneryDT.Rows.Count; i++)
               {
                   SeeCount _SeeCount = new SeeCount();
                   _SeeCount.KeyName = SceneryDT.Rows[i]["SceneryName"].ToString();
                   _SeeCount.KeyID = int.Parse(SceneryDT.Rows[i]["SceneryID"].ToString());
                   list.Add(_SeeCount);

               }

               //2.查询出看了当前景点用户IP
               DataTable ViewerIPDT = _ClickLogBLL.GetSeeSceneryIDPeople(CurrentSceneryID);
               List<String> IPList = new List<String>();
               for (int j = 0; j < ViewerIPDT.Rows.Count; j++)
               {
                   if (!IPList.Contains(ViewerIPDT.Rows[j]["IP"].ToString()))
                       IPList.Add(ViewerIPDT.Rows[j]["IP"].ToString());
               }
               //3.查询出当前IP 看过的景点 并统计次数
                   for (int l = 0; l < IPList.Count; l++)
                   {
                       DataTable CurrentSceneryDT = _ClickLogBLL.GetAllOneSee(IPList[l], "景点");
                       //将景点合并
                       List<int> SceneryList = new List<int>();
                       for (int m = 0; m < CurrentSceneryDT.Rows.Count; m++)
                       {
                           if (!SceneryList.Contains(int.Parse(CurrentSceneryDT.Rows[m]["ContentFlag"].ToString())))
                               SceneryList.Add(int.Parse(CurrentSceneryDT.Rows[m]["ContentFlag"].ToString()));
                       }
                       
                       for (int p = 0; p < SceneryList.Count; p++)
                       {
                           for (int n = 0; n < list.Count; n++)
                               if (list[n].KeyID == SceneryList[p])
                                   list[n].Count++;
                       }

                   }
                   //4.先删除当前景点ID再根据次数排序
                   for (int a = 0; a < list.Count; a++)
                   {
                       if (list[a].KeyID == CurrentSceneryID)
                       {
                           list.RemoveAt(a);
                       }
                   }
               //先根据景点ID删除该景点的看了又看  然后按次序执行插入

                   _LookAnotherBLL.DelByIDType(CurrentSceneryID, "景点");
                  

                      
                       ;
                   for (int v = 0; v < 1; v++)
                   {
                       
                           LookAnotherInfo _LookAnotherInfo = new LookAnotherInfo();
                           _LookAnotherInfo.KeyID = CurrentSceneryID;
                           _LookAnotherInfo.AnotherLookID = list[v].KeyID;
                           _LookAnotherInfo.GoalType = "景点";

                           _LookAnotherBLL.AddLookAnother(_LookAnotherInfo);
                       
                      

                   }

                 

               
           }
           return true;
       }

       /// <summary>
       /// 更新酒店看了又看
       /// </summary>
           public bool UpdHotelSeeAndSee()
       {
           List<SeeCount> list = new List<SeeCount>();


           HotelInfoBLL _HotelInfoBLL = new HotelInfoBLL();
           ClickLogBLL _ClickLogBLL = new ClickLogBLL();
           DataTable HotelDT = _HotelInfoBLL.GetHtlInfoByCtyID(1);

           for (int k = 0; k < HotelDT.Rows.Count; k++)
           {
               int CurrentHtlID = int.Parse(HotelDT.Rows[k]["HotelID"].ToString());
               list.Clear();
               //1.查询出所有酒店信息 并加入链表
               for (int i = 0; i < HotelDT.Rows.Count; i++)
               {
                   SeeCount _SeeCount = new SeeCount();
                   _SeeCount.KeyName = HotelDT.Rows[i]["HotelName"].ToString();
                   _SeeCount.KeyID = int.Parse(HotelDT.Rows[i]["HotelID"].ToString());
                   list.Add(_SeeCount);

               }

               //2.查询出看了当前酒店用户IP
               DataTable ViewerIPDT = _ClickLogBLL.GetSeeHotelIDPeople(CurrentHtlID);
               List<String> IPList = new List<String>();
               for (int j = 0; j < ViewerIPDT.Rows.Count; j++)
               {
                   if (!IPList.Contains(ViewerIPDT.Rows[j]["IP"].ToString()))
                       IPList.Add(ViewerIPDT.Rows[j]["IP"].ToString());
               }
               //3.查询出当前IP 看过的酒店 并统计次数
               for (int l = 0; l < IPList.Count; l++)
               {
                   DataTable CurrentHtlDT = _ClickLogBLL.GetAllOneSee(IPList[l], "酒店");
                   //将景点合并
                   List<int> HtlList = new List<int>();
                   for (int m = 0; m < CurrentHtlDT.Rows.Count; m++)
                   {
                       if (!HtlList.Contains(int.Parse(CurrentHtlDT.Rows[m]["ContentFlag"].ToString())))
                           HtlList.Add(int.Parse(CurrentHtlDT.Rows[m]["ContentFlag"].ToString()));
                   }

                   for (int p = 0; p < HtlList.Count; p++)
                   {
                       for (int n = 0; n < list.Count; n++)
                           if (list[n].KeyID == HtlList[p])
                               list[n].Count++;
                   }

               }
               //4.先删除当前景点ID再根据次数排序
               for (int a = 0; a < list.Count; a++)
               {
                   if (list[a].KeyID == CurrentHtlID)
                   {
                       list.RemoveAt(a);
                   }
               }
               //先根据景点ID删除该景点的看了又看  然后按次序执行插入

               _LookAnotherBLL.DelByIDType(CurrentHtlID, "酒店");



               ;
               for (int v = 0; v < 1; v++)
               {

                   LookAnotherInfo _LookAnotherInfo = new LookAnotherInfo();
                   _LookAnotherInfo.KeyID = CurrentHtlID;
                   _LookAnotherInfo.AnotherLookID = list[v].KeyID;
                   _LookAnotherInfo.GoalType = "酒店";

                   _LookAnotherBLL.AddLookAnother(_LookAnotherInfo);



               }




           }
           return true;
       }
       /// <summary>
       /// 更新餐馆看了又看
       /// </summary>
       public bool UpdResSeeAndSee()
       {
           List<SeeCount> list = new List<SeeCount>();


           RestaurantInfoBLL _RestaurantInfoBLL = new RestaurantInfoBLL();
           ClickLogBLL _ClickLogBLL = new ClickLogBLL();
           DataTable ResDT = _RestaurantInfoBLL.GetCityRes(1);

           for (int k = 0; k < ResDT.Rows.Count; k++)
           {
               int CurrentResID = int.Parse(ResDT.Rows[k]["RestaurantID"].ToString());
               list.Clear();
               //1.查询出所有餐馆信息 并加入链表
               for (int i = 0; i < ResDT.Rows.Count; i++)
               {
                   SeeCount _SeeCount = new SeeCount();
                   _SeeCount.KeyName = ResDT.Rows[i]["RestaurantName"].ToString();
                   _SeeCount.KeyID = int.Parse(ResDT.Rows[i]["RestaurantID"].ToString());
                   list.Add(_SeeCount);

               }

               //2.查询出看了当前餐馆用户IP
               DataTable ViewerIPDT = _ClickLogBLL.GetSeeResIDPeople(CurrentResID);
               List<String> IPList = new List<String>();
               for (int j = 0; j < ViewerIPDT.Rows.Count; j++)
               {
                   if (!IPList.Contains(ViewerIPDT.Rows[j]["IP"].ToString()))
                       IPList.Add(ViewerIPDT.Rows[j]["IP"].ToString());
               }
               //3.查询出当前IP 看过的餐馆 并统计次数
               for (int l = 0; l < IPList.Count; l++)
               {
                   DataTable CurrentResDT = _ClickLogBLL.GetAllOneSee(IPList[l], "餐馆");
                   //将餐馆合并
                   List<int> ResList = new List<int>();
                   for (int m = 0; m < CurrentResDT.Rows.Count; m++)
                   {
                       if (!ResList.Contains(int.Parse(CurrentResDT.Rows[m]["ContentFlag"].ToString())))
                           ResList.Add(int.Parse(CurrentResDT.Rows[m]["ContentFlag"].ToString()));
                   }

                   for (int p = 0; p < ResList.Count; p++)
                   {
                       for (int n = 0; n < list.Count; n++)
                           if (list[n].KeyID == ResList[p])
                               list[n].Count++;
                   }

               }
               //4.先删除当前餐馆ID再根据次数排序
               for (int a = 0; a < list.Count; a++)
               {
                   if (list[a].KeyID == CurrentResID)
                   {
                       list.RemoveAt(a);
                   }
               }
               //先根据餐馆ID删除该餐馆的看了又看  然后按次序执行插入

               _LookAnotherBLL.DelByIDType(CurrentResID, "餐馆");



               ;
               for (int v = 0; v < 1; v++)
               {

                   LookAnotherInfo _LookAnotherInfo = new LookAnotherInfo();
                   _LookAnotherInfo.KeyID = CurrentResID;
                   _LookAnotherInfo.AnotherLookID = list[v].KeyID;
                   _LookAnotherInfo.GoalType = "餐馆";

                   _LookAnotherBLL.AddLookAnother(_LookAnotherInfo);



               }




           }
           return true;
       }
       /// <summary>
       /// 更新商场看了又看
       /// </summary>
       public bool UpdMallSeeAndSee()
       {
           List<SeeCount> list = new List<SeeCount>();


           MallInfoBLL.MallInfoBLL _MallInfoBLL = new BLL.MallInfoBLL.MallInfoBLL();
           ClickLogBLL _ClickLogBLL = new ClickLogBLL();
           DataTable MallDT = _MallInfoBLL.GetCityMall(1);

           for (int k = 0; k < MallDT.Rows.Count; k++)
           {
               int CurrentMallID = int.Parse(MallDT.Rows[k]["MallID"].ToString());
               list.Clear();
               //1.查询出所有酒店信息 并加入链表
               for (int i = 0; i < MallDT.Rows.Count; i++)
               {
                   SeeCount _SeeCount = new SeeCount();
                   _SeeCount.KeyName = MallDT.Rows[i]["MallName"].ToString();
                   _SeeCount.KeyID = int.Parse(MallDT.Rows[i]["MallID"].ToString());
                   list.Add(_SeeCount);

               }

               //2.查询出看了当前酒店 用户IP
               DataTable ViewerIPDT = _ClickLogBLL.GetSeeMallIDPeople(CurrentMallID);
               List<String> IPList = new List<String>();
               for (int j = 0; j < ViewerIPDT.Rows.Count; j++)
               {
                   if (!IPList.Contains(ViewerIPDT.Rows[j]["IP"].ToString()))
                       IPList.Add(ViewerIPDT.Rows[j]["IP"].ToString());
               }
               //3.查询出当前IP 看过的酒店 并统计次数
               for (int l = 0; l < IPList.Count; l++)
               {
                   DataTable CurrentMallDT = _ClickLogBLL.GetAllOneSee(IPList[l], "酒店");
                   //将酒店合并
                   List<int> MallList = new List<int>();
                   for (int m = 0; m < CurrentMallDT.Rows.Count; m++)
                   {
                       if (!MallList.Contains(int.Parse(CurrentMallDT.Rows[m]["ContentFlag"].ToString())))
                           MallList.Add(int.Parse(CurrentMallDT.Rows[m]["ContentFlag"].ToString()));
                   }

                   for (int p = 0; p < MallList.Count; p++)
                   {
                       for (int n = 0; n < list.Count; n++)
                           if (list[n].KeyID == MallList[p])
                               list[n].Count++;
                   }

               }
               //4.先删除当前酒店ID再根据次数排序
               for (int a = 0; a < list.Count; a++)
               {
                   if (list[a].KeyID == CurrentMallID)
                   {
                       list.RemoveAt(a);
                   }
               }
               //先根据景点ID删除该酒店的看了又看  然后按次序执行插入

               _LookAnotherBLL.DelByIDType(CurrentMallID, "酒店");



               ;
               for (int v = 0; v < 1; v++)
               {

                   LookAnotherInfo _LookAnotherInfo = new LookAnotherInfo();
                   _LookAnotherInfo.KeyID = CurrentMallID;
                   _LookAnotherInfo.AnotherLookID = list[v].KeyID;
                   _LookAnotherInfo.GoalType = "酒店";

                   _LookAnotherBLL.AddLookAnother(_LookAnotherInfo);



               }




           }
           return true;
       }
       /// <summary>
       /// 更新娱乐看了又看
       /// </summary>
       public bool UpdEnterSeeAndSee()
       {
           List<SeeCount> list = new List<SeeCount>();


           EntertainmentBLL.EntertainmentBLL _EntertainmentBLL = new BLL.EntertainmentBLL.EntertainmentBLL();          
           ClickLogBLL _ClickLogBLL = new ClickLogBLL();
           DataTable EnterDT = _EntertainmentBLL.GetCityEntertainment(1);

           for (int k = 0; k < EnterDT.Rows.Count; k++)
           {
               int CurrentEnterID = int.Parse(EnterDT.Rows[k]["EntertainmentID"].ToString());
               list.Clear();
               //1.查询出所有酒店信息 并加入链表
               for (int i = 0; i < EnterDT.Rows.Count; i++)
               {
                   SeeCount _SeeCount = new SeeCount();
                   _SeeCount.KeyName = EnterDT.Rows[i]["EntertainmentName"].ToString();
                   _SeeCount.KeyID = int.Parse(EnterDT.Rows[i]["EntertainmentID"].ToString());
                   list.Add(_SeeCount);

               }

               //2.查询出看了当前娱乐用户IP
               DataTable ViewerIPDT = _ClickLogBLL.GetSeeEnterIDPeople(CurrentEnterID);
               List<String> IPList = new List<String>();
               for (int j = 0; j < ViewerIPDT.Rows.Count; j++)
               {
                   if (!IPList.Contains(ViewerIPDT.Rows[j]["IP"].ToString()))
                       IPList.Add(ViewerIPDT.Rows[j]["IP"].ToString());
               }
               //3.查询出当前IP 看过的娱乐 并统计次数
               for (int l = 0; l < IPList.Count; l++)
               {
                   DataTable CurrentEnterDT = _ClickLogBLL.GetAllOneSee(IPList[l], "娱乐");
                   //将娱乐合并
                   List<int> EnterList = new List<int>();
                   for (int m = 0; m < CurrentEnterDT.Rows.Count; m++)
                   {
                       if (!EnterList.Contains(int.Parse(CurrentEnterDT.Rows[m]["ContentFlag"].ToString())))
                           EnterList.Add(int.Parse(CurrentEnterDT.Rows[m]["ContentFlag"].ToString()));
                   }

                   for (int p = 0; p < EnterList.Count; p++)
                   {
                       for (int n = 0; n < list.Count; n++)
                           if (list[n].KeyID == EnterList[p])
                               list[n].Count++;
                   }

               }
               //4.先删除当前景点ID再根据次数排序
               for (int a = 0; a < list.Count; a++)
               {
                   if (list[a].KeyID == CurrentEnterID)
                   {
                       list.RemoveAt(a);
                   }
               }
               //先根据娱乐ID删除该娱乐的看了又看  然后按次序执行插入

               _LookAnotherBLL.DelByIDType(CurrentEnterID, "娱乐");



               ;
               for (int v = 0; v < 1; v++)
               {

                   LookAnotherInfo _LookAnotherInfo = new LookAnotherInfo();
                   _LookAnotherInfo.KeyID = CurrentEnterID;
                   _LookAnotherInfo.AnotherLookID = list[v].KeyID;
                   _LookAnotherInfo.GoalType = "娱乐";

                   _LookAnotherBLL.AddLookAnother(_LookAnotherInfo);



               }




           }
           return true;
       }
   
   }
}
