using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.HotelDAL;
using Model.Hotel;
using System.Data;

namespace BLL.HotelBLL
{
   public class HtlTypeDetailBLL
    {
       private HtlTypeDetailDAL _HtlTypeDetailDAL = null;

       public HtlTypeDetailBLL()
       {
           this._HtlTypeDetailDAL = new HtlTypeDetailDAL();
       }

        /// <summary>
       /// 添加一个酒店房型的子房型
       /// </summary>
       /// <param name="_HtlTypeDetail"></param>
       /// <returns></returns>
       public bool AddHotelTypeDetail(HtlTypeDetail _HtlTypeDetail)
       {
           return this._HtlTypeDetailDAL.AddHotelTypeDetail(_HtlTypeDetail);
       }

        /// <summary>
       /// 根据房型类型返回其子类型
       /// </summary>
       /// <param name="HotelTypeID"></param>
       /// <returns></returns>
       public DataTable GetHotelTypeDetail(int HotelTypeID)
       {
           return this._HtlTypeDetailDAL.GetHotelTypeDetail(HotelTypeID);
       }

       /// <summary>
       ///  根据子类型ID 删除子类型
       /// </summary>
       /// <param name="ID"></param>
       /// <returns></returns>
       public bool DelHotelTypeDetail(int ID)
       {
           return this._HtlTypeDetailDAL.DelHotelTypeDetail(ID);
       }

       /// <summary>
       /// 根据酒店类型ID删除 他的所有子类型
       /// </summary>
       /// <param name="HtlTypeID"></param>
       /// <returns></returns>
       public bool DelHotelTypeDetailByTypeID(int HtlTypeID)
       {
           return this._HtlTypeDetailDAL.DelHotelTypeDetailByTypeID(HtlTypeID);
       }

        /// <summary>
       /// 根据酒店类型ID 获取它下面的子类型数
       /// </summary>
       /// <param name="HtlTypeID"></param>
       /// <returns></returns>
       public int GetHtlDetailCountByID(int HtlTypeID)
       {
           return this._HtlTypeDetailDAL.GetHtlDetailCountByID(HtlTypeID);
       }
    }
}
