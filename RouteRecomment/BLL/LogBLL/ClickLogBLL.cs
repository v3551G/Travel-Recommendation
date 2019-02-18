using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.LogDAL;
using Model.Log;
using System.Data;

namespace BLL.LogBLL
{
   public class ClickLogBLL
    {
       private ClickLogDAL _ClickLogDAL;

       public ClickLogBLL()
       {
           this._ClickLogDAL = new ClickLogDAL();
       }
       /// <summary>
       /// 添加一条日志
       /// </summary>
       /// <param name="_ClicLogInfo"></param>
       public int AddClickLog(ClickLogInfo _ClicLogInfo)
       {
           return this._ClickLogDAL.AddClickLog(_ClicLogInfo);
       }
              /// <summary>
       /// 获取看了这个景点的用户的IP
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetSeeSceneryIDPeople(int SceneryID)
       {
           return this._ClickLogDAL.GetSeeSceneryIDPeople(SceneryID);
       }
       /// <summary>
       /// 根据IP、类型名查询出一个用户观看该类型的所有信息
       /// </summary>
       /// <param name="IP"></param>
       /// <param name="TypeName"></param>
       /// <returns></returns>
       public DataTable GetAllOneSee(String IP, String TypeName)
       {
           return this._ClickLogDAL.GetAllOneSee(IP,TypeName);
       }

       /// <summary>
       /// 获取看了这个酒店的用户的IP
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetSeeHotelIDPeople(int HotelID)
       {
           return this._ClickLogDAL.GetSeeHotelIDPeople(HotelID);
       }

       /// <summary>
       /// 获取看了这个餐馆的用户的IP
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetSeeResIDPeople(int ResID)
       {
           return this._ClickLogDAL.GetSeeResIDPeople(ResID);
       }
       /// <summary>
       /// 获取看了这个娱乐的用户的IP
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetSeeEnterIDPeople(int EnterID)
       {
           return this._ClickLogDAL.GetSeeEnterIDPeople(EnterID);
       }
       
       /// <summary>
       /// 获取看了这个购物的用户的IP
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetSeeMallIDPeople(int MallID)
       {
           return this._ClickLogDAL.GetSeeMallIDPeople(MallID);
       }

       /// <summary>
       /// 获取某个类型(景点、酒店)的点击日志 并分页显示
       /// </summary>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <param name="ContentType"></param>
       /// <returns></returns>
       public DataTable GetClickLogSplit(int PageSize, int PageIndex, String ContentType)
       {
           return this._ClickLogDAL.GetClickLogSplit(PageSize,PageIndex,ContentType);
       }
       /// <summary>
       /// 获取所有日志并分页显示
       /// </summary>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable GetLogSplit(int PageSize, int PageIndex)
       {
           return this._ClickLogDAL.GetLogSplit(PageSize,PageIndex);
       }

       /// <summary>
       /// 根据点击日志类型 获取该类型下的所有日志记录个数
       /// </summary>
       /// <param name="ContentType"></param>
       /// <returns></returns>
       public int GetClickTypeCount(String ContentType)
       {
           return this._ClickLogDAL.GetClickTypeCount(ContentType);
       }
       /// <summary>
       /// 获取所有日志的数量
       /// </summary>
       /// <returns></returns>
       public int GetLogCount()
       {
           return this._ClickLogDAL.GetLogCount();
       }
       /// <summary>
       /// 根据日志ID删除日志
       /// </summary>
       /// <param name="ID"></param>
       /// <returns></returns>
       public bool DelLogByID(int ID)
       {
           return this._ClickLogDAL.DelLogByID(ID);
       }




    }
}
