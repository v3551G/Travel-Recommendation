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
   public class HotelInfoDAL
    {
       SQLHelper SqlHelper = null;

       public HotelInfoDAL()
       {
           this.SqlHelper = new SQLHelper();
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="_UserHotelComment"></param>
       /// <returns></returns>
       public bool InsertToHotelCmt(UserHotelComment _UserHotelComment)
       {
           String Sql = "insert into OurHotelComment(UserID,Contend,HotelID,Rate,State)" +
              "values(@UserID,@CommentContent,@MallID,@Rate,@State)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             //new SqlParameter("@CommentID",CommentID),
               new SqlParameter("@UserID",_UserHotelComment.UserID),
               new SqlParameter("@CommentContent",_UserHotelComment.CommentContent),
             //  new SqlParameter("@CommentTime",_UserCmtObj.CommentTime),
               new SqlParameter("@MallID",_UserHotelComment.HotelID),
               new SqlParameter("@Rate",_UserHotelComment.Rate),
               new SqlParameter("@State",_UserHotelComment.State),
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="Account"></param>
       /// <returns></returns>
       public DataTable GetUserByAccount(String Account)
       {
           String Sql = "select * from UserInformation where UserAccount = @UserAccount";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@UserAccount",Account)
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
       /// <param name="HotelID"></param>
       /// <returns></returns>
       public DataTable GetUserCmtByHotelID(int HotelID)
       {
           //String Sql = "select * from OurHotelComment where HotelID = @SceneryID" ;
           String Sql = "select * from OurHotelComment where HotelID = @SceneryID order by ID desc"; //按CommentID降序排列，使得最新发表的评论第一个显示
           SqlParameter[] Paras = new SqlParameter[]
           { 
               new SqlParameter("@SceneryID",HotelID)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 根据市ID找出该市的酒店并分页显示
       /// </summary>
       public DataTable GetCityHtlSplit(int CityID,int PageSize,int PageIndex)
       {
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@CityID",CityID),
             new SqlParameter("@PageSize",PageSize),
             new SqlParameter("@PageIndex",PageIndex)
           };

           return SqlHelper.ExecuteQuery("CityHtlSplit",Paras,CommandType.StoredProcedure);
       
       }

       /// <summary>
       /// 获得所有酒店信息
       /// </summary>
       /// <returns></returns>
       public DataTable GetHtlInfoByCtyID(int CityID)
       {
           String Sql = "select * from HotelInfo where CityID = @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID)
           };
           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 根据市ID查询该市的酒店个数
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public int GetCityHtlCount(int CityID)
       {
           String Sql = "select count(*) from HotelInfo where CityID = @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID)
           };
           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       
       }
       /// <summary>
       /// 添加一个酒店
       /// </summary>
       /// <param name="_HotelInfo"></param>
       /// <returns></returns>
       public bool AddHotel(HotelInfo _HotelInfo)
       {
           String Sql = "insert into HotelInfo(HotelName,Star,Locate,PhoneNum,HotelService,HotelIntroduction,RestaurantDevice,IndoorService,CityID,SLongitude,Slatitude)" +
              "values(@HotelName,@Star,@Locate,@PhoneNum,@HotelService,@HotelIntroduction,@RestaurantDevice,@IndoorService,@CityID,@SLongitude,@Slatitude)";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@HotelName",_HotelInfo.HotelName),
              new SqlParameter("@Star",_HotelInfo.Star),
              new SqlParameter("@Locate",_HotelInfo.Local),
              new SqlParameter("@PhoneNum",_HotelInfo.PhoneNum),
              new SqlParameter("@HotelService",_HotelInfo.HotelService),
              new SqlParameter("@HotelIntroduction",_HotelInfo.HotelIntroduction),
              new SqlParameter("@RestaurantDevice",_HotelInfo.RestaurantDevice),
              new SqlParameter("@IndoorService",_HotelInfo.IndoorService),
              new SqlParameter("@CityID",_HotelInfo.CityID),
              new SqlParameter("@SLongitude",_HotelInfo.SLongitude),
              new SqlParameter("@Slatitude",_HotelInfo.Slatitude)

           };

           if( this.SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }

       /// <summary>
       /// 更新酒店信息
       /// </summary>
       /// <param name="HotelID"></param>
       /// <param name="_HotelInfo"></param>
       /// <returns></returns>
       public bool UpdHotelInfo(int HotelID,HotelInfo _HotelInfo)
       {
           String Sql = "Update HotelInfo set HotelName=@HotelName,Star=@Star,Locate=@Locate,PhoneNum = @PhoneNum,HotelService=@HotelService,"+
                         "HotelIntroduction=@HotelIntroduction,RestaurantDevice=@RestaurantDevice,IndoorService=@IndoorService,CityID=@CityID"
                         + ",SLongitude=@SLongitude,Slatitude=@Slatitude where HotelID = @HotelID";

           SqlParameter[] Paras = new SqlParameter[]
           {  
               new SqlParameter("@HotelID",HotelID),
              new SqlParameter("@HotelName",_HotelInfo.HotelName),
              new SqlParameter("@Star",_HotelInfo.Star),
              new SqlParameter("@Locate",_HotelInfo.Local),
              new SqlParameter("@PhoneNum",_HotelInfo.PhoneNum),
              new SqlParameter("@HotelService",_HotelInfo.HotelService),
              new SqlParameter("@HotelIntroduction",_HotelInfo.HotelIntroduction),
              new SqlParameter("@RestaurantDevice",_HotelInfo.RestaurantDevice),
              new SqlParameter("@IndoorService",_HotelInfo.IndoorService),
              new SqlParameter("@CityID",_HotelInfo.CityID),
              new SqlParameter("@SLongitude",_HotelInfo.SLongitude),
              new SqlParameter("@Slatitude",_HotelInfo.Slatitude)
           
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }



       /// <summary>
       /// 根据酒店ID查询酒店信息
       /// </summary>
       /// <param name="HotelID"></param>
       /// <returns></returns>
       public DataTable GetHotelInfoByHtlID(int HotelID)
       {
           String Sql = "select * from HotelInfo where HotelID = @HotelID";

           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@HotelID",HotelID)
           };

           return this.SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       
       }

       /// <summary>
       /// 根据酒店ID删除酒店信息
       /// </summary>
       /// <param name="HotelID"></param>
       /// <returns></returns>
       public bool DelHotelByHotelID(int HotelID)
       {
           String Sql = "delete from HotelInfo where HotelID = @HotelID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@HotelID",HotelID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }
       /// <summary>
       /// 根据酒店ID 网站名查询出该酒店ID在该网站上的总体评论信息
       /// </summary>
       /// <param name="HotelID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public DataTable GetHotelTotalComment(int HotelID,String WebSiteName)
       {
           String Sql = "select * from OtherHotelTotalAccessment,WebSiteInfo where OtherHotelTotalAccessment.WebSiteID"+
                        "=WebSiteInfo.WebSiteID and WebSiteInfo.WebSiteName = @WebSiteName and OtherHotelTotalAccessment.HotelID= @HotelID";

           SqlParameter[] Paras = new SqlParameter[]
          {
            new SqlParameter("@HotelID",HotelID),
            new SqlParameter("@WebSiteName",WebSiteName)
          };
           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 根据酒店ID，网站名，页码，页大小，查询出该酒店在该网站的评论并分页显示
       /// </summary>
       /// <param name="HotelID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageIndex"></param>
       /// <param name="PageSize"></param>
       /// <returns></returns>
       public DataTable GetHotelCommentSplit(int HotelID,String WebSiteName,int PageIndex,int PageSize)
       {
           SqlParameter[] Paras = new SqlParameter[]
          {
             new SqlParameter("@HotelID",HotelID),
             new SqlParameter("@WebSiteName",WebSiteName),
             new SqlParameter("@PageIndex",PageIndex),
             new SqlParameter("@PageSize",PageSize)
          };

           return SqlHelper.ExecuteQuery("HotelCommentSplitPage",Paras,CommandType.StoredProcedure);
       }

       /// <summary>
       /// 根据酒店ID和网站名查询在该网站上有多少条该酒店的评论
       /// </summary>
       /// <param name="HtlID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetCommentCount(int HtlID,String WebSiteName)
       {
           String Sql = "select Count(*) from OtherHotelDetailAccessment,PublisherInfo,WebSiteInfo " +
                  " where OtherHotelDetailAccessment.PublisherID = PublisherInfo.PublisherID and PublisherInfo.WebSiteID=WebSiteInfo.WebSiteID " +
                  " and WebSiteInfo.WebSiteName = @WebSiteName and OtherHotelDetailAccessment.HotelID=@HtlID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@HtlID",HtlID),
             new SqlParameter("@WebSiteName",WebSiteName)
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       
       }

       public DataTable IsHotelExist(float Slatitude, float Slongtitude)
       {
           String Sql = "Select * from HotelInfo where Slatitude=@Slatitude and SLongitude = @SLongitude";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@Slatitude",Slatitude),
              new SqlParameter("@SLongitude",Slongtitude)
            
           };

           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }
    }
}
