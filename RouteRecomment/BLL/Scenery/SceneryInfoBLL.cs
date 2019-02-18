using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.Scenery;
using System.Data;
using Model.Scenery;
using Model.User;

namespace BLL.Scenery
{
   public class SceneryInfoBLL
    {
       private SceneryInfoDAL _SceneryInfoDAL = null;

       public SceneryInfoBLL()
       {
           this._SceneryInfoDAL = new SceneryInfoDAL();
       }

       public DataTable GetDLL()
       {
           return this._SceneryInfoDAL.GetDLL();
       }

       ///<summary>
       ///根据UserAccount获得UserID
       /// </summary>
       public DataTable GetUserIDByAccount(String UserAccount)
       {
           return this._SceneryInfoDAL.GetuserIDByAccount(UserAccount); 
       }

       ///<summary>
       ///根据userID找到评论用户的账户信息
       /// </summary>
       public DataTable GetCmtUserAccountByUserID(String CmtUserID)
       {
          return this._SceneryInfoDAL.GetCmtUserAccountByUserID(CmtUserID);
       }

       ///<summary>
       ///根据SceneryID找到用户评论
       /// </summary>
       public DataTable GetUserCmtBySceID(int SceneryID)
       {
           return this._SceneryInfoDAL.GetUserCmtBySceID(SceneryID);
       }


       ///<summary>
       /// 根据市的ID查询出该市的所有景点
       ///</summary>
       public DataTable GetCitySceSplit(int CityID,int PageSize, int PageIndex)
       {
           return this._SceneryInfoDAL.GetCitySceSplit(CityID,PageSize,PageIndex);
       }

       ///<summary>
       ///根据风景名称查询序列号
       ///</summary>
       public DataTable GetSeqSlalonBySceName(String sceName)
       {
           return this._SceneryInfoDAL.GetSeqSlalonBySceName(sceName);
       }

       ///<summary>
       /// 根据市的ID查询出该市的景点个数
       ///</summary>
       public int GetCitySceCount(int CityID)
       {
           return this._SceneryInfoDAL.GetCitySceCount(CityID);
       }

        ///<summary>
        /// 添加景点
        ///</summary>
       public bool AddScenery(SceneryInfo _SceneryInfo)
       {
           return this._SceneryInfoDAL.AddScenery(_SceneryInfo);
       }

        ///<summary>
        /// 根据景点ID查询景点信息
        ///</summary>
       public DataTable GetSceneryInfoByID(int SceneryID)
       {
           return this._SceneryInfoDAL.GetSceneryInfoByID(SceneryID);
       }

       ///<summary>
       //找出所有的景点
       ///</summary>
       public DataTable GetAllScenery()
       {
           return this._SceneryInfoDAL.GetAllScenery();
       }





       ///<summary>
       ///++++根据点评量查询景点信息++++
       ///</summary>
       public DataTable GetSceneryInfoByCmt(int CmtC)
       {
           return this._SceneryInfoDAL.GetSceneryInfoBycCmt(CmtC);
       }

        ///<summary>
        /// 更新景点信息
        ///</summary>
       public bool UpdSceneryInfoByID(int SceneryID, SceneryInfo _SceneryInfo)
       {
           return this._SceneryInfoDAL.UpdSceneryInfoByID(SceneryID, _SceneryInfo);
       }

        ///<summary>
        /// 根据景点ID删除该景点
        ///</summary>
       public bool DelScenery(int SceneryID)
       {
           return this._SceneryInfoDAL.DelScenery(SceneryID);
       }
        
        ///<summary>
        /// 根据市ID查询出该市的所有景点
        ///</summary>
       public DataTable GetCityScenery(int CityID)
       {
           return this._SceneryInfoDAL.GetCityScenery(CityID);
       }
              /// <summary>
       ///根据景点ID获取他在同程网上的总体的评论
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetTonChenTotalComment(int SceneryID)
       {
           return this._SceneryInfoDAL.GetTonChenTotalComment(SceneryID);
       }
              /// <summary>
       /// 根据景点ID，网站名，页面编号，页面大小获取该景点在同程网站上的评论并分页显示
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageIndex"></param>
       /// <param name="PageSize"></param>
       /// <returns></returns>
       public DataTable GetTonChenCommentSplit(int SceneryID, String WebSiteName, int PageIndex, int PageSize)
       {
           return this._SceneryInfoDAL.GetTonChenCommentSplit(SceneryID,WebSiteName,PageIndex,PageSize);
       }
       /// <summary>
       /// 根据景点ID获取他在驴妈妈上的总体评分
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetLvMaMaTotalComment(int SceneryID)
       {
           return this._SceneryInfoDAL.GetLvMaMaTotalComment(SceneryID);
       }

       /// 根据景点ID，网站名，页面编号，页面大小获取该景点在驴妈妈网站上的评论并分页显示
       public DataTable GetLvMaMaCommentSplit(int SceneryID, String WebSiteName, int PageIndex, int PageSize)
       {
           return this._SceneryInfoDAL.GetLvMaMaCommentSplit(SceneryID,WebSiteName,PageIndex,PageSize);
       }

       /// <summary>
       /// 根据景点ID，网站名查询该景点在该网站上的评论个数
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetCommentCount(int SceneryID, String WebSiteName)
       {
           return this._SceneryInfoDAL.GetCommentCount(SceneryID,WebSiteName);
       }

       public DataTable  IsSceneryExist(float Slatitude, float Slongtitude)
       {
           return this._SceneryInfoDAL.IsSceneryExist(Slatitude,Slongtitude);
       }

       //根据景点名模糊匹配出景点
       public DataTable GetSlaSLonBySceName(String SceneName)
       {
           return this._SceneryInfoDAL.GetSlaSLonBySceName(SceneName);
       }
       
       //根据TotalGradeID更新它在驴妈妈上的总体评分
       public void UpdLvMaMaTotalGrade(int TotalGradeID, float TotalScore)
       {
            this._SceneryInfoDAL.UpdLvMaMaTotalGrade(TotalGradeID,TotalScore);
       }

       public bool InsertToUserSceneryCmt(UserSceneryComment UserCmtObj)
       { 
           return  this._SceneryInfoDAL.InsertToUserSceneryCmt(UserCmtObj);
       }
    }
}
