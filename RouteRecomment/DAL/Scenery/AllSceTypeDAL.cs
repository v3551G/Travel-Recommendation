using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data.SqlClient;
using System.Data;

namespace DAL.Scenery
{
   public class AllSceTypeDAL
    {

       private SQLHelper _SqlHelper;

       public AllSceTypeDAL()
       {
           _SqlHelper = new SQLHelper();
       }



       #region //主要类型的添加、查询

       public int AddMType(String MTName)
       {
           String Sql = "insert into MainType(MTName) values(@MTName)";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@MTName",MTName)
           };

           return this._SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text);
       }

       public DataTable GetMTypeByName(String MTName)
       {
           String Sql = "select * from MainType where MTName = @MTName";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@MTName",MTName)
           };

           return this._SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
       #endregion


       #region //子类型的查询操作
       public int AddSubType(String STypeName)
       {
           String Sql = "insert into SubType(STypeName) values(@STypeName)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@STypeName",STypeName)
           };

           return this._SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text);
       }

       public DataTable GetSubTypeByName(String SubTypeName)
       {
           String Sql = "select * from SubType where STypeName = @SubTypeName";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@SubTypeName",SubTypeName)
           };

           return this._SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
       #endregion

        #region//主要类型子类型的查询操作
       public int AddMTSType(int MTypeID,int SubTypeID)
       {
           String Sql = "insert into MTSubType(STypeID,MTID) values(@STypeID,@MTID)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@MTID",MTypeID),
             new SqlParameter("@STypeID",SubTypeID)
           };

           return this._SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text);
       }
        #endregion

       #region//对景点类型的查询操作
       public int AddSceSubType(int ScenetyID,int STypeID)
       {
           String Sql = "insert into SceSubType(SceneryID,STypeID) values(@ScenetyID,@STypeID)";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ScenetyID",ScenetyID),
             new SqlParameter("@STypeID",STypeID)
           };
           return this._SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text);
       }

       public DataTable GetSceSubType(int SceneryID)
       {
           String Sql = "select * from SceSubType where SceneryID = @SceneryID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@SceneryID",SceneryID)
           };
           return this._SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }
        #endregion

    }
}
