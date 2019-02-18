using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.RestaurantDAL;
using System.Data;
using Model.Restaurant;

namespace BLL.RestaurantBLL
{   
   
   public class RestaurantInfoBLL
    {
       private RestaurantInfoDAL _RestInfoDAL = null;
       public RestaurantInfoBLL()
       {
           this._RestInfoDAL = new RestaurantInfoDAL();
       }

       public bool InsertToResCmt(OurResComment _UserCmtObj)
       {
           return this._RestInfoDAL.InsertToResCmt(_UserCmtObj);
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="Account"></param>
       /// <returns></returns>
       public DataTable GetUserIDByAccount(String Account)
       {
           return this._RestInfoDAL.GetUserIDByAccount(Account);
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetUserCmtByResID(int ResID)
       {
           return this._RestInfoDAL.GetUserCmtByResID(ResID);
       }


       /// <summary>
       /// 
       /// </summary>
       /// <param name="CmtUserID"></param>
       /// <returns></returns>
       public DataTable GetCmtUserAccountByUserID(String CmtUserID)
       {
           return this._RestInfoDAL.GetCmtUserAccountByuserID(CmtUserID);
       }

       /// <summary>
       /// 获得市餐馆的分页信息
       /// </summary>
       /// <param name="CityID"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageStart"></param>
       /// <returns></returns>
       public DataTable GetCityResSplit(int CityID, int PageSize, int PageStart)
       {
           return this._RestInfoDAL.GetCityResSplit(CityID,PageSize,PageStart);
       }

        /// <summary>
       /// 根据市ID获得市的菜馆个数
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public int GetCityResCount(int CityID)
       {
           return this._RestInfoDAL.GetCityResCount(CityID);
       }

        /// <summary>
       /// 添加餐馆信息
       /// </summary>
       /// <param name="_Res"></param>
       /// <returns></returns>
       public bool AddResInfo(RestaurantInfo _Res)
       {
           return this._RestInfoDAL.AddResInfo(_Res);
       }
       
       /// <summary>
       /// 根据餐馆ID删除餐馆
       /// </summary>
       /// <param name="RestaurantID"></param>
       /// <returns></returns>
       public bool DelResInfo(int RestaurantID)
       {
           return this._RestInfoDAL.DelResInfo(RestaurantID);
       }

              /// <summary>
       /// 根据餐馆ID查询出餐馆信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetResInfo(int ResID)
       {
           return this._RestInfoDAL.GetResInfo(ResID);
       }
              /// <summary>
       /// 更新餐馆信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="_Res"></param>
       /// <returns></returns>
       public bool UpdResInfo(int ResID, RestaurantInfo _Res)
       {
           return this._RestInfoDAL.UpdResInfo(ResID,_Res);
       }
              /// <summary>
       /// 向餐馆中添加一个菜
       /// </summary>
       /// <param name="_ResFoodInfo"></param>
       /// <returns></returns>
       public bool AddResFood(RestaurantFoodInfo _ResFoodInfo)
       {
           return this._RestInfoDAL.AddResFood(_ResFoodInfo);
       }
       /// <summary>
       /// 根据餐馆ID获取餐馆所有菜
       /// </summary>
       /// <param name="RestaurantID"></param>
       /// <returns></returns>
       public DataTable GetResFood(int RestaurantID)
       {
           return this._RestInfoDAL.GetResFood(RestaurantID);
       }

       /// <summary>
       /// 根据餐馆ID删除餐馆菜
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public bool DelFoodByResID(int ResID)
       {
           return this._RestInfoDAL.DelFoodByResID(ResID);
       }

       /// <summary>
       /// 根据美食ID删除美食
       /// </summary>
       /// <param name="FoodID"></param>
       /// <returns></returns>
       public bool DelFoodByFoodID(int FoodID)
       {
           return this._RestInfoDAL.DelFoodByFoodID(FoodID);
       }
        /// <summary>
       /// 根据市ID查询出该市的餐馆
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public DataTable GetCityRes(int CityID)
       {
           return this._RestInfoDAL.GetCityRes(CityID);
       }
              /// <summary>
       /// 查询出餐馆所在市
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public int GetResCityByResID(int ResID)
       {
           return this._RestInfoDAL.GetResCityByResID(ResID);
       }

       /// <summary>
       /// 根据餐馆ID查询出他在携程网上的总体评分
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetXieChenTotalComment(int RestaurantID)
       {
           return this._RestInfoDAL.GetXieChenTotalComment(RestaurantID);
       }

       /// <summary>
       /// 根据餐馆ID获取他在大众点评上的总体信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetDaZhongTotalComment(int RestaurantID)
       {
           return this._RestInfoDAL.GetDaZhongTotalComment(RestaurantID);
       }

       /// <summary>
       /// 根据餐馆ID查询出他在爱帮网站上的总体评分
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetAiBangTotalComment(int RestaurantID)
       {
           return this._RestInfoDAL.GetAiBangTotalComment(RestaurantID);
       }
              /// <summary>
       /// 根据餐馆ID，网站名，分页大小，页号查询出该餐馆在该网站上的评论
       /// </summary>
       /// <param name="RestaurantID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable ResCommentSplitPage(int RestaurantID, String WebSiteName, int PageSize, int PageIndex)
       {
           return this._RestInfoDAL.ResCommentSplitPage(RestaurantID,WebSiteName,PageSize,PageIndex);
       }

       /// <summary>
       /// 查询一个餐馆的所有菜以及菜的图片信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetFoodAndPic(int ResID)
       {
           return this._RestInfoDAL.GetFoodAndPic(ResID);
       }
       /// <summary>
       /// 根据酒店ID和网站名查询在该网站上有多少条该酒店的评论
       /// </summary>
       /// <param name="HtlID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetCommentCount(int HtlID, String WebSiteName)
       {
           return this._RestInfoDAL.GetCommentCount(HtlID,WebSiteName);
       }

       /// <summary>
       /// 根据餐馆ID查询出带有图片的菜信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetFoodWithPic(int ResID)
       {
           return this._RestInfoDAL.GetFoodWithPic(ResID);
       }

       /// <summary>
       /// 根据餐馆ID查询出没有图片的菜信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetFoodNoPic(int ResID)
       {
           return this._RestInfoDAL.GetFoodNoPic(ResID);
       }

       public DataTable  IsResExist(float Slatitude, float Slongtitude)
       {
           return this._RestInfoDAL.IsResExist(Slatitude,Slongtitude);
       }
    }
}
