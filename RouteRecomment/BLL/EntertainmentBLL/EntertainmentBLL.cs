using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.EntertainmentDAl;
using System.Data;
using Model.Entertainment;

namespace BLL.EntertainmentBLL
{
   public class EntertainmentBLL
    {
       EntertainmentInfoDAL _EnterTMInfoDAL = null;

       public EntertainmentBLL()
       {
         _EnterTMInfoDAL = new EntertainmentInfoDAL();
       }

       public bool InsertToEntertainCmt(EntertainmentComment _UserCmtObj)
       {
           return this._EnterTMInfoDAL.InsertToEntertainCmt(_UserCmtObj);
       }

       public DataTable  GetUserIDByAccount(String _Account)
       {
           return this._EnterTMInfoDAL.GetUserIDByAccount(_Account);
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="CmtUserID"></param>
       /// <returns></returns>
       public DataTable  GetCmtUserAccountByUserID(String CmtUserID)
       {
           return this._EnterTMInfoDAL.GetCmtUserAccountByUserID(CmtUserID);
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="EnterID"></param>
       /// <returns></returns>
       public DataTable GetUserCmtByEnterID(int EnterID)
       {
           return this._EnterTMInfoDAL.GetUserCmtByEnterID(EnterID);
       }

       /// <summary>
       /// 获取市的娱乐场所信息并分页显示
       /// </summary>
       /// <param name="CityID"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageStart"></param>
       /// <returns></returns>
       public DataTable CityEnterTainMentSplit(int CityID, int PageSize, int PageStart)
       {
           return this._EnterTMInfoDAL.CityEnterTainMentSplit(CityID,PageSize,PageStart);
       }

        /// <summary>
       /// 根据市ID获取该市的所有娱乐场所个数
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public int GetEntertainCountByCityID(int CityID)
       {
           return this._EnterTMInfoDAL.GetEntertainCountByCityID(CityID);
       }

       /// <summary>
       /// 添加一个娱乐场所信息
       /// </summary>
       /// <param name="_EntertainmentInfo"></param>
       /// <returns></returns>
       public bool AddEntertainMent(EntertainmentInfo _EntertainmentInfo)
       {
           return this._EnterTMInfoDAL.AddEntertainMent(_EntertainmentInfo);
       }

       /// <summary>
       /// 根据娱乐场所ID查询娱乐场所信息
       /// </summary>
       /// <param name="EntertainmentID"></param>
       /// <returns></returns>
       public DataTable GetEnterInfoByID(int EntertainmentID)
       {
           return this._EnterTMInfoDAL.GetEnterInfoByID(EntertainmentID);
       }
       /// <summary>
       /// 跟新娱乐场所信息
       /// </summary>
       /// <param name="EnterID"></param>
       /// <param name="_EntertainmentInfo"></param>
       /// <returns></returns>
       public bool UpdEnterInfo(int EnterID, EntertainmentInfo _EntertainmentInfo)
       {
           return this._EnterTMInfoDAL.UpdEnterInfo(EnterID, _EntertainmentInfo);
       }
       /// <summary>
       /// 根据娱乐场所ID删除娱乐场所
       /// </summary>
       /// <param name="EnterID"></param>
       /// <returns></returns>
       public bool DelEnterInfo(int EnterID)
       {
           return this._EnterTMInfoDAL.DelEnterInfo(EnterID);
       }

       /// <summary>
       /// 根据市ID查询出该市的娱乐场所
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public DataTable GetCityEntertainment(int CityID)
       {
           return this._EnterTMInfoDAL.GetCityEntertainment(CityID);
       }

       /// <summary>
       /// 根据娱乐场所ID查出它所在的市
       /// </summary>
       /// <param name="EnterID"></param>
       /// <returns></returns>
       public int GetCityIDByEnterID(int EnterID)
       {
           return this._EnterTMInfoDAL.GetCityIDByEnterID(EnterID);
       }

        /// <summary>
       /// 根据景点ID查询他在大众点评上的总体评分
       /// </summary>
       /// <param name="EntertainmentID"></param>
       /// <returns></returns>
       public DataTable DaZhongEnterTotalAssesment(int EntertainmentID)
       {
           return this._EnterTMInfoDAL.DaZhongEnterTotalAssesment(EntertainmentID);
       }
       /// <summary>
       /// 根据景点ID查询他在爱帮上的总体评分
       /// </summary>
       /// <param name="EntertainmentID"></param>
       /// <returns></returns>
       public DataTable AiBangEnterttTotalAssessment(int EntertainmentID)
       {
           return this._EnterTMInfoDAL.AiBangEnterttTotalAssessment(EntertainmentID);
       }

        /// <summary>
       /// 根据娱乐场所ID，网站名，页码，页大小查询出大众网站内的娱乐场所评论并分页显示
       /// </summary>
       /// <param name="EntertainmentID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable DaZhongEnterCommentSplit(int EntertainmentID, String WebSiteName, int PageSize, int PageIndex)
       {
           return this._EnterTMInfoDAL.DaZhongEnterCommentSplit(EntertainmentID,WebSiteName,PageSize,PageIndex);
       }

              /// <summary>
       /// 根据娱乐场所ID，网站名，页码，页大小查询出该爱帮内的娱乐场所评论并分页显示
       /// </summary>
       /// <param name="EntertainmentID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable AiBangEnterCommentSplit(int EntertainmentID, String WebSiteName, int PageSize, int PageIndex)
       {
           return this._EnterTMInfoDAL.AiBangEnterCommentSplit(EntertainmentID,WebSiteName,PageSize,PageIndex);
       }

        /// <summary>
       /// 根据娱乐场所ID查询出该餐馆在大众点评上的评论个数
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetDaZhongCommentCount(int EntertainmentID)
       {
           return this._EnterTMInfoDAL.GetDaZhongCommentCount(EntertainmentID);
       }

              /// <summary>
       /// 根据娱乐场所ID查询出该餐馆在爱帮网上的评论个数
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetAiBangCommentCount(int EntertainmentID)
       {
           return this._EnterTMInfoDAL.GetAiBangCommentCount(EntertainmentID);
       }

       public DataTable IsEnterExist(float Slatitude, float Slongtitude)
       {
           return this._EnterTMInfoDAL.IsEnterExist(Slatitude,Slongtitude);
       }
 
    }
}
