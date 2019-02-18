using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Model.Authority;
using System.Data;

namespace DAL.AuthorityDAL
{
   public class RoleResourceDAL
    {
       SQLHelper SqlHelper = null;

       public RoleResourceDAL()
       {
           this.SqlHelper = new SQLHelper();
       }

       //增加一个角色的资源
       public bool AddRoleResource(RoleResource _RoleResource)
       {
           string Sql = "insert into RoleResource(ResourceID,RoleID) values (@ResourceID,@RoleID)";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@ResourceID",_RoleResource.ResourceID),
              new SqlParameter("@RoleID",_RoleResource.RoleID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
           {
               return true;
           }
           else
               return false;
       }

       //删除一个角色资源
       public bool DeleteRoleResource(RoleResource _RoleResource)
       {
           String Sql = "delete from RoleResource where ResourceID = @ResourceID and RoleID = @RoleID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@ResourceID",_RoleResource.ResourceID),
              new SqlParameter("@RoleID",_RoleResource.RoleID)
           };
           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }
       //删除一个角色的所有资源
       public bool DeleteRoleAllResource(int RoleID)
       {
           String Sql = "delete from RoleResource where RoleID = @RoleID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RoleID",RoleID)
           };
           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;

       }

       //根据资源ID删除所有角色资源
       public bool DeleteRoleResource(int ResourceID)
       {
           String Sql = "delete from RoleResource where ResourceID = @ResourceID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@ResourceID",ResourceID)
           };
           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;

       }

       ///<summary>
       ///根据资源ID判断角色资源表中有没有该资源
       ///</summary>
       public int GetRoleResourceCount(int ResourceID)
       { 
          String Sql = "select Count(*) from RoleResource";

          return (int)SqlHelper.ExecuteScalar(Sql,CommandType.Text);
       }

       ///<summary>
       ///根据角色ID判断角色资源表中有没有该角色
       ///</summary>
       public int GetRoleResourceCountByRoleID(int RoleID)
       {
           String Sql = "select Count(*) from RoleResource";

           return (int)SqlHelper.ExecuteScalar(Sql, CommandType.Text);
       }

 
       ///<summary>
       ///根据角色名判断它对应的资源名
       ///</summary>
       public String GetResNameByRoleID(int RoleID)
       { 
          //先看有没有对应的资源，没有，返回“”
           int Num = this.GetRoleResourceCountByRoleID(RoleID);
           
           if (Num < 1)
               return "";

           String Sql = "select ResourceName from RoleResource,Resource where"+
                " RoleResource.ResourceID = Resource.ResourceID and  RoleResource.RoleID = @RoleID";

           SqlParameter[] Paras = new SqlParameter[]
           {
           
              new SqlParameter("@RoleID",RoleID)
           };

           return (String)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);

       
       }


        ///<summary>
        ///根据角色名更改它对应的资源
        ///</summary>
       public bool UpdateRoleRes(int RoleID, int RescourceID)
       {
           String Sql = "update RoleResource set ResourceID = @RescourceID where RoleID = @RoleID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RescourceID",RescourceID),
              new SqlParameter("@RoleID",RoleID)
           };

           if( SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
               return true;
           return false;
       }
   }
}
