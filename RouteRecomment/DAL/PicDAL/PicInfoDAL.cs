using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data;
using System.Data.SqlClient;
using Model.Picture;

namespace DAL.PicDAL
{
   public class PicInfoDAL
    {
       private SQLHelper SqlHelper = null;

       public PicInfoDAL()
       {
           this.SqlHelper = new SQLHelper();
       }

       ///<summary>
       ///根据市ID查询出该市的图片
       ///</summary>
       public DataTable GetPicByCityID(int CityID)
       {
           String Sql = "select * from CityPic,PicInfo where CityPic.PicID = PicInfo.PicID and CityPic.CityID = @CityID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@CityID",CityID)
           };

           return (DataTable)SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       
       }

       ///<summary>
       ///添加一张图片
       ///</summary>
       public bool AddPic(PicInfo _PicInfo)
       {
           String Sql = "insert into PicInfo(PicName,PicPath,Introduction,UploadTime) values(@PicName,@PicPath,@Introduction,@UploadTime)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@PicName",_PicInfo.PictureName),
             new SqlParameter("@PicPath",_PicInfo.PicPath),
             new SqlParameter("@Introduction",_PicInfo.Introduction),
             new SqlParameter("@UploadTime",_PicInfo.UpLoadTime)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       
       }

        ///<summary>
        ///根据市ID添加该市的一张图片
        ///</summary>
       public bool AddCityPic(int CityID,int PicID)
       {
           String Sql = "insert into CityPic(CityID,PicID) values(@CityID,@PicID)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@CityID",CityID),
             new SqlParameter("@PicID",PicID)
           };

           if(SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }
        ///<summary>
        ///根据图片名和添加时间来查询出图片ID
        ///</summary>
       public int GetPicID(String PicName,DateTime UpLoadTime)
       {
           String Sql = "select PicID from PicInfo where PicName = @PicName and UpLoadTime = @UpLoadTime";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@PicName",PicName),
              new SqlParameter("@UpLoadTime",UpLoadTime)
             
           };
           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       
       }

        ///<summary>
        ///根据图片ID删除该图片
        ///</summary>
       public bool DelPicByID(int PicID)
       {
           String Sql = "delete from PicInfo where PicID = @PicID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@PicID",PicID)
           
           };
           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       
       }

        ///<summary>
        ///根据图片ID删除该市图片
        ///</summary>
       public bool DelCityPicByID(int PicID)
       {
           String Sql = "delete from CityPic where PicID = @PicID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@PicID", PicID)
           };
           if( this.SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true ;
           return false;
       }

        ///<summary>
        ///根据景点ID查询出关于该景点的图片
        ///</summary>
       public DataTable GetPicBySceID(int SceneryID)
       {
           String Sql = "select * from SceneryPic,PicInfo where SceneryPic.PicID = PicInfo.PicID and SceneryPic.SceneryID = @SceneryID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@SceneryID",SceneryID)
           };

           return (DataTable)SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       
       }
       /// <summary>
       /// 根据酒店ID查询出该酒店的图片
       /// </summary>
       /// <param name="HtlID"></param>
       /// <returns></returns>
       public DataTable GetPicByHtlID(int HtlID)
       {
           String Sql = "select * from HotelPic,PicInfo where HotelPic.PicID = PicInfo.PicID and HotelPic.HotelID = @HtlID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@HtlID",HtlID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

        ///<summary>
        ///根据景点ID添加该景点的一张图片
        ///</summary>
        public bool AddSceneryPic(int SceneryID, int PicID)
        {
            String Sql = "insert into SceneryPic(SceneryID,PicID) values(@SceneryID,@PicID)";

            SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@SceneryID",SceneryID),
             new SqlParameter("@PicID",PicID)
           };

            if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;
        }

        ///<summary>
        ///根据图片ID删除景点图片
        ///</summary>
        public bool DelScePicByID(int PicID)
        {
            String Sql = "delete from SceneryPic where PicID = @PicID";
            SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@PicID", PicID)
           };
            if (this.SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;
        }
       /// <summary>
       /// 根据图片ID删除酒店图片
       /// </summary>
       /// <param name="PicID"></param>
       /// <returns></returns>
        public bool DelHtlPicByID(int PicID)
        {
            String Sql = "delete from HotelPic where PicID = @PicID";
            SqlParameter[] Paras = new SqlParameter[]
            {
              new  SqlParameter("@PicID",PicID)
            };
            if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;
        }
       /// <summary>
       /// 根据酒店ID，景点ID添加一张图片
       /// </summary>
       /// <param name="HtlID"></param>
       /// <param name="PicID"></param>
       /// <returns></returns>
        public bool AddHotelPic(int HtlID,int PicID)
        {
            String Sql = "insert into HotelPic(HotelID,PicID) values(@HotelID,@PicID)";
            SqlParameter[] Paras = new SqlParameter[]
            {
               new SqlParameter("@HotelID",HtlID),
               new SqlParameter("@PicID",PicID)
            };

            if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
                return true;
            return false;
        }
        
       /// <summary>
       /// 更具餐馆ID查询出其图片
       /// </summary>
       /// <param name="ResID"></param>
       /// <returns></returns>
        public DataTable GetResPicByID(int ResID)
        {
            String Sql = "select * from RestaurantPic,PicInfo where PicInfo.PicID=RestaurantPic.PicID" +
                " and  RestaurantPic.RestaurantID=@ResID ";

            SqlParameter[] Paras = new SqlParameter[]
            {
               new SqlParameter("@ResID",ResID)
            };

            return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
        
        }
       /// <summary>
       /// 添加一张餐馆图片
       /// </summary>
       /// <param name="ResID"></param>
       /// <param name="PicID"></param>
       /// <returns></returns>
        public bool AddResPic(int ResID,int PicID)
        {
            String Sql = "insert into RestaurantPic(RestaurantID,PicID) values(@RestaurantID,@PicID) ";
            SqlParameter[] Paras = new SqlParameter[]
            {
               new SqlParameter("@RestaurantID",ResID),
               new SqlParameter("@PicID",PicID)
            };
            if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;
        
        }
       /// <summary>
       /// 根据图片ID删除餐馆图片
       /// </summary>
       /// <param name="PicID"></param>
       /// <returns></returns>
        public bool DelResPicByPicID(int PicID)
        {
            String Sql = "delete from RestaurantPic where PicID = @PicID";
            SqlParameter[] Paras = new SqlParameter[]
            {
              new SqlParameter("@PicID",PicID)
            };

            if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;
        }
       /// <summary>
       /// 根据美食ID查询美食图片
       /// </summary>
       /// <param name="FoodID"></param>
       /// <returns></returns>
        public DataTable GetFoodPicByFID(int FoodID)
        {
            String Sql = "select * from PicInfo,FoodPic where FoodPic.PicID = PicInfo.PicID and FoodPic.FoodID = @FoodID";

            SqlParameter[] Paras = new SqlParameter[]
            {
              new SqlParameter("@FoodID",FoodID)
            };
            return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
        }
       /// <summary>
       /// 添加一张美食图片
       /// </summary>
       /// <param name="FoodID"></param>
       /// <param name="PicID"></param>
       /// <returns></returns>
        public bool AddFoodPic(int FoodID, int PicID)
        {
            String Sql = "insert into FoodPic(FoodID,PicID) values(@FoodID,@PicID)";
            SqlParameter[] Paras = new SqlParameter[]
            {
               new SqlParameter("@FoodID",FoodID),
               new SqlParameter("@PicID",PicID)
            };

            if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
                return true;
            return false;
        
        }
       /// <summary>
       /// 根据图片ID删除美食图片
       /// </summary>
       /// <param name="PicID"></param>
       /// <returns></returns>
        public bool DelFoodPicByPicID(int PicID)
        {
            String Sql = "delete from FoodPic where PicID = @PicID";

            SqlParameter[] Paras = new SqlParameter[]
            {
               new SqlParameter("@PicID",PicID)
            };

            if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;

        }

        /// <summary>
        /// 根据娱乐场所ID查询其图片信息
        /// </summary>
        /// <param name="EnterID"></param>
        /// <returns></returns>
        public DataTable GetEnterPicByEnterID(int EnterID)
        {
            String Sql = "select * from PicInfo,EntertainmentPic where PicInfo.PicID =EntertainmentPic.PicID " +
                "and EntertainmentPic.EntertainmentID = @EntertainmentID";
            SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@EntertainmentID",EnterID)
           };

            return SqlHelper.ExecuteQuery(Sql, Paras, CommandType.Text);

        }
       /// <summary>
       /// 添加一张娱乐场所图片
       /// </summary>
       /// <param name="EnterID"></param>
       /// <param name="PicID"></param>
       /// <returns></returns>
        public bool AddEnterPic(int EnterID,int PicID)
        {
            String Sql = "insert into EntertainmentPic(EntertainmentID,PicID) values(@EntertainmentID,@PicID)";

            SqlParameter[] Paras = new SqlParameter[]
            {
              new SqlParameter("@EntertainmentID",EnterID),
              new SqlParameter("@PicID",PicID)
            };

            if (this.SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;

        }
       /// <summary>
       /// 根据图片ID删除娱乐场所图片
       /// </summary>
       /// <param name="PicID"></param>
       /// <returns></returns>
        public bool DelEntetPicByID(int PicID)
        {
            String Sql = "delete from EntertainmentPic where PicID = @PicID";

            SqlParameter[] Paras = new SqlParameter[]
            {
              new SqlParameter("@PicID",PicID)
            };
            if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;
             
         
        }

       /// <summary>
       /// 获取商场图片
       /// </summary>
       /// <param name="MallID"></param>
       /// <returns></returns>
        public DataTable GetMallPic(int MallID)
        {
            String Sql = "select * from PicInfo,MallPic where PicInfo.PicID=MallPic.PicID and MallPic.MallID=@MallID";

            SqlParameter[] Paras = new SqlParameter[]
            {
               new SqlParameter("@MallID",MallID)
            };

            return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
        
        }
        /// <summary>
        /// 添加一张商场图片
        /// </summary>
        /// <param name="MallID"></param>
        /// <param name="PicID"></param>
        /// <returns></returns>
        public bool AddMallPic(int MallID ,int PicID)
        {
            String Sql = "insert into MallPic(MallID,PicID) values(@MallID,@PicID)";

            SqlParameter[] Paras = new SqlParameter[]
            {
               new SqlParameter("@MallID",MallID),
               new SqlParameter("@PicID",PicID)
            };

            if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;
        }
       /// <summary>
       /// 根据图片ID删除商场图片
       /// </summary>
       /// <param name="PicID"></param>
       /// <returns></returns>
        public bool DelMallPic(int PicID)
        {
            String Sql = "delete from MallPic where PicID = @PicID";
            SqlParameter[] Paras = new SqlParameter[]
            {
              new SqlParameter("@PicID",PicID)
            };

            if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                return true;
            return false;
          
        }

       ///<summary>
       ///根据StrategyID找对应图片(加)
       ///</summary>
       public DataTable GetOtherSceneryByStrategyID(int StrategyID)
       {
           String Sql = "select * from OtherStrategy,OtherStraScenery where   OtherStraScenery.SceneryID = OtherStrategy.StrategyID and OtherStrategy.StrategyID = @StrategyID";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@StrategyID",StrategyID)
               
           };

           return (DataTable)SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }


    }
}
