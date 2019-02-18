using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.HotelDAL;
using System.Data;
using Model.Hotel;

namespace BLL.HotelBLL
{
   public class HotelInfoBLL
    {
       HotelInfoDAL _HotelInfoDAL = null;

       public HotelInfoBLL()
       {
           this._HotelInfoDAL = new HotelInfoDAL();
       }

       /// <summary>
       /// 
       /// </summary>
       /// <returns></returns>
       public bool InsertToHotelCmt(UserHotelComment _UserHotelComment)
       {
           return this._HotelInfoDAL.InsertToHotelCmt(_UserHotelComment);
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="Account"></param>
       /// <returns></returns>
       public DataTable GetUserIDByAccount(String Account)
       {
           return this._HotelInfoDAL.GetUserByAccount(Account);
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="CmtUserID"></param>
       /// <returns></returns>
       public DataTable GetCmtUserAccountByUserID(String CmtUserID)
       {
           return this._HotelInfoDAL.GetCmtUserAccountByUserID(CmtUserID);
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="HotelID"></param>
       /// <returns></returns>
       public DataTable GetUserCmtByHotelID(int HotelID)
       {
           return this._HotelInfoDAL.GetUserCmtByHotelID(HotelID);
       }

       /// <summary>
       /// 根据市ID找出该市的酒店并分页显示
       /// </summary>
       public DataTable GetCityHtlSplit(int CityID, int PageSize, int PageIndex)
       {
           return this._HotelInfoDAL.GetCityHtlSplit(CityID,PageSize,PageIndex);
       }

       /// <summary>
       /// 获得所有酒店信息
       /// </summary>
       /// <returns></returns>
       public DataTable GetHtlInfoByCtyID(int CityID)
       {
           return this._HotelInfoDAL.GetHtlInfoByCtyID(CityID);
       }

       /// <summary>
       /// 根据市ID查询该市的酒店个数
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public int GetCityHtlCount(int CityID)
       {
           return this._HotelInfoDAL.GetCityHtlCount(CityID);
       }
       
       /// <summary>
       /// 添加一个酒店
       /// </summary>
       /// <param name="_HotelInfo"></param>
       /// <returns></returns>
       public bool AddHotel(HotelInfo _HotelInfo)
       {
           return this._HotelInfoDAL.AddHotel(_HotelInfo);
       }
       
       /// <summary>
       /// 根据酒店ID查询酒店信息
       /// </summary>
       /// <param name="HotelID"></param>
       /// <returns></returns>
       public DataTable GetHotelInfoByHtlID(int HotelID)
       {
           return this._HotelInfoDAL.GetHotelInfoByHtlID(HotelID);
       }

        /// <summary>
       /// 更新酒店信息
       /// </summary>
       /// <param name="HotelID"></param>
       /// <param name="_HotelInfo"></param>
       /// <returns></returns>
       public bool UpdHotelInfo(int HotelID, HotelInfo _HotelInfo)
       {
           return this._HotelInfoDAL.UpdHotelInfo(HotelID,_HotelInfo);
       }
       
       /// <summary>
       /// 根据酒店ID删除酒店信息
       /// </summary>
       /// <param name="HotelID"></param>
       /// <returns></returns>
       public bool DelHotelByHotelID(int HotelID)
       {
           return this._HotelInfoDAL.DelHotelByHotelID(HotelID);
       }

       /// <summary>
       /// 根据酒店ID 网站名查询出该酒店ID在该网站上的总体评论信息
       /// </summary>
       /// <param name="HotelID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public DataTable GetHotelTotalComment(int HotelID, String WebSiteName)
       {
           return this._HotelInfoDAL.GetHotelTotalComment(HotelID,WebSiteName);
       }

       /// <summary>
       /// 根据酒店ID，网站名，页码，页大小，查询出该酒店在该网站的评论并分页显示
       /// </summary>
       /// <param name="HotelID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageIndex"></param>
       /// <param name="PageSize"></param>
       /// <returns></returns>
       public DataTable GetHotelCommentSplit(int HotelID, String WebSiteName, int PageIndex, int PageSize)
       {
           return this._HotelInfoDAL.GetHotelCommentSplit(HotelID,WebSiteName,PageIndex,PageSize);
       }

              /// <summary>
       /// 根据酒店ID和网站名查询在该网站上有多少条该酒店的评论
       /// </summary>
       /// <param name="HtlID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetCommentCount(int HtlID, String WebSiteName)
       {
           return this._HotelInfoDAL.GetCommentCount(HtlID,WebSiteName);
       }

       public DataTable  IsHotelExist(float Slatitude, float Slongtitude)
       {
           return this._HotelInfoDAL.IsHotelExist(Slatitude,Slongtitude);
       }
    }
}
