using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model.Authority;
using System.Data.SqlClient;
using System.Data;

namespace DAL.AuthorityDAL
{
   public class ResourceDAL
    {
       SQLHelper SqlHelper = null;

       public ResourceDAL()
       {
           this.SqlHelper = new SQLHelper();
       }
       //添加一个资源
       public bool AddResource(Resource _Resource)
       {
           string Sql = "insert into Resource(ResourceName) values (@ResourceName)";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@ResourceName",_Resource.ResourceName)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
           {
               return true;
           }
           else
               return false;
       }

       //根据资源ID删除一种资源
       public bool DeleteResource(int ResourceID)
       {
           String Sql = "delete from Resource where ResourceID = @ResourceID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ResourceID",ResourceID)
           };
           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }

       //查询出所有资源信息
       public DataTable GetAllResource()
       {
           String Sql = "select * from Resource";

           return (DataTable)SqlHelper.ExecuteQuery(Sql,CommandType.Text);
       
       }

       //根据资源名获取其ID
       public int GetIDByResName(string ResName )
       {
           String Sql = "select ResourceID from Resource where ResourceName = @ResName";

           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@ResName",ResName)
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       }

    }
}
