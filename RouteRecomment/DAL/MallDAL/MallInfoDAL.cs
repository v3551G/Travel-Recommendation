using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data;
using System.Data.SqlClient;
using Model.Mall;

namespace DAL.MallDAL
{
   public class MallInfoDAL
    {
       SQLHelper SqlHelper = null;

       public MallInfoDAL()
       {
           SqlHelper = new SQLHelper();
       }

       public bool InsertToMallCmt(UserMallComment _UserCmtObj)
       {
           String Sql = "insert into MallComment(UserID,CommentContent,MallID,Rate,State)" +
               "values(@UserID,@CommentContent,@MallID,@Rate,@State)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             //new SqlParameter("@CommentID",CommentID),
               new SqlParameter("@UserID",_UserCmtObj.UserID),
               new SqlParameter("@CommentContent",_UserCmtObj.CommentContent),
             //  new SqlParameter("@CommentTime",_UserCmtObj.CommentTime),
               new SqlParameter("@MallID",_UserCmtObj.MallID),
               new SqlParameter("@Rate",_UserCmtObj.Rate),
               new SqlParameter("@State",_UserCmtObj.State),
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }

       public DataTable GetUserIDByAccount(String UserAccount)
       {
           String Sql = "select * from UserInformation where UserAccount = @UserAccount";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@UserAccount",UserAccount)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 根据UseriD找用户信息
       /// </summary>
       /// <param name="CmtUserID"></param>
       /// <returns></returns>
       public DataTable GetCmtUserAccountByUserID(String CmtUserID)
       {
           String Sql = "select UserAccount from UserInfo where UserID = @UserID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@UserID",CmtUserID)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 根据MallID找评论
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public DataTable GetUserCmtByShopID(int MallID)
       {
           //String Sql = "select * from UserSceneryComment where SceneryID = @SceneryID" ;
           String Sql = "select * from MallComment where MallID = @MallID order by ID desc"; //按CommentID降序排列，使得最新发表的评论第一个显示
           SqlParameter[] Paras = new SqlParameter[]
           { 
               new SqlParameter("MallID",MallID)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 根据市ID获取市商场并分页显示
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public DataTable GetCityMallSplit(int CityID,int PageSize,int PageStart)
       {
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID),
              new SqlParameter("@PageSize",PageSize),
              new SqlParameter("@PageIndex",PageStart)
           };

           return SqlHelper.ExecuteQuery("CityMallSplit",Paras,CommandType.StoredProcedure);
       
       }

       /// <summary>
       /// 根据市ID返回市商场个数
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public int GetCityMallCount(int CityID)
       {
           String Sql = "select Count(*) from MallInfo where CityID = @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID)
           };

           return int.Parse(SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text).ToString());
       
       }
       /// <summary>
       /// 添加一个商场信息
       /// </summary>
       /// <param name="_MallInfo"></param>
       public bool AddMallInfo(MallInfo _MallInfo)
       {
           String Sql = "insert into MallInfo(Local,PhoneNum,Introduction,OpenTime,CityID,SLongitude,Slatitude,MallName) values" +
             "(@Local,@PhoneNum,@Introduction,@OpenTime,@CityID,@SLongitude,@Slatitude,@MallName)";

           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@Local",_MallInfo.Local),
               new SqlParameter("@PhoneNum",_MallInfo.PhoneNum),
               new SqlParameter("@Introduction",_MallInfo.Introduction),
               new SqlParameter("@OpenTime",_MallInfo.OpenTime),
               new SqlParameter("@CityID",_MallInfo.CityID),
               new SqlParameter("@SLongitude",_MallInfo.SLongitude),
               new SqlParameter("@Slatitude",_MallInfo.Slatitude),
               new SqlParameter("@MallName",_MallInfo.MallName)                     
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       
       }
       /// <summary>
       /// 根据商场ID查询商场信息
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public DataTable GetMallInfoByID(int MallID)
       {
           String Sql = "select * from MallInfo where MallID = @MallID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@MallID",MallID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);

       }

       /// <summary>
       /// 更新酒店信息
       /// </summary>
       /// <param name="MallID"></param>
       /// <param name="_MallInfo"></param>
       /// <returns></returns>
       public bool UpdMallInfo(int MallID,MallInfo _MallInfo)
       {
           String Sql = "update MallInfo set Local=@Local,PhoneNum=@PhoneNum,Introduction=@Introduction,OpenTime=@OpenTime," +
                 "SLongitude=@SLongitude,Slatitude=@Slatitude where MallID = @MallID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@SLongitude",_MallInfo.SLongitude),
              new SqlParameter("@Slatitude",_MallInfo.Slatitude),
              new SqlParameter("@Local",_MallInfo.Local),
              new SqlParameter("@Introduction",_MallInfo.Introduction),
              new SqlParameter("@OpenTime",_MallInfo.OpenTime),
              new SqlParameter("@PhoneNum",_MallInfo.PhoneNum),
              new SqlParameter("@MallID",MallID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       
       }

       /// <summary>
       /// 根据商场ID删除商场信息
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public bool DelMallInfoByID(int MallID)
       {
           String Sql = "delete from MallInfo where MallID= @MallID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@MallID",MallID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       
       
       }
       /// <summary>
       /// 获得商场所在的市ID
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public int GetMallCityID(int MallID)
       {
           String Sql = "select CityID from MallInfo where MallID = @MallID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@MallID",MallID)
           };

           return int.Parse(SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text).ToString());
       }
       /// <summary>
       /// 查询市的所有商场
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public DataTable GetCityMall(int CityID)
       {
           String Sql = "select * from MallInfo where CityID = @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       
       }
       /// <summary>
       /// 根据商场ID查询他在大众点评上的总体评分
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public DataTable DaZhongMallTotalComment(int MallID)
       {
           String Sql = "select * from DaZhongMallTotalComment where MallID = @MallID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@MallID",MallID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
        }

       /// <summary>
       /// 根据商场ID查询出他在爱帮网上的总体评分
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
       public DataTable AibangMallTotalComment(int MallID)
       {
           String Sql = "select * from AibangMallTotalComment where MallID = @MallID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@MallID",MallID)
           
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 根据购物场所ID，网站名,分页号，分页大小，查询出购物场所在该网站上的评论
       /// </summary>
       /// <param name="MallID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable DaZhongMallCommentSplitPage(int MallID,String WebSiteName,int PageSize,int PageIndex)
       {
           SqlParameter[] Paras = new SqlParameter[]
          {
            new SqlParameter("@MallID",MallID),
            new SqlParameter("@WebSiteName",WebSiteName),
            new SqlParameter("@PageSize",PageSize),
            new SqlParameter("@PageIndex",PageIndex)
          
          };

           return SqlHelper.ExecuteQuery("DaZhongMallCommentSplitPage",Paras,CommandType.StoredProcedure);
       
       }
       /// <summary>
       /// 根据购物场所ID，网站名,分页号，分页大小，查询出购物场所在爱帮网站上的评论
       /// </summary>
       /// <param name="MallID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable AiBangMallCommentSplitPage(int MallID, String WebSiteName, int PageSize, int PageIndex)
       {
           SqlParameter[] Paras = new SqlParameter[]
          {
             new SqlParameter("@MallID",MallID),
             new SqlParameter("@WebSiteName",WebSiteName),
             new SqlParameter("@PageSize",PageSize),
             new SqlParameter("@PageIndex",PageIndex)
          };

           return SqlHelper.ExecuteQuery("AiBangMallCommentSplitPage",Paras,CommandType.StoredProcedure);
       }

       /// <summary>
       /// 根据购物ID查询出该购物场所在该爱帮网上的评论个数
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetAiBangCommentCount(int MallID)
       {
           String Sql = "select Count(*) from AiBangMallAssessment  where AiBangMallAssessment.MallID=@MallID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@MallID",MallID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text);

       }

       /// <summary>
       /// 根据购物ID查询出该购物场所在该大众点评上的评论个数
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int DaZhongMallCommentCount(int MallID)
       {
           String Sql = "select Count(*) from DaZhongMallAssessment   where DaZhongMallAssessment .MallID=@MallID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@MallID",MallID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text);

       }
       public DataTable IsMallExist(float Slatitude, float Slongtitude)
       {
           String Sql = "Select * from MallInfo where Slatitude=@Slatitude and SLongitude = @SLongitude";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@Slatitude",Slatitude),
              new SqlParameter("@SLongitude",Slongtitude)
            
           };

           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }
    }
}
