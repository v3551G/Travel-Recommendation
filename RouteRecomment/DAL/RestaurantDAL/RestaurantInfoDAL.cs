using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data.SqlClient;
using System.Data;
using Model.Restaurant;

namespace DAL.RestaurantDAL
{
   public class RestaurantInfoDAL
    {
       SQLHelper SqlHelper = null;
       public RestaurantInfoDAL()
       {
           SqlHelper = new SQLHelper();
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="_UserCmtObj"></param>
       /// <returns></returns>
       public bool InsertToResCmt(OurResComment _UserCmtObj)
       {
           String Sql = "insert into OurResComment(UserID,CommentContent,RestaurantID,Rate,State)" +
             "values(@UserID,@CommentContent,@RestaurantID,@Rate,@State)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             //new SqlParameter("@CommentID",CommentID),
               new SqlParameter("@UserID", _UserCmtObj.UserID),
               new SqlParameter("@CommentContent", _UserCmtObj.CommentContent),
             //  new SqlParameter("@CommentTime",_UserCmtObj.CommentTime),
               new SqlParameter("@RestaurantID", _UserCmtObj.ResID),
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
       /// <param name="Account"></param>
       /// <returns></returns>
       public  DataTable  GetUserIDByAccount(String Account)
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
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetUserCmtByResID(int ResID)
       {
           //String Sql = "select * from OurHotelComment where HotelID = @SceneryID" ;
           String Sql = "select * from OurResComment where RestaurantID = @ResID order by ID desc"; //按CommentID降序排列，使得最新发表的评论第一个显示
           SqlParameter[] Paras = new SqlParameter[]
           { 
               new SqlParameter("@ResID",ResID)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="CmtUserID"></param>
       /// <returns></returns>
       public DataTable GetCmtUserAccountByuserID(String CmtUserID)
       {
           String Sql = "select UserAccount from UserInfo where UserID = @UserID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@UserID",CmtUserID)
           };
           return this.SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

       /// <summary>
       /// 获得市餐馆的分页信息
       /// </summary>
       /// <param name="CityID"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageStart"></param>
       /// <returns></returns>
       public DataTable GetCityResSplit(int CityID,int PageSize,int PageStart)
       {
           SqlParameter[] Paras = new SqlParameter[]
          {
             new SqlParameter("@CityID",CityID),
             new SqlParameter("@PageSize",PageSize),
             new SqlParameter("@PageIndex",PageStart)
           
          };

           return this.SqlHelper.ExecuteQuery("CityResSplit",Paras,CommandType.StoredProcedure); 
       
       }

       /// <summary>
       /// 根据市ID获得市的菜馆个数
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public int GetCityResCount(int CityID)
       {
           String Sql = "select Count(*) from RestaurantInfo where CityID = @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID)
           };
           return (int)SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text);
       
       }
       /// <summary>
       /// 添加餐馆信息
       /// </summary>
       /// <param name="_Res"></param>
       /// <returns></returns>
       public bool AddResInfo(RestaurantInfo _Res)
       {
           String Sql = "insert into RestaurantInfo(Local,PhoneNum,Introduction,OpenTime,SLongitude,Slatitude,RestaurantName,CityID) "
               + "values(@Local,@PhoneNum,@Introduction,@OpenTime,@SLongitude,@Slatitude,@RestaurantName,@CityID)";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@Local",_Res.Local),
              new SqlParameter("@PhoneNum",_Res.PhoneNum),  
              new SqlParameter("@Introduction",_Res.Introduction),
              new SqlParameter("@OpenTime",_Res.OpenTime),
              new SqlParameter("@SLongitude",_Res.SLongitude),
              new SqlParameter("@Slatitude",_Res.Slatitude),  
              new SqlParameter("@RestaurantName",_Res.RestaurantName),
              new SqlParameter("@CityID",_Res.CityID)
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }

       /// <summary>
       /// 根据餐馆ID删除餐馆
       /// </summary>
       /// <param name="RestaurantID"></param>
       /// <returns></returns>
       public bool DelResInfo(int RestaurantID)
       {
           String Sql = "delete from RestaurantInfo where RestaurantID = @RestaurantID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@RestaurantID",RestaurantID)
           };

           if( this.SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       
       }
       /// <summary>
       /// 根据餐馆ID查询出餐馆信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetResInfo(int ResID)
       {
           String Sql = "select * from RestaurantInfo where RestaurantID = @ResID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@ResID",ResID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 更新餐馆信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="_Res"></param>
       /// <returns></returns>
       public bool UpdResInfo(int ResID, RestaurantInfo _Res)
       {
         String Sql ="update RestaurantInfo set Local=@Local,PhoneNum=@PhoneNum,Introduction=@Introduction,OpenTime=@OpenTime,SLongitude=@SLongitude,Slatitude=@Slatitude where RestaurantID = @ResID"  ;

         SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@Local",_Res.Local),
              new SqlParameter("@PhoneNum",_Res.PhoneNum),  
              new SqlParameter("@Introduction",_Res.Introduction),
              new SqlParameter("@OpenTime",_Res.OpenTime),
              new SqlParameter("@SLongitude",_Res.SLongitude),
              new SqlParameter("@Slatitude",_Res.Slatitude),
              new SqlParameter("@ResID",ResID)
           };
         if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
             return true;
         return false;
       }
       /// <summary>
       /// 向餐馆中添加一个菜
       /// </summary>
       /// <param name="_ResFoodInfo"></param>
       /// <returns></returns>
       public bool AddResFood(RestaurantFoodInfo _ResFoodInfo)
       {
           String Sql = "insert into FoodInfo(FoodName,FoodPrice,RestaurantID) values(@FoodName,@FoodPrice,@RestaurantID)";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@FoodName",_ResFoodInfo.FoodName),
              new SqlParameter("@FoodPrice",_ResFoodInfo.FoodPrice),
              new SqlParameter("RestaurantID",_ResFoodInfo.RestaurantID)
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }

       /// <summary>
       /// 根据餐馆ID获取餐馆所有菜
       /// </summary>
       /// <param name="RestaurantID"></param>
       /// <returns></returns>
       public DataTable GetResFood(int RestaurantID)
       {
           String Sql = "select * from FoodInfo where RestaurantID=@RestaurantID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RestaurantID",RestaurantID)
           };
           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 根据餐馆ID删除餐馆菜
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public bool DelFoodByResID(int ResID)
       {
           String Sql = "delete from FoodInfo where RestaurantID=@ResID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@ResID",ResID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }
       /// <summary>
       /// 根据美食ID删除美食
       /// </summary>
       /// <param name="FoodID"></param>
       /// <returns></returns>
       public bool DelFoodByFoodID(int FoodID)
       {
           String Sql = "delete from FoodInfo where FoodID = @FoodID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@FoodID",FoodID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }

       /// <summary>
       /// 根据市ID查询出该市的餐馆
       /// </summary>
       /// <param name="CityID"></param>
       /// <returns></returns>
       public DataTable GetCityRes(int CityID)
       {
           String Sql = "select * from RestaurantInfo where CityID = @CityID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@CityID",CityID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
       /// <summary>
       /// 查询出餐馆所在市
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public int GetResCityByResID(int ResID)
       {
           String Sql = "select CityID from RestaurantInfo where RestaurantID = @ResID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ResID",ResID)
           };

         return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       
       }
       /// <summary>
       /// 根据餐馆ID查询出他在携程网上的总体评分
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetXieChenTotalComment(int RestaurantID)
       {
           String Sql = "select * from XieChenRestTotalAssessment where RestaurantID=@RestaurantID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RestaurantID",RestaurantID)
           };
           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
       /// <summary>
       /// 根据餐馆ID获取他在大众点评上的总体信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetDaZhongTotalComment(int RestaurantID)
       {
           String Sql = "select * from DaZhongRestTotalAssessment where RestaurantID=@RestaurantID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RestaurantID",RestaurantID)
           };
           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
       /// <summary>
       /// 根据餐馆ID查询出他在爱帮网站上的总体评分
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetAiBangTotalComment(int RestaurantID)
       {
           String Sql = "select * from AiBangRestTotalAssessment where RestaurantID=@RestaurantID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@RestaurantID",RestaurantID)
           };
           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
       
       /// <summary>
       /// 根据餐馆ID，网站名，分页大小，页号查询出该餐馆在该网站上的评论
       /// </summary>
       /// <param name="RestaurantID"></param>
       /// <param name="WebSiteName"></param>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable ResCommentSplitPage(int RestaurantID,String WebSiteName,int PageSize,int PageIndex)
       {
           SqlParameter[] Paras = new SqlParameter[]
          {
             new SqlParameter("@RestaurantID",RestaurantID),
             new SqlParameter("@WebSiteName",WebSiteName),
             new SqlParameter("@PageSize",PageSize),
             new SqlParameter("@PageIndex",PageIndex)
          };

           return SqlHelper.ExecuteQuery("ResCommentSplitPage",Paras,CommandType.StoredProcedure);
       }

       /// <summary>
       /// 查询一个餐馆的所有菜以及菜的图片信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetFoodAndPic(int ResID)
       {
           String Sql = "select * from FoodInfo,FoodPic,PicInfo where FoodInfo.FoodID = FoodPic.FoodID and FoodPic.PicID=PicInfo.PicID and FoodInfo.RestaurantID = @RestaurantID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RestaurantID",ResID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 根据餐馆ID，网站名，查询出该餐馆在该网站上的评论个数
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="WebSiteName"></param>
       /// <returns></returns>
       public int GetCommentCount(int ResID,String WebSiteName)
       {
           String Sql = "select Count(*) from OtherRestAssessment,PublisherInfo,WebSiteInfo where OtherRestAssessment.PublisherID" +
"= PublisherInfo.PublisherID and PublisherInfo.WebSiteID = WebSiteInfo.WebSiteID and  OtherRestAssessment.RestaurantID=@RestaurantID and WebSiteInfo.WebSiteName=@WebSiteName";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RestaurantID",ResID),
              new SqlParameter("@WebSiteName",WebSiteName)
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       
       }

       /// <summary>
       /// 根据餐馆ID查询出带有图片的菜信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetFoodWithPic(int ResID)
       {
           String Sql = "select * from FoodInfo,FoodPic ,PicInfo "+
                        "where FoodPic.PicID = PicInfo.PicID and FoodInfo.FoodID = FoodPic.FoodID"+
                        " and FoodInfo.RestaurantID = @ResID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ResID",ResID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       /// <summary>
       /// 根据餐馆ID查询出没有图片的菜信息
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
       public DataTable GetFoodNoPic(int ResID)
       {
           String Sql = "select * from FoodInfo where FoodInfo.FoodID not in(Select FoodID from FoodPic) and FoodInfo.RestaurantID = @ResID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ResID",ResID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       public DataTable  IsResExist(float Slatitude, float Slongtitude)
       {
           String Sql = "Select * from RestaurantInfo where Slatitude=@Slatitude and SLongitude = @SLongitude";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@Slatitude",Slatitude),
              new SqlParameter("@SLongitude",Slongtitude)
            
           };

           return SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);
       }

    }
}
