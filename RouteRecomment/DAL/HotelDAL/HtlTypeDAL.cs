using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data;
using System.Data.SqlClient;
using Model.Hotel;

namespace DAL.HotelDAL
{
   public class HtlTypeDAL
    {
       SQLHelper SqlHelper = null;

       public HtlTypeDAL()
       {
           this.SqlHelper = new SQLHelper();
       }

       /// <summary>
       /// 根据酒店ID查询出酒店类型
       /// </summary>
       /// <param name="HtlID"></param>
       /// <returns></returns>
       public DataTable GetHtlTypeByID(int HtlID)
       {
           String Sql = "select * from HotelType where HotelID = @HotelID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@HotelID",HtlID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 添加一个酒店的类型
       /// </summary>
       /// <param name="_HtlType"></param>
       /// <returns></returns>
       public bool AddHtlType(HtlType _HtlType)
       {
           String Sql = "insert into HotelType(HotelID,HouseType,Squre,Floor,BedType,Internet) values(@HotelID,@HouseType,@Squre,@Floor,@BedType,@Internet)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter ("@HotelID",_HtlType.HotelID),
             new SqlParameter("@HouseType",_HtlType.HouseType),
             new SqlParameter("@Squre",_HtlType.Squre),
             new SqlParameter ("@Floor",_HtlType.Floor),
             new SqlParameter("@BedType",_HtlType.BedType),
             new SqlParameter("@Internet",_HtlType.Internet)           
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }
       /// <summary>
       /// 根据房型ID删除房型
       /// </summary>
       /// <param name="HtlTypeID"></param>
       /// <returns></returns>
       public bool DelHtlTypeByTypeID(int HtlTypeID)
       {
           String Sql = "delete from HotelType where ID = @HtlTypeID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@HtlTypeID",HtlTypeID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }

       /// <summary>
       /// 根据酒店ID删除酒店类型类型
       /// </summary>
       /// <param name="HtlID"></param>
       /// <returns></returns>
       public bool DelHtlTypeByHtlID(int HtlID)
       {
           String Sql = "delete from HotelType where HotelID = @HtlID";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@HtlID",HtlID)
           };
           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;

       }

    }
}
