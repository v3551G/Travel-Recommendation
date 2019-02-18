using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.MallDAL;
using System.Data;
using Model.Mall;

namespace BLL.MallInfoBLL
{
   public class MallInfoBLL
    {

       MallInfoDAL _MallInfoDAL = null;

       public MallInfoBLL()
       {
           _MallInfoDAL = new MallInfoDAL();
       }

       public bool InsertToMallCmt(UserMallComment _UserCmtObj)
       {
           return this._MallInfoDAL.InsertToMallCmt(_UserCmtObj);
       }

       ///
       public DataTable GetUserIDByAccount(String UserAccount)
       {
           return this._MallInfoDAL.GetUserIDByAccount(UserAccount);
       }

       /// <summary>
       /// 根据UserID找到用户信息
       /// </summary>
       /// <param name="CmtUserID"></param>
       /// <returns></returns>
       public DataTable GetCmtUserAccountByUserID(String CmtUserID)
       {
           return this._MallInfoDAL.GetCmtUserAccountByUserID(CmtUserID);
       }
       
       /// <summary>
       /// 根据MallID获取评论
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public DataTable GetUserCmtByShopID(int MallID)
       {
           return this._MallInfoDAL.GetUserCmtByShopID(MallID);
       }

       /// <summary>
       /// 根据市ID获取市商场
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public DataTable GetCityMallSplit(int CityID, int PageSize, int PageStart)
       {
           return this._MallInfoDAL.GetCityMallSplit(CityID,PageSize,PageStart);
       }

        /// <summary>
       /// 根据市ID返回市商场个数
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public int GetCityMallCount(int CityID)
       {
           return this._MallInfoDAL.GetCityMallCount(CityID);
       }
        /// <summary>
       /// 添加一个商场信息
       /// </summary>
       /// <param name="_MallInfo"></param>
       public bool AddMallInfo(MallInfo _MallInfo)
       {
           return this._MallInfoDAL.AddMallInfo(_MallInfo);
       }
       /// <summary>
       /// 根据商场ID查询商场信息
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public DataTable GetMallInfoByID(int MallID)
       {
           return this._MallInfoDAL.GetMallInfoByID(MallID);
       }

       /// <summary>
       /// 更新酒店信息
       /// </summary>
       /// <param name="MallID"></param>
       /// <param name="_MallInfo"></param>
       /// <returns></returns>
       public bool UpdMallInfo(int MallID, MallInfo _MallInfo)
       {
           return this._MallInfoDAL.UpdMallInfo(MallID, _MallInfo);
       }

       /// <summary>
       /// 根据商场ID删除商场信息
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public bool DelMallInfoByID(int MallID)
       {
           return this._MallInfoDAL.DelMallInfoByID(MallID);
       }
       /// <summary>
       /// 获得商场所在的市ID
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public int GetMallCityID(int MallID)
       {
           return this._MallInfoDAL.GetMallCityID(MallID);
       }

        /// <summary>
       /// 查询市的所有商场
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public DataTable GetCityMall(int CityID)
       {
           return this._MallInfoDAL.GetCityMall(CityID);
       }

        /// <summary>
       /// 根据商场ID查询他在大众点评上的总体评分
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public DataTable DaZhongMallTotalComment(int MallID)
       {
           return this._MallInfoDAL.DaZhongMallTotalComment(MallID);
       }
        /// <summary>
       /// 根据商场ID查询出他在爱帮网上的总体评分
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public DataTable AibangMallTotalComment(int MallID)
       {
           return this._MallInfoDAL.AibangMallTotalComment(MallID);
       }
              /// <summary>
       /// 根据购物场所ID，网站名,分页号，分页大小，查询出购物场所在该网站上的评论
       /// </summary>
       /// <param name="MallID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable DaZhongMallCommentSplitPage(int MallID, String WebSiteName, int PageSize, int PageIndex)
       {
           return this._MallInfoDAL.DaZhongMallCommentSplitPage(MallID,WebSiteName,PageSize,PageIndex);
       }
              /// <summary>
       /// 根据购物场所ID，网站名,分页号，分页大小，查询出购物场所在爱帮网站上的评论
       /// </summary>
       /// <param name="MallID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable AiBangMallCommentSplitPage(int MallID, String WebSiteName, int PageSize, int PageIndex)
       {
           return this._MallInfoDAL.AiBangMallCommentSplitPage(MallID,WebSiteName,PageSize,PageIndex);
       }

       /// <summary>
       /// 根据购物ID查询出该购物场所在该爱帮网上的评论个数
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetAiBangCommentCount(int MallID)
       {
           return this._MallInfoDAL.GetAiBangCommentCount(MallID);

       }

        /// <summary>
       /// 根据购物ID查询出该购物场所在该大众点评上的评论个数
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int DaZhongMallCommentCount(int MallID)
       {
           return this._MallInfoDAL.DaZhongMallCommentCount(MallID);
       }

       public DataTable  IsMallExist(float Slatitude, float Slongtitude)
       {
           return this._MallInfoDAL.IsMallExist(Slatitude,Slongtitude);
       }
    }
}
