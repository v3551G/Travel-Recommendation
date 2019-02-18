using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data;
using System.Data.SqlClient;
using Model.Scenery;
using Model.User;

namespace DAL.Scenery
{
   public class SceneryInfoDAL
    {
       SQLHelper SqlHelper = null;

       public SceneryInfoDAL()
       {
           this.SqlHelper = new SQLHelper();
       }
       /// <summary>
       /// 
       /// </summary>
       /// <returns></returns>
       public DataTable GetDLL()
       {
           String Sql = "select  SLongitude,Slatitude from SceneryInfo ";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter()
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       ///<suammary>
       ///根据UserAccount找到userID
       /// </suammary>
       public DataTable GetuserIDByAccount(String UserAccount)
       {
           String Sql = "select * from UserInformation where UserAccount = @UserAccount";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@UserAccount",UserAccount)
           };
           return this.SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       ///<summary>
       /// 根据UserID找到评论用户的账户信息
       /// </summary>
       public DataTable GetCmtUserAccountByUserID(String CmtUserID)
       {
           String Sql = "select UserAccount from UserInfo where UserID = @UserID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@UserID",CmtUserID)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }


       ///<summary>
       ///根据SceneryID找出用户对风景评论
       /// </summary>
       public DataTable GetUserCmtBySceID(int SceneryID)
       {
           //String Sql = "select * from UserSceneryComment where SceneryID = @SceneryID" ;
           String Sql = "select * from UserSceneryComment where SceneryID = @SceneryID order by CommentID desc"; //按CommentID降序排列，使得最新发表的评论第一个显示
           SqlParameter[] Paras = new SqlParameter[]
           { 
               new SqlParameter("@SceneryID",SceneryID)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       ///<summary>
       ///根据风景名称查询序列号
       ///</summary>
       public DataTable GetSeqSlalonBySceName(String SceName)
       {
           String Sql = "select SceneryID,SLongitude,Slatitude,TimeSpan,SceType from SceneryInfo where SceneryName = @SceneryName";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@SceneryName",SceName)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       ///<summary>
       /// 根据市的ID按照指定的条件查询出该市的景点
       ///</summary>
       public DataTable GetCitySceSplit(int CityID,int PageSize, int PageIndex)
       {
           
           SqlParameter[] Paras = new SqlParameter[]
           { 
             new SqlParameter("@CityID",CityID),
             new SqlParameter("@PageSize",PageSize),
             new SqlParameter("@PageIndex",PageIndex)
           };

           return SqlHelper.ExecuteQuery("CitySceSplit",Paras,CommandType.StoredProcedure);
       }

       ///<summary>
       /// 根据市的ID查询出该市的景点个数
       ///</summary>
       public int GetCitySceCount(int CityID)
       {
           String Sql = "select Count(*) from SceneryInfo where CityID= @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       }

        ///<summary>
        /// 添加景点
        ///</summary>
       public bool AddScenery(SceneryInfo _SceneryInfo)
       {
           String Sql = "insert into SceneryInfo(SceneryName,SceneryPrice,SceneryLoc,OpenTime,SLongitude,Slatitude,CityID,SceneryIntro,BestTravel)" +
               "values(@SceneryName,@SceneryPrice,@SceneryLoc,@OpenTime,@SLongitude,@Slatitude,@CityID,@SceneryIntro,@BestTravel)";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@SceneryName",_SceneryInfo.SceneryName),
              new SqlParameter("@SceneryPrice",_SceneryInfo.SceneryPrice),
              new SqlParameter("@SceneryLoc",_SceneryInfo.SceneryLoc),
              new SqlParameter("@OpenTime",_SceneryInfo.OpenTime),
              new SqlParameter("@SLongitude",_SceneryInfo.SLongitude),
              new SqlParameter("@Slatitude",_SceneryInfo.Slatitude),
              new SqlParameter("@CityID",_SceneryInfo.CityID),
              new SqlParameter("@SceneryIntro",_SceneryInfo.SceneryIntro),
              new SqlParameter("@BestTravel",_SceneryInfo.BestTravel),
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
           
       }
     
       /// <summary>
       /// 将用户发表评论写入UserSceneryComment表中
       /// </summary>
       /// <param name="_UserCmtObj"></param>
       /// <returns></returns>
       public bool InsertToUserSceneryCmt(UserSceneryComment _UserCmtObj)
       {
           String Sql = "insert into UserSceneryComment(UserID,CommentContent,SceneryID,SceneryRate,State)" +
               "values(@UserID,@CommentContent,@SceneryID,@SceneryRate,@State)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             //new SqlParameter("@CommentID",CommentID),
               new SqlParameter("@UserID",_UserCmtObj.UserID),
               new SqlParameter("@CommentContent",_UserCmtObj.CommentContent),
             //  new SqlParameter("@CommentTime",_UserCmtObj.CommentTime),
               new SqlParameter("@SceneryID",_UserCmtObj.SceneryID),
               new SqlParameter("@SceneryRate",_UserCmtObj.SceneryRate),
               new SqlParameter("@State",_UserCmtObj.State),
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }

        ///<summary>
        /// 根据景点ID查询景点信息
        ///</summary>
       public DataTable GetSceneryInfoByID(int SceneryID)
       {
           String Sql = "select * from SceneryInfo where SceneryID = @SceneryID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@SceneryID",SceneryID)
           };

           return this.SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       ///<summary>
       ///++++根据访问量从数据库中查询景点信息+_++++
       /// </summary>
       public DataTable GetSceneryInfoBycCmt(int CmtC)
       {
           //String str = CmtC + "";
           //String sql = "select * from SceneryInfo where (cast(Assess as VARCHAR(10))) > (cast(CmtC as VARCHAR(10))) ";
           //String sql = "select * from SceneryInfo where Assess >  " + str;

           String sql = "select * from SceneryInfo where Assess > @CmtC ";
           SqlParameter[] Paras = new SqlParameter[]
           {    
               new SqlParameter("@CmtC",CmtC)

           };
           return SqlHelper.ExecuteQuery(sql, Paras, CommandType.Text);

       }




        ///<summary>
        /// 更新景点信息
        ///</summary>
       public bool UpdSceneryInfoByID(int SceneryID,SceneryInfo _SceneryInfo)
       {
           String Sql = "Update SceneryInfo set SceneryLoc=@SceneryLoc,OpenTime = @OpenTime,SLongitude=@SLongitude ,"+
               " Slatitude=@Slatitude,SceneryIntro=@SceneryIntro,BestTravel=@BestTravel,SceneryPrice=@SceneryPrice "+
               " where SceneryID = @SceneryID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@SceneryLoc",_SceneryInfo.SceneryLoc),
              new SqlParameter("@OpenTime",_SceneryInfo.OpenTime),
              new SqlParameter("@SLongitude",_SceneryInfo.SLongitude),
              new SqlParameter("@Slatitude",_SceneryInfo.Slatitude),
              new SqlParameter("@SceneryIntro",_SceneryInfo.SceneryIntro),
              new SqlParameter("@BestTravel",_SceneryInfo.BestTravel),
              new SqlParameter("@SceneryPrice",_SceneryInfo.SceneryPrice),
              new SqlParameter("@SceneryID",SceneryID)
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }
        ///<summary>
        /// 根据景点ID删除该景点
        ///</summary>
       public bool DelScenery(int SceneryID)
       {
           String Sql = "delete from SceneryInfo where SceneryID = @SceneryID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@SceneryID",SceneryID)
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }
        
        ///<summary>
        /// 根据市ID查询出该市的所有景点
        ///</summary>
       public DataTable GetCityScenery(int CityID)
       {
           String Sql = "Select SceneryID,SceneryName from SceneryInfo where CityID = @CityID";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@CityID", CityID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       ///根据景点ID获取他在同程网上的总体的评论
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetTonChenTotalComment(int SceneryID)
       {
           String Sql = "select * from TongChengTotalGrade where SceneryID=@SceneryID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@SceneryID",SceneryID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       
       }
       /// <summary>
       /// 根据景点ID，网站名，页面编号，页面大小获取该景点在同程网站上的评论并分页显示
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageIndex"></param>
       /// <param name="PageSize"></param>
       /// <returns></returns>
       public DataTable GetTonChenCommentSplit(int SceneryID,String WebSiteName,int PageIndex,int PageSize)
       {
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@PageSize",PageSize),
              new SqlParameter("@PageIndex",PageIndex),
              new SqlParameter("@SceneryID",SceneryID),
              new SqlParameter("@WebSiteName",WebSiteName)
           };

           return SqlHelper.ExecuteQuery("TongChengCommentSplitPage",Paras,CommandType.StoredProcedure);
       }

       /// <summary>
       /// 根据景点ID，网站名查询该景点在该网站上的评论个数
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetCommentCount(int SceneryID,String WebSiteName)
       {
           String Sql = "select Count(*) from SceneryAccessment,PublisherInfo,WebSiteInfo where SceneryAccessment.PublisherID"+
    "= PublisherInfo.PublisherID and PublisherInfo.WebSiteID = WebSiteInfo.WebSiteID and  SceneryAccessment.SceneryID=@SceneryID and WebSiteInfo.WebSiteName=@WebSiteName";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@SceneryID",SceneryID),
             new SqlParameter("@WebSiteName",WebSiteName)
           
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
         
       }
       /// <summary>
       /// 根据景点ID获取他在驴妈妈上的总体评分
       /// </summary>
       /// <param name="SceneryID"></param>
       /// <returns></returns>
       public DataTable GetLvMaMaTotalComment(int SceneryID)
       {
           String Sql = "select * from LvMamaTotalGrade where SceneryID=@SceneryID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@SceneryID",SceneryID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
       /// 根据景点ID，网站名，页面编号，页面大小获取该景点在驴妈妈网站上的评论并分页显示
       public DataTable GetLvMaMaCommentSplit(int SceneryID,String WebSiteName,int PageIndex,int PageSize)
       {
           SqlParameter[] Paras = new SqlParameter[]
          {
            new SqlParameter("@SceneryID",SceneryID),
            new SqlParameter("@WebSiteName",WebSiteName),
            new SqlParameter("@PageSize",PageSize),
            new SqlParameter("@PageIndex",PageIndex),
          };
           return SqlHelper.ExecuteQuery("LvMaMaCommentSplitPage",Paras,CommandType.StoredProcedure);
       
       }

       public DataTable IsSceneryExist(float Slatitude,float Slongtitude)
       {
           String Sql = "Select * from SceneryInfo where Slatitude=@Slatitude and SLongitude = @SLongitude";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@Slatitude",Slatitude),
              new SqlParameter("@SLongitude",Slongtitude)
            
           };

           return this.SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }


       ///<summary>
       //出所有景点
       ///</summary>
       public DataTable GetAllScenery()
       {
           String sql = "select SceneryID,SceneryName from SceneryInfo ";
           SqlParameter[] Paras = new SqlParameter[]
           {
           };
           return this.SqlHelper.ExecuteQuery(sql, Paras, CommandType.Text);
       }


       //根据景点名模糊匹配出景点
       public DataTable GetSlaSLonBySceName(String SceneName)
       {
           String Sql = "select * from SceneryInfo where SceneryName like" + "'%" + SceneName + "%'";

           return this.SqlHelper.ExecuteQuery(Sql,CommandType.Text);
       }

       //根据TotalGradeID更新它在驴妈妈上的总体评分
       public void UpdLvMaMaTotalGrade(int TotalGradeID, float TotalScore)
       {
           String Sql = "update LvMamaTotalGrade set TotalScore=@TotalScore where TotalGradeID = @TotalGradeID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@TotalScore",TotalScore),
             new SqlParameter("@TotalGradeID",TotalGradeID)
           };
           this.SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
    }
}
