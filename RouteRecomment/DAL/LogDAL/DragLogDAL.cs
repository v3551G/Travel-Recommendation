using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using Model.Log;
using System.Data.SqlClient;
using System.Data;

namespace DAL.DragLog
{
   public class DragLogDAL
    {
       private SQLHelper SqlHelper;
       public DragLogDAL()
       {
           SqlHelper = new SQLHelper();
       }
       
       /// <summary>
       /// 添加拖拽日志
       /// </summary>
       /// <param name="_DragLogInfo"></param>
       /// <returns></returns>
       public bool AddDragLog(DragLogInfo _DragLogInfo)
       {
           //String Sql = "insert into DragLog(UserID,DragTime,DragContent,IP) values (@UserID,@DragTime,@DragContent,@IP)";
           string Sql = "insert into DragLog (UserAccount,DragTime,DragContent,IP) values (@account,@DragTime,@DragContent,@IP)";
           SqlParameter[] Paras = new SqlParameter[]
           {
             //new SqlParameter("@UserID",_DragLogInfo.UserID),
             new SqlParameter("@account",_DragLogInfo.UserAccount),
             new SqlParameter("@DragTime",_DragLogInfo.DateTime),
             new SqlParameter("@DragContent",_DragLogInfo.DragContent),
             new SqlParameter("@IP",_DragLogInfo.IP)
           };

           if( this.SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true ;
           return false;
       }

       /// <summary>
       /// 分页显示拖拽日志
       /// </summary>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable DragLogSplit(int PageSize,int PageIndex)
       {
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@PageSize",PageSize),
              new SqlParameter("@PageIndex",PageIndex)
           };

           return this.SqlHelper.ExecuteQuery("DragLogSplit",Paras,CommandType.StoredProcedure);
       }
       
       /// <summary>
       /// 获得拖拽日志的个数
       /// </summary>
       /// <returns></returns>
       public int GetDragLogCount()
       {
           String Sql = "select count(*) from DragLog";

           return int.Parse(this.SqlHelper.ExecuteScalar(Sql,CommandType.Text).ToString());
       }

       /// <summary>
       /// 根据拖拽日志ID删除日志
       /// </summary>
       /// <param name="ID"></param>
       /// <returns></returns>
       public bool DelDragLog(int ID)
       {
           String Sql = "delete from DragLog where ID = @ID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@ID",ID)
           };

           if (this.SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }

    }
}
