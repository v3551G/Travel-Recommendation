using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data;
using System.Data.SqlClient;

namespace DAL.StrategyDAL
{
   public class StrategyInfoDAL
    {
       SQLHelper _SqlHelper = null;
       public StrategyInfoDAL()
       {
           _SqlHelper = new SQLHelper();
       }

       //将其他网站的评论按时间的降序分页显示
       public DataTable OtherStraSplit(int PageSize,int PageIndex)
       {
           SqlParameter[] Paras = new SqlParameter[]
         {
           new SqlParameter("@PageSize",PageSize),
           new SqlParameter("@PageIndex",PageIndex)
         };

           return _SqlHelper.ExecuteQuery("OtherStraSplit",Paras,CommandType.StoredProcedure);
       }

       //根据发布者ID查询出器发布者信息
       public DataTable GetPIByPubID(int PubID)
       {
           String Sql = "select PublisherNickName,PublisherUrl from PublisherInfo "+
               "where PublisherInfo.PublisherID=@PubID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@PubID",PubID)
           };

           return this._SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       //得出所有的外站攻略
       public int GetStrategyCount()
       {
           String Sql = "select count(*) from OtherStrategy";

           return int.Parse(this._SqlHelper.ExecuteScalar(Sql,CommandType.Text).ToString());
        
       }

       //插入一条攻略景点信息
       public void InsertStraSce(int SceID,int StraID)
       {
           String Sql = "insert into StrategyScenery(StrategyID,SceneryID) values (@StraID,@SceID)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@SceID",SceID),
             new SqlParameter("@StraID",StraID)
           };

           this._SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text);
       }

       //得出所有的攻略信息
       public DataTable GetAllStra()
       {
           String Sql = "select * from OtherStrategy";
           return this._SqlHelper.ExecuteQuery(Sql,CommandType.Text);
       
       }
       //添加一条攻略景点
       public void AddStraSce(int StraID,int SceID)
       {
           String Sql = "insert into OtherStraScenery(StrategyID,SceneryID) values(@StraID,@SceID)";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@StraID",StraID),
             new SqlParameter("@SceID",SceID)
           };
            this._SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text);
       }
       //根据根据景点ID、网站名分页显示攻略
       public DataTable GetStraSplit(int SceneryID,String WebSiteName ,int PageSize,int PageIndex)
       {
           SqlParameter[] Paras = new SqlParameter[]
           { 
             new SqlParameter("@SceneryID",SceneryID),
             new SqlParameter("@WebSiteName",WebSiteName),
             new SqlParameter("@PageSize",PageSize),
             new SqlParameter("@PageIndex",PageIndex)
           };

           return this._SqlHelper.ExecuteQuery("StrSplit",Paras,CommandType.StoredProcedure);
       } 
       //根据网站名获取某景点该网站的所有攻略 针对马蜂窝 同程网 携程网
       public int GetStrCountByNameSceID(String WebSiteName,int SceneryID)
       {
           SqlParameter[] Paras = new SqlParameter[]
         {
             new SqlParameter("@SceneryID",SceneryID),
           new SqlParameter("@WebSiteName",WebSiteName)
         };

           return int.Parse(this._SqlHelper.ExecuteScalar("StrCountByNameSceID",Paras,CommandType.StoredProcedure).ToString());
       }

       //获得欣欣网的所有攻略
       public DataTable GetXinXinStraSplit(int PageSize,int PageIndex)
       {
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@PageSize",PageSize),
             new SqlParameter("@PageIndex",PageIndex)
           };

           return this._SqlHelper.ExecuteQuery("XinXinStraSplit", Paras, CommandType.StoredProcedure);
       }

       //获得欣欣网的攻略数目
       public int GetXinXinStraCount()
       {
           String Sql = "select count(*) from OtherStrategy where PublisherID is null";

           return int.Parse(this._SqlHelper.ExecuteScalar(Sql,CommandType.Text).ToString());
       }

       //获取ID在一定范围内攻略
       public DataTable GetOtherStra()
       {
           String Sql = "select StrategyID,StrategyContent from OtherStrategy where StrategyID < 1350";
           return this._SqlHelper.ExecuteQuery(Sql,CommandType.Text);
       }

       //更具ID号和内容更新指定的攻略
       public void UpdStra(int StraID,String StrContent)
       {
           String Sql = "update OtherStrategy set StrategyContent=@StrContent where StrategyID = @StraID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@StrContent",StrContent),
             new SqlParameter("@StraID",StraID)
           };

           this._SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text);
       }

    }
}
