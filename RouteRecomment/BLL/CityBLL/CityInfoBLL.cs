using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.CityDAL;
using System.Data;
using Model.City;

namespace BLL.CityBLL
{
   public class CityInfoBLL
    {
       private CityInfoDAL _CityInfoDAL = null;

       public CityInfoBLL()
       {
           this._CityInfoDAL = new CityInfoDAL();
       }

       /// <summary>
       /// 获得所有市的信息
       /// </summary>
       /// <returns></returns>
       public DataTable GetAllCityInfo()
       {
           return this._CityInfoDAL.GetAllCityInfo();
       }

        /// <summary>
        /// 根据市ID查询出该市的信息
        /// </summary>
        /// <returns></returns>
       public DataTable GetCityInfoByID(int CityID)
       {
           return this._CityInfoDAL.GetCityInfoByID(CityID);
       }

        /// <summary>
        /// 根据市ID更新该市的信息
        /// </summary>
        /// <returns></returns>
       public bool UpdateCityInfoBy(int CityID, CityInfo _CityInfo)
       {
           return this._CityInfoDAL.UpdateCityInfoBy(CityID, _CityInfo);
       }

        /// <summary>
        /// 添加一个市的信息
        /// </summary>
        /// <returns></returns>
       public bool AddCityInfo(CityInfo _CityInfo)
       {
           return this._CityInfoDAL.AddCityInfo(_CityInfo);
       }
        
        /// <summary>
        /// 根据市名检查该市存在否
        /// </summary>
        /// <returns></returns>
       public bool IsCityExist(String CityName)
       {
           return this._CityInfoDAL.IsCityExist(CityName);
       }

        /// <summary>
        /// 根据市ID删除该市的信息
        /// </summary>
        /// <returns></returns>
       public bool DelCityByID(int CityID)
       {
           return this._CityInfoDAL.DelCityByID(CityID);
       }
    }
}
