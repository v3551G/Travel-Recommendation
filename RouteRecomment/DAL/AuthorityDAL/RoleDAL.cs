using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model.Authority;
using System.Data;
using System.Data.SqlClient;
using Model;

namespace DAL.AuthorityDAL
{
   public class RoleDAL
    {
       SQLHelper SqlHelper = null;
       public RoleDAL()
       {
           this.SqlHelper = new SQLHelper();
       }

       //添加一个角色
       public bool AddRole(Role _Role)
       {
           string Sql = "insert into Role(RoleName) values (@RoleName)";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RoleName",_Role.RoleName)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
           {
               return true;
           }
           else
               return false;
       }
    
       //根据角色ID删除一个角色
       public bool DeleteRole(int RoleID)
       {
           String Sql = "delete from Role where RoleID = @RoleID";
           SqlParameter[] Paras = new SqlParameter[]
           {
             new SqlParameter("@RoleID",RoleID)
           };
           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }
    
        /// <summary>
        /// 根据管理员的账号来获得该管理员的角色
        /// </summary>
       public int GetRoleIDByAccount(string Account)
       {
           String Sql = "select AdminRole.RoleID from AdminInfo,AdminRole where AdminInfo.AdminID = AdminRole.AdminID " +
                        " and AdminInfo.AdminAccount = '@Account'";

           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter("@Account",Account)
           };

           return (int)(((DataTable)SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text)).Rows[0][0]);
       }

        /// <summary>
        /// 根据管理员的RoleID来获得该管理员的角色名
        /// </summary>
       public string GetRoleNameByAccount(int RoleID)
       {
           String Sql = "select RoleName from Role where Role.RoleID =@RoleID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RoleID",RoleID)
           };
           return (String)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       
       }
        /// <summary>
        /// 获得所有角色信息
        /// </summary>
       public DataTable GetAllRoleInfo()
       {
           String Sql = "select * from Role";

           return (DataTable)SqlHelper.ExecuteQuery(Sql,CommandType.Text);
       }

        /// <summary>
        /// 根据管理员的ID来获得其角色ID
        /// </summary>
       public int GetRoleIDByAdminID(int AdminID)
       {
           String Sql = "select RoleID from AdminRole where AdminID = @AdminID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@AdminID",AdminID)
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       }

        /// <summary>
        /// 根据管理员的ID来获得其角色名
        /// </summary>
       public string GetRoleNameByAdminID(int AdminID)
       {
           String Sql = "select RoleName from AdminRole,Role where AdminRole.RoleID = Role.RoleID and AdminRole.AdminID=@AdminID";
           SqlParameter [] Paras = new SqlParameter[]
           {
               new SqlParameter("@AdminID", AdminID)
           };

           return (string)SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text);
       }

        /// <summary>
        /// 根据角色ID获取其角色名
        /// </summary>
        public string GetRoleNameByRoleID(int RoleID)
       {
           String Sql = "select RoleName from Role where RoleID = @RoleID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@RoleID",RoleID)
           
           };

           return (String)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       
       }
   
   }
}
