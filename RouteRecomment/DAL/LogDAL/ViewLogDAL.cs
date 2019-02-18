using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data.SqlClient;
using Model.Log;
using System.Data;

namespace DAL.LogDAL
{
   public class ViewLogDAL
    {
       private SQLHelper SqlHelper;

       public ViewLogDAL()
       {
           this.SqlHelper = new SQLHelper();
       }
       /// <summary>
       /// 添加一个浏览日志
       /// </summary>
       /// <param name="_ViewLogInfo"></param>
       /// <returns></returns>
       public int AddViewLog(ViewLogInfo _ViewLogInfo)
       {
           String Sql = "insert into ViewLog(UserID,ViewTime,ViewContent,TimeSpan,IP)values (@UserID,@ViewTime,@ViewContent,@TimeSpan,@IP)";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@UserID",_ViewLogInfo.UserID),
              new SqlParameter("@ViewTime",_ViewLogInfo.ViewTime),
              new SqlParameter("@ViewContent",_ViewLogInfo.ViewContent),
              new SqlParameter("@TimeSpan",_ViewLogInfo.TimeSpan),
              new SqlParameter("@IP",_ViewLogInfo.IP)
           };
           return this.SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 分页显示浏览日志
       /// </summary>
       /// <param name="PageIndex"></param>
       /// <param name="PageSize"></param>
       /// <returns></returns>
       public DataTable GetViewLogSplit(int PageIndex,int PageSize)
       {
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@PageIndex",PageIndex),
              new SqlParameter("@PageSize",PageSize)
           };


           return this.SqlHelper.ExecuteQuery("ViewLogSplit",Paras,CommandType.StoredProcedure);
       
       }
       
       /// <summary>
       /// 查询出浏览日志个数
       /// </summary>
       /// <returns></returns>
       public int GetViewLogCount()
       {
           String Sql = "select count(*) from ViewLog ";

           return int.Parse(this.SqlHelper.ExecuteScalar(Sql,CommandType.Text).ToString());
       }

       /// <summary>
       /// 根据日志ID删除一条日志记录
       /// </summary>
       /// <param name="ID"></param>
       /// <returns></returns>
       public bool DelViewLog(int ID)
       {
           String Sql = "delete from ViewLog where @ID = ID";
           
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@ID",ID)
           };

           if (this.SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }
    }
}
