using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.PicDAL;
using System.Data;
using Model.Picture;

namespace BLL.PicBLL
{
   public class PicInfoBLL
    {

       private PicInfoDAL _PicInfoDAL = null;

       public PicInfoBLL()
       {
         this._PicInfoDAL = new PicInfoDAL ();

       }

       ///<summary>
       ///根据StrategyID查出对应图片（加）
       ///</summary>
       public DataTable GetOtherSceneryByStrategyID(int StrategyID)
       {
           return this._PicInfoDAL.GetOtherSceneryByStrategyID(StrategyID);
       }

       ///<summary>
       ///根据市ID查询出该市的图片
       ///</summary>
       public DataTable GetPicByCityID(int CityID)
       {
           return this._PicInfoDAL.GetPicByCityID(CityID);
       }

       ///<summary>
       ///添加一张图片
       ///</summary>
       public bool AddPic(PicInfo _PicInfo)
       {
           return this._PicInfoDAL.AddPic(_PicInfo);
       }

        ///<summary>
        ///根据市ID添加该市的一张图片
        ///</summary>
       public bool AddCityPic(int CityID, int PicID)
       {
           return this._PicInfoDAL.AddCityPic(CityID,PicID);
       }

        ///<summary>
        ///根据图片名和添加时间来查询出图片ID
        ///</summary>
       public int GetPicID(String PicName, DateTime UpLoadTime)
       {
           return this._PicInfoDAL.GetPicID(PicName,UpLoadTime);
       }

        ///<summary>
        ///根据图片ID删除该图片
        ///</summary>
       public bool DelPicByID(int PicID)
       {
           return this._PicInfoDAL.DelPicByID(PicID);
       }
        ///<summary>
        ///根据图片ID删除该市图片
        ///</summary>
       public bool DelCityPicByID(int PicID)
       {
           return this._PicInfoDAL.DelCityPicByID(PicID);
       }
        
       ///<summary>
        ///根据景点ID查询出关于该景点的图片
        ///</summary>
       public DataTable GetPicBySceID(int SceID)
       {
           return this._PicInfoDAL.GetPicBySceID(SceID);
       }

         ///<summary>
        ///根据景点ID添加该景点的一张图片
        ///</summary>
       public bool AddSceneryPic(int SceneryID, int PicID)
       {
           return this._PicInfoDAL.AddSceneryPic(SceneryID,PicID);
       }

        ///<summary>
        ///根据图片ID删除景点图片
        ///</summary>
       public bool DelScePicByID(int PicID)
       {
           return this._PicInfoDAL.DelScePicByID(PicID);
       }
       /// <summary>
       /// 根据酒店ID，景点ID添加一张图片
       /// </summary>
       /// <param name="HtlID"></param>
       /// <param name="PicID"></param>
       /// <returns></returns>
       public bool AddHotelPic(int HtlID, int PicID)
       {
           return this._PicInfoDAL.AddHotelPic(HtlID,PicID);
       }
       /// <summary>
       /// 根据酒店ID查询出该酒店的图片
       /// </summary>
       /// <param name="HtlID"></param>
       /// <returns></returns>
       public DataTable GetPicByHtlID(int HtlID)
       {
           return this._PicInfoDAL.GetPicByHtlID(HtlID);
       }

        /// <summary>
       /// 根据图片ID删除酒店图片
       /// </summary>
       /// <param name="PicID"></param>
       /// <returns></returns>
       public bool DelHtlPicByID(int PicID)
       {
           return this._PicInfoDAL.DelHtlPicByID(PicID);
       }
       
       /// <summary>
       /// 更具餐馆ID查询出其图片
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetResPicByID(int ResID)
       {
           return this._PicInfoDAL.GetResPicByID(ResID);
       }

              /// <summary>
       /// 添加一张餐馆图片
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="PicID"></param>
       /// <returns></returns>
       public bool AddResPic(int ResID, int PicID)
       {
           return this._PicInfoDAL.AddResPic(ResID,PicID);
       }
              /// <summary>
       /// 根据图片ID删除餐馆图片
       /// </summary>
       /// <param name="PicID"></param>
       /// <returns></returns>
       public bool DelResPicByPicID(int PicID)
       {
           return this._PicInfoDAL.DelResPicByPicID(PicID);
       }
        /// <summary>
       /// 根据美食ID查询美食图片
       /// </summary>
       /// <param name="FoodID"></param>
       /// <returns></returns>
       public DataTable GetFoodPicByFID(int FoodID)
       {
           return _PicInfoDAL.GetFoodPicByFID(FoodID);
       }

              /// <summary>
       /// 添加一张美食图片
       /// </summary>
       /// <param name="FoodID"></param>
       /// <param name="PicID"></param>
       /// <returns></returns>
       public bool AddFoodPic(int FoodID, int PicID)
       {
           return this._PicInfoDAL.AddFoodPic(FoodID,PicID);
       }

       /// <summary>
       /// 根据图片ID删除美食图片
       /// </summary>
       /// <param name="PicID"></param>
       /// <returns></returns>
       public bool DelFoodPicByPicID(int PicID)
       {
           return this._PicInfoDAL.DelFoodPicByPicID(PicID);
       }

       /// <summary>
       /// 根据娱乐场所ID查询其图片信息
       /// </summary>
       /// <param name="EnterID"></param>
       /// <returns></returns>
       public DataTable GetEnterPicByEnterID(int EnterID)
       {
           return this._PicInfoDAL.GetEnterPicByEnterID(EnterID);
       }

       /// <summary>
       /// 添加一张娱乐场所图片
       /// </summary>
       /// <param name="EnterID"></param>
       /// <param name="PicID"></param>
       /// <returns></returns>
       public bool AddEnterPic(int EnterID, int PicID)
       {
           return this._PicInfoDAL.AddEnterPic(EnterID,PicID);
       }

       /// <summary>
       /// 根据图片ID删除娱乐场所图片
       /// </summary>
       /// <param name="PicID"></param>
       /// <returns></returns>
       public bool DelEntetPicByID(int PicID)
       {
           return this._PicInfoDAL.DelEntetPicByID(PicID);
       }
        /// <summary>
       /// 获取商场图片
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public DataTable GetMallPic(int MallID)
       {
           return this._PicInfoDAL.GetMallPic(MallID);
       }
        /// <summary>
        /// 添加一张商场图片
        /// </summary>
        /// <param name="MallID"></param>
        /// <param name="PicID"></param>
        /// <returns></returns>
       public bool AddMallPic(int MallID, int PicID)
       {
           return this._PicInfoDAL.AddMallPic(MallID,PicID);
       }

              /// <summary>
       /// 根据图片ID删除商场图片
       /// </summary>
       /// <param name="PicID"></param>
       /// <returns></returns>
       public bool DelMallPic(int PicID)
       {
           return this._PicInfoDAL.DelMallPic(PicID);
       }

    }


}
