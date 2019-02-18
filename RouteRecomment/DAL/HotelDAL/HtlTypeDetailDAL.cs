using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using Model.Hotel;
using System.Data.SqlClient;
using System.Data;

namespace DAL.HotelDAL
{
   public class HtlTypeDetailDAL
    {
       private SQLHelper SqlHelper = null;

       public HtlTypeDetailDAL()
       {
           this.SqlHelper = new SQLHelper();
       }

       /// <summary>
       /// 添加一个酒店房型的子房型
       /// </summary>
       /// <param name="_HtlTypeDetail"></param>
       /// <returns></returns>
       public bool AddHotelTypeDetail(HtlTypeDetail _HtlTypeDetail)
       {
           String Sql = "insert into HotelTypeDetail(HouseType,BedType,HaveBreakfast,Broadband,Price,TypeID) values " +
               "(@HouseType,@BedType,@HaveBreakfast,@Broadband,@Price,@TypeID)";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@HouseType",_HtlTypeDetail.HouseType),
              new SqlParameter("@BedType",_HtlTypeDetail.BedType),
              new SqlParameter("@HaveBreakfast",_HtlTypeDetail.HaveBreakfast),
              new SqlParameter("@Broadband",_HtlTypeDetail.Broadband),
              new SqlParameter("@Price",_HtlTypeDetail.Price),
              new SqlParameter("@TypeID",_HtlTypeDetail.TypeID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text)>0)
               return true;
           return false;
       }

       /// <summary>
       /// 根据房型类型返回其子类型
       /// </summary>
       /// <param name="HotelTypeID"></param>
       /// <returns></returns>
       public DataTable GetHotelTypeDetail(int HotelTypeID)
       {
           String Sql = "select * from HotelTypeDetail where TypeID = @HotelTypeID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@HotelTypeID",HotelTypeID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }


       /// <summary>
       ///  根据子类型ID 删除子类型
       /// </summary>
       /// <param name="ID"></param>
       /// <returns></returns>
       public bool DelHotelTypeDetail(int ID)
      {
           String Sql = "delete from HotelTypeDetail where ID = @ID";
         
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@ID",ID)
           };

           if( this.SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true ;
           return false;
      }
       /// <summary>
       /// 根据酒店类型ID删除 他的所有子类型
       /// </summary>
       /// <param name="HtlTypeID"></param>
       /// <returns></returns>
       public bool DelHotelTypeDetailByTypeID(int HtlTypeID)
       {
           String Sql = "delete from HotelTypeDetail where TypeID= @TypeID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@TypeID",HtlTypeID)
           };

           if (this.SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       
       }
       /// <summary>
       /// 根据酒店类型ID 获取它下面的子类型数
       /// </summary>
       /// <param name="HtlTypeID"></param>
       /// <returns></returns>
       public int GetHtlDetailCountByID(int HtlTypeID)
       { 
          String Sql = "Select Count(*) from HotelTypeDetail where TypeID = @TypeID";

          SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@TypeID",HtlTypeID)
           };

          return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       
       }
    }
}
