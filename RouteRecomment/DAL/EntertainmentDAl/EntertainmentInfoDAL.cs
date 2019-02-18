using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data;
using System.Data.SqlClient;
using Model.Entertainment;

namespace DAL.EntertainmentDAl
{
   public class EntertainmentInfoDAL
    {
       SQLHelper SqlHelper = null;

       
       public EntertainmentInfoDAL()
       {
           SqlHelper = new SQLHelper();
       }
       public bool InsertToEntertainCmt(EntertainmentComment _UserCmtObj)
        {
            String Sql = "insert into EntertainmentComment(UserID,CommentContent,EntertainmentID,Rate,State)" +
             "values(@UserID,@CommentContent,@RestaurantID,@Rate,@State)";

            SqlParameter[] Paras = new SqlParameter[]
           {
             //new SqlParameter("@CommentID",CommentID),
               new SqlParameter("@UserID", _UserCmtObj.UserID),
               new SqlParameter("@CommentContent", _UserCmtObj.CommentContent),
             //  new SqlParameter("@CommentTime",_UserCmtObj.CommentTime),
               new SqlParameter("@RestaurantID", _UserCmtObj.EntertainID),
               new SqlParameter("@Rate", _UserCmtObj.Rate),
               new SqlParameter("@State", _UserCmtObj.State),
           };

            if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;   
        }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="_Account"></param>
       /// <returns></returns>
       public DataTable GetUserIDByAccount(String _Account)
       {
           String Sql = "select * from UserInformation where UserAccount = @UserAccount";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@UserAccount",_Account)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }
       /// <summary>
       /// 
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
       /// 
       /// </summary>
       /// <param name="EnterID"></param>
       /// <returns></returns>
       public DataTable GetUserCmtByEnterID(int EnterID)
       {
           //String Sql = "select * from OurHotelComment where HotelID = @SceneryID" ;
           String Sql = "select * from EntertainmentComment where EntertainmentID = @ResID order by ID desc"; //按CommentID降序排列，使得最新发表的评论第一个显示
           SqlParameter[] Paras = new SqlParameter[]
           { 
               new SqlParameter("@ResID",EnterID)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 获取市的娱乐场所信息并分页显示
       /// </summary>
       /// <param name="CityID"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageStart"></param>
       /// <returns></returns>
       public DataTable CityEnterTainMentSplit(int CityID,int PageSize,int PageStart)
       {
           SqlParameter[] Paras = new SqlParameter[]
         {
            new SqlParameter("@CityID",CityID),
            new SqlParameter("@PageSize",PageSize),
            new SqlParameter("@PageIndex",PageStart)
         };

           return SqlHelper.ExecuteQuery("CityEnterTainMentSplit",Paras,CommandType.StoredProcedure);
       
       }

       /// <summary>
       /// 根据市ID获取该市的所有娱乐场所个数
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public int GetEntertainCountByCityID(int CityID)
       {
           String Sql = "select Count(*) from EntertainmentInfo where CityID = @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@CityID",CityID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       }
       /// <summary>
       /// 添加一个娱乐场所信息
       /// </summary>
       /// <param name="_EntertainmentInfo"></param>
       /// <returns></returns>
       public bool AddEntertainMent(EntertainmentInfo _EntertainmentInfo)
       {
           String Sql = "insert into EntertainmentInfo(Local,PhoneNum,Introduction,OpenTime,CityID,SLongitude,Slatitude,EntertainmentName) values"+
                        "(@Local,@PhoneNum,@Introduction,@OpenTime,@CityID,@SLongitude,@Slatitude,@EntertainmentName)";

           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@Local",_EntertainmentInfo.Local),
               new SqlParameter("@PhoneNum",_EntertainmentInfo.PhoneNum),
               new SqlParameter("@Introduction",_EntertainmentInfo.Introduction),
               new SqlParameter("@OpenTime",_EntertainmentInfo.OpenTime),
               new SqlParameter("@CityID",_EntertainmentInfo.CityID),
               new SqlParameter("@SLongitude",_EntertainmentInfo.SLongitude),
               new SqlParameter("@Slatitude",_EntertainmentInfo.Slatitude),
               new SqlParameter("@EntertainmentName",_EntertainmentInfo.EntertainmentName)                     
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }
       /// <summary>
       /// 根据娱乐场所ID查询娱乐场所信息
       /// </summary>
       /// <param name="EntertainmentID"></param>
       /// <returns></returns>
       public DataTable GetEnterInfoByID(int EntertainmentID)
       {
           String Sql = "select * from EntertainmentInfo where  EntertainmentID = @EntertainmentID ";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@EntertainmentID",EntertainmentID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 跟新娱乐场所信息
       /// </summary>
       /// <param name="EnterID"></param>
       /// <param name="_EntertainmentInfo"></param>
       /// <returns></returns>
       public bool UpdEnterInfo(int EnterID, EntertainmentInfo _EntertainmentInfo)
       {
           String Sql = "update EntertainmentInfo set Local=@Local,PhoneNum=@PhoneNum,Introduction=@Introduction,OpenTime=@OpenTime," +
                        "SLongitude=@SLongitude,Slatitude=@Slatitude where EntertainmentID = @EntertainmentID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@SLongitude",_EntertainmentInfo.SLongitude),
              new SqlParameter("@Slatitude",_EntertainmentInfo.Slatitude),
              new SqlParameter("@Local",_EntertainmentInfo.Local),
              new SqlParameter("@Introduction",_EntertainmentInfo.Introduction),
              new SqlParameter("@OpenTime",_EntertainmentInfo.OpenTime),
              new SqlParameter("@PhoneNum",_EntertainmentInfo.PhoneNum),
              new SqlParameter("@EntertainmentID",EnterID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }

       /// <summary>
       /// 根据娱乐场所ID删除娱乐场所
       /// </summary>
       /// <param name="EnterID"></param>
       /// <returns></returns>
       public bool DelEnterInfo(int EnterID)
       {
           String Sql = "delete from EntertainmentInfo where EntertainmentID = @EntertainmentID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@EntertainmentID",EnterID)
           };


           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;     
       }

       /// <summary>
       /// 根据市ID查询出该市的娱乐场所
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public DataTable GetCityEntertainment(int CityID)
       {
           String Sql = "select * from EntertainmentInfo where CityID = @CityID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       
       }
       /// <summary>
       /// 根据娱乐场所ID查出它所在的市
       /// </summary>
       /// <param name="EnterID"></param>
       /// <returns></returns>
       public int GetCityIDByEnterID(int EnterID)
       {
           String Sql = "select CityID from EntertainmentInfo where EntertainmentID=@EntertainmentID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@EntertainmentID",EnterID)
           };
           return int.Parse(SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text).ToString());
       }

       /// <summary>
       /// 根据景点ID查询他在大众点评上的总体评分
       /// </summary>
       /// <param name="EntertainmentID"></param>
       /// <returns></returns>
       public DataTable DaZhongEnterTotalAssesment(int EntertainmentID)
       {
           String Sql = "select * from DaZhongEntertTotalAssessment where EntertainmentID=@EntertainmentID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@EntertainmentID",EntertainmentID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       
       }
       /// <summary>
       /// 根据景点ID查询他在爱帮上的总体评分
       /// </summary>
       /// <param name="EntertainmentID"></param>
       /// <returns></returns>
       public DataTable AiBangEnterttTotalAssessment(int EntertainmentID)
       {
           String Sql = "select * from AiBangEnterttTotalAssessment where @EntertainmentID=EntertainmentID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@EntertainmentID",EntertainmentID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
       /// <summary>
       /// 根据娱乐场所ID，网站名，页码，页大小查询出大众网站内的娱乐场所评论并分页显示
       /// </summary>
       /// <param name="EntertainmentID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable DaZhongEnterCommentSplit(int EntertainmentID, String WebSiteName,int PageSize,int PageIndex)
       {
           SqlParameter[] Paras = new SqlParameter[]
          {
             new SqlParameter("@EntertainmentID",EntertainmentID),
             new SqlParameter("@WebSiteName",WebSiteName),
             new SqlParameter("@PageSize",PageSize),
             new SqlParameter("@PageIndex",PageIndex)
           
          };

           return SqlHelper.ExecuteQuery("DaZhongEnterCommentSplitPage",Paras,CommandType.StoredProcedure);
       
       }

       /// <summary>
       /// 根据娱乐场所ID，网站名，页码，页大小查询出该爱帮内的娱乐场所评论并分页显示
       /// </summary>
       /// <param name="EntertainmentID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable AiBangEnterCommentSplit(int EntertainmentID, String WebSiteName, int PageSize, int PageIndex)
       { 
          SqlParameter[] Paras = new SqlParameter[]
          {
             new SqlParameter("@EntertainmentID",EntertainmentID),
             new SqlParameter("@WebSiteName",WebSiteName),
             new SqlParameter("@PageSize",PageSize),
             new SqlParameter("@PageIndex",PageIndex)           
          };

          return SqlHelper.ExecuteQuery("AiBangEnterCommentSplitPage",Paras,CommandType.StoredProcedure);
       }

       /// <summary>
       /// 根据娱乐场所ID查询出该餐馆在大众点评上的评论个数
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetDaZhongCommentCount(int EntertainmentID)
       {
           String Sql = "select Count(*) from DaZhongEntertainmentAssessment ,PublisherInfo,WebSiteInfo where DaZhongEntertainmentAssessment .PublisherID" +
"= PublisherInfo.PublisherID and PublisherInfo.WebSiteID = WebSiteInfo.WebSiteID and  DaZhongEntertainmentAssessment.EntertainmentID=@EntertainmentID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@EntertainmentID",EntertainmentID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text);

       }
       /// <summary>
       /// 根据娱乐场所ID查询出该餐馆在爱帮网上的评论个数
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetAiBangCommentCount(int EntertainmentID)
       {
           String Sql = "select Count(*) from AiBangEntertainmentAssessment,PublisherInfo,WebSiteInfo where AiBangEntertainmentAssessment.PublisherID" +
"= PublisherInfo.PublisherID and PublisherInfo.WebSiteID = WebSiteInfo.WebSiteID and  AiBangEntertainmentAssessment.EntertainmentID=@EntertainmentID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@EntertainmentID",EntertainmentID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       
       }

       public DataTable IsEnterExist(float Slatitude, float Slongtitude)
       {
           String Sql = "Select * from EntertainmentInfo where Slatitude=@Slatitude and SLongitude = @SLongitude";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@Slatitude",Slatitude),
              new SqlParameter("@SLongitude",Slongtitude)
            
           };

           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

    }
}
