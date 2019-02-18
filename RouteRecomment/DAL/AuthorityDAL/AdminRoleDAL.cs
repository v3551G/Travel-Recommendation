using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model.Authority;
using System.Data;
using System.Data.SqlClient;

namespace DAL.AuthorityDAL
{
   public class AdminRoleDAL
    {
       SQLHelper SqlHelper = null;
       public AdminRoleDAL()
       {
           this.SqlHelper = new SQLHelper();
       }

       //给一个管理员增加一个角色
       public bool AddAdminRole(AdminRole _AdminRole)
       {
           string Sql = "insert into AdminRole(AdminID,RoleID) values (@AdminID,@RoleID)";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@AdminID",_AdminRole.AdminID),
              new SqlParameter("@RoleID",_AdminRole.RoleID)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
           {
               return true;
           }
           else
               return false;
       }
      
       //删除管理员的一个角色
       public bool DeleteAdminRole(AdminRole _AdminRole)
       {
           String Sql = "delete from AdminRole where AdminID = @AdminID and RoleID = @RoleID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@AdminID",_AdminRole.AdminID),
             new SqlParameter("@RoleID",_AdminRole.RoleID)
           };
           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }

       //根据管理员ID删除其角色
       public bool DeleteAdminRole(int AdminID)
       {
           String Sql = "delete from AdminRole where AdminID = @AdminID2";

           SqlParameter[] Paras = new SqlParameter[1];

           Paras[0] = new SqlParameter("@AdminID2", AdminID);
          

           try
           {
               if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                   return true;
           }
           catch (Exception ex)
           {
               Console.Write(ex.Message);
           }

               
           return false;
       }
       ///<summary>
       /// 根据角色ID删除管理员角色
       /// </summary>
       public bool DeleteAdminRoleByRoleID(int RoleID)
       {
           String Sql = "delete from AdminRole where RoleID = @RoleID";

           SqlParameter[] Paras = new SqlParameter[1];

           Paras[0] = new SqlParameter("@RoleID", RoleID);


           try
           {
               if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
                   return true;
           }
           catch (Exception ex)
           {
               Console.Write(ex.Message);
           }


           return false;
       
       
       }

       //根据管理员ID更新其角色
       public bool UpdateAdminRole(int AdminID,int RoleID)
       {
           String Sql = "Update AdminRole set RoleID = @RoleID where AdminID = @AdminID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RoleID",RoleID),
              new SqlParameter("@AdminID",AdminID)
           };

           return (SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0 ?true:false);
       }

        /// <summary>
        /// 根据角色ID来获得其角色个数
        /// </summary>
       public int GetCountByRoleID(int RoleID)
       {
           String Sql = "select Count(*) from AdminRole where RoleID = @RoleID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RoleID",RoleID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       }


        /// <summary>
        /// 根据管理员ID来获得其角色个数
        /// </summary>
       public int GetCountByAdminID(int AdminID)
       {
           String Sql = "select Count(*) from AdminRole where AdminID = @AdminID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@AdminID",AdminID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text);
       }
   
   }
}
