using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model.City;
using DAL.AuthorityDAL;
using System.Data;
using System.Data.SqlClient;

namespace DAL.CityDAL
{
   public class CityInfoDAL
    {
       private SQLHelper SqlHelper = null;

       public CityInfoDAL()
       {
           this.SqlHelper = new SQLHelper();
       }

       /// <summary>
       /// 获得所有市的信息
       /// </summary>
       /// <returns></returns>
       public DataTable GetAllCityInfo()
       {
           String Sql = "select * from CityInfo";
           return this.SqlHelper.ExecuteQuery(Sql,CommandType.Text);
       
       }

        /// <summary>
        /// 根据市ID查询出该市的信息
        /// </summary>
        /// <returns></returns>
       public DataTable GetCityInfoByID(int CityID)
       {
           String Sql = "select * from CityInfo where CityID = @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID)
           };

           return (DataTable)SqlHelper.ExecuteQuery(Sql, Paras,CommandType.Text);
       }


        /// <summary>
        /// 根据市ID更新该市的信息
        /// </summary>
        /// <returns></returns>
       public bool UpdateCityInfoBy(int CityID, CityInfo _CityInfo)
       {
           String Sql = "update CityInfo set Introduction = @Introduction ,CityName=@CityName where CityID = @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@Introduction",_CityInfo.Introduction),
              new SqlParameter("@CityName",_CityInfo.CityName),
              new SqlParameter("@CityID",@CityID)
           };

           if(SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true ;
           return false;
       }

        /// <summary>
        /// 添加一个市的信息
        /// </summary>
        /// <returns></returns>
       public bool AddCityInfo(CityInfo _CityInfo)
       {
           String Sql = "insert into CityInfo(Introduction,CityName) values (@Introduction,@CityName)";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@Introduction",_CityInfo.Introduction),
              new SqlParameter("@CityName",_CityInfo.CityName)
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }

        /// <summary>
        /// 根据市名检查该市存在否
        /// </summary>
        /// <returns></returns>
       public bool IsCityExist(String CityName)
       {
           String Sql = "select Count(*) from CityInfo where CityName = @CityName";

           SqlParameter [] Paras = new SqlParameter[]
           {
           
              new SqlParameter("@CityName",CityName)
           };

           if ((int)SqlHelper.ExecuteScalar(Sql,Paras, CommandType.Text) > 0)
               return true;
           return false;
       }

        /// <summary>
        /// 根据市ID删除该市的信息
        /// </summary>
        /// <returns></returns>
       public bool DelCityByID(int CityID)
       {
           String Sql = "delete from CityInfo where CityID = @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID)
           };

           if ((int)SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       
       }
    }
}
