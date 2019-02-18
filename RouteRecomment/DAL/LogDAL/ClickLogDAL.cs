using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using Model.Log;
using System.Data.SqlClient;
using System.Data;

namespace DAL.LogDAL
{
   public class ClickLogDAL
    {
       private SQLHelper SqlHelper;

       public ClickLogDAL()
       {
           this.SqlHelper = new SQLHelper();
       }

       /// <summary>
       /// 添加一条日志
       /// </summary>
       /// <param name="_ClicLogInfo"></param>
       public int AddClickLog(ClickLogInfo _ClicLogInfo)
       {
           String Sql = "insert into ClickLog(UserID,ClickTime,ClickContent,ContentType,IP,ContentFlag) values"
               + "(@UserID,@ClickTime,@ClickContent,@ContentType,@IP,@ContentFlag)";
       
           SqlParameter [] Paras = new SqlParameter[]
           {
             new SqlParameter("@UserID",_ClicLogInfo.UserID),
             new SqlParameter("@ClickTime",_ClicLogInfo.ClickTime),
             new SqlParameter("@ClickContent",_ClicLogInfo.ClickContent),
             new SqlParameter("@ContentType",_ClicLogInfo.ContentType),
             new SqlParameter("@IP",_ClicLogInfo.IP),
             new SqlParameter("@ContentFlag",_ClicLogInfo.ContentFlag)
           };

           return SqlHelper.ExecuteNonQuery(Sql, Paras,CommandType.Text);
       }

       /// <summary>
       /// 获取看了这个景点的用户的IP
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetSeeSceneryIDPeople(int SceneryID)
       {
           String Sql = "select IP from ClickLog where ContentFlag = @ContentFlag"
               +" and ContentType='景点'";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ContentFlag",SceneryID)
           };
           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
       /// <summary>
       /// 获取看了这个酒店的用户的IP
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetSeeHotelIDPeople(int HotelID)
       {
           String Sql = "select IP from ClickLog where ContentFlag = @ContentFlag"
               + "and ContentType='酒店'";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ContentFlag",HotelID)
           };
           return SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 获取看了这个餐馆的用户的IP
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetSeeResIDPeople(int ResID)
       {
           String Sql = "select IP from ClickLog where ContentFlag = @ContentFlag"
               + "and ContentType='餐馆'";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ContentFlag",ResID)
           };
           return SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 获取看了这个购物的用户的IP
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetSeeMallIDPeople(int MallID)
       {
           String Sql = "select IP from ClickLog where ContentFlag = @ContentFlag"
               + "and ContentType='购物'";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ContentFlag",MallID)
           };
           return SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 获取看了这个娱乐的用户的IP
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetSeeEnterIDPeople(int EnterID)
       {
           String Sql = "select IP from ClickLog where ContentFlag = @ContentFlag"
               + "and ContentType='娱乐'";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ContentFlag",EnterID)
           };
           return SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 根据IP、类型名查询出一个用户观看该类型的所有信息
       /// </summary>
       /// <param name="IP"></param>
       /// <param name="TypeName"></param>
       /// <returns></returns>
       public DataTable GetAllOneSee(String IP,String TypeName)
       {
           String Sql = "select ContentFlag from ClickLog where IP=@IP and ContentType = @ContentType";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@IP",IP),
              new SqlParameter("@ContentType",TypeName)
           };
           return this.SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       
       }

       /// <summary>
       /// 获取某个类型(景点、酒店)的点击日志 并分页显示
       /// </summary>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <param name="ContentType"></param>
       /// <returns></returns>
       public DataTable GetClickLogSplit(int PageSize,int PageIndex,String ContentType)
       {
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@PageSize",PageSize),
              new SqlParameter("@PageIndex",PageIndex),
              new SqlParameter("@ContentType",ContentType)
           };

           return this.SqlHelper.ExecuteQuery("GetClickLogSplit",Paras,CommandType.StoredProcedure);
       
       
       }
       /// <summary>
       /// 根据点击日志类型 获取该类型下的所有日志记录个数
       /// </summary>
       /// <param name="ContentType"></param>
       /// <returns></returns>
       public int GetClickTypeCount(String ContentType)
       {
           String Sql = "select count(*) from ClickLog where ContentType=@ContentType";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ContentType",ContentType)
           };
           return int.Parse(this.SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text).ToString());
       
       }
       /// <summary>
       /// 获取所有日志并分页显示
       /// </summary>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable GetLogSplit(int PageSize, int PageIndex)
       {
           SqlParameter[] Paras = new SqlParameter[]
         {
           new SqlParameter("@PageSize",PageSize),
           new SqlParameter("@PageIndex",PageIndex)
          
         };

           return this.SqlHelper.ExecuteQuery("GetLogSplit",Paras,CommandType.StoredProcedure);
       }

       /// <summary>
       /// 获取所有日志的数量
       /// </summary>
       /// <returns></returns>
       public int GetLogCount()
       {
           String Sql = "select count(*) from ClickLog";

           return int.Parse(this.SqlHelper.ExecuteScalar(Sql,CommandType.Text).ToString());
       }

       /// <summary>
       /// 根据日志ID删除日志
       /// </summary>
       /// <param name="ID"></param>
       /// <returns></returns>
       public bool DelLogByID(int ID)
       {
           String Sql = "delete from ClickLog where ID = @ID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ID",ID)
           };

            if(this.SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
                return true ;
            return false;
       }

    }
}
