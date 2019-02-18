using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.HotelDAL;
using System.Data;
using Model.Hotel;

namespace BLL.HotelBLL
{
   public class HtlTypeBLL
    {
       private HtlTypeDAL _HtlTypeDAL = null;

       public HtlTypeBLL()
       {
           _HtlTypeDAL = new HtlTypeDAL();
       }

       /// <summary>
       /// 根据酒店ID查询出酒店类型
       /// </summary>
       /// <param name="HtlID"></param>
       /// <returns></returns>
       public DataTable GetHtlTypeByID(int HtlID)
       {
           return this._HtlTypeDAL.GetHtlTypeByID(HtlID);
       }

       /// <summary>
       /// 添加一个酒店的类型
       /// </summary>
       /// <param name="_HtlType"></param>
       /// <returns></returns>
       public bool AddHtlType(HtlType _HtlType)
       {
           return this._HtlTypeDAL.AddHtlType(_HtlType);
       }

       /// <summary>
       /// 根据房型ID删除房型
       /// </summary>
       /// <param name="HtlTypeID"></param>
       /// <returns></returns>
       public bool DelHtlTypeByTypeID(int HtlTypeID)
       {
           return this._HtlTypeDAL.DelHtlTypeByTypeID(HtlTypeID);
       }

       /// <summary>
       /// 根据酒店ID删除酒店类型类型
       /// </summary>
       /// <param name="HtlID"></param>
       /// <returns></returns>
       public bool DelHtlTypeByHtlID(int HtlID)
       {
           return _HtlTypeDAL.DelHtlTypeByHtlID(HtlID);
       }
    }
}
