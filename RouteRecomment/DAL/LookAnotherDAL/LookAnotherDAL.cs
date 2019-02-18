using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using Model.LookAnother;
using System.Data.SqlClient;
using System.Data;

namespace DAL.LookAnother
{
   public class LookAnotherDAL
    {
       private SQLHelper SqlHelper;
       public LookAnotherDAL()
       {
           SqlHelper = new SQLHelper();
       }
       /// <summary>
       /// 插入一条看了又看信息
       /// </summary>
       /// <param name="_LookAnotherInfo"></param>
       /// <returns></returns>
       public int AddLookAnother(LookAnotherInfo _LookAnotherInfo)
       {
           String Sql = "insert into LookAnother(KeyID,AnotherLookID,GoalType)"+
               "values(@KeyID,@AnotherLookID,@GoalType)";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@KeyID",_LookAnotherInfo.KeyID),
             new SqlParameter("@AnotherLookID",_LookAnotherInfo.AnotherLookID),
             new SqlParameter("@GoalType",_LookAnotherInfo.GoalType)
           };

           return this.SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 根据元素ID，类型  删除该类型的该元素
       /// </summary>
       /// <param name="KeyID"></param>
       /// <param name="Type"></param>
       /// <returns></returns>
       public int DelByIDType(int KeyID, String Type)
       {
           String Sql = "delete from LookAnother where KeyID = @KeyID and GoalType=@Type";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@KeyID",KeyID),
             new SqlParameter("@Type",Type)
           };

           return this.SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text);
       }

    }
}
