using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data.SqlClient;
using System.Data;
using Model.Scenery;

namespace DAL.Scenery
{
   public class STypeDAL
    {
       private SQLHelper SqlHelper = null;

       public STypeDAL()
       {
           this.SqlHelper = new SQLHelper();
       }
       ///<summary>
       ///添加一个类型
       /// </summary>
       public bool AddSType(SType _SType)
       {
           String Sql = "insert into SType(TypeName) values(@TypeName)";

           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@TypeName",_SType.TypeName)
           };
           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }
       ///<summary>
       ///景点的ID找出该景点的类型
       /// </summary>
       public DataTable GetSceTypeByID(int SceneryID)
       {
           String Sql = "select SType.TypeID,SType.TypeName from SType,SceneryType where SceneryType.TypeID = SType.TypeID and SceneryType.SceneryID= @SceneryID ";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@SceneryID",SceneryID)
           };

           return SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       
       }

        ///<summary>
        ///查询出所有的类型
        /// </summary>
       public DataTable GetAllSType()
       {
           String Sql = "select * from SType ";
           return SqlHelper.ExecuteQuery(Sql,CommandType.Text);
       }

        ///<summary>
        ///添加一个景点的类型
        /// </summary>
       public bool AddSceneryType(int TypeID,int SceneryID)
       {
           String Sql = "insert into SceneryType(TypeID,SceneryID) values(@TypeID,@SceneryID)";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@TypeID",TypeID),
              new SqlParameter("@SceneryID",SceneryID)
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }
       ///<summary>
       ///根据类型ID删除一个景点的类型
       /// </summary>
       public bool DelSceneryType(int TypeID)
       {
           string Sql = "delete from SceneryType where TypeID = @TypeID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("TypeID",@TypeID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }
       ///<summary>
       ///根据类型ID删除一个类型
       /// </summary>
       public bool DelSTypebyTID(int TypeID)
       {
           String Sql = "delete from SType where TypeID = @TypeID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@TypeID",TypeID)
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }

        ///<summary>
        ///根据景点ID删除一个景点类型
        /// </summary>
       public bool DelSType(int SceneryID)
       {
           String Sql = "delete from SceneryType where SceneryID = @SceneryID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("SceneryID",@SceneryID)
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }
        ///<summary>
        ///根据景点ID找出该景点的所有类型
        /// </summary>
       public int GetSceTypeCount(int SceneryID)
       {
           String Sql = "select Count(*) from SceneryType where SceneryID = @SceneryID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@SceneryID",SceneryID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text);

       }
        ///<summary>
        ///根据类型ID查看景点类型个数
        /// </summary>
       public int GetSceTypeCountByTID(int TypeID)
       {
           String Sql = "select count(*) from SceneryType where TypeID = @TypeID";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@TypeID",TypeID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       }

   }
}
