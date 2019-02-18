using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using Model.Authority;
using System.Data;

namespace BLL.AuthorityBLL
{
   public class RoleBLL
    {
       RoleDAL _RoleDAL = null;

       public RoleBLL()
       {
           this._RoleDAL = new RoleDAL(); 
       }

       //添加一个角色
       public bool AddRole(Role _Role)
       {
           return this._RoleDAL.AddRole(_Role);
       }
    
       //根据角色ID删除一个角色
       public bool DeleteRole(int RoleID)
       {
           return this._RoleDAL.DeleteRole(RoleID);
       }


       /// <summary>
       /// 根据管理员的账号来获得该管理员的角色
       /// </summary>
       public int GetRoleIDByAccount(string Account)
       {
           return this._RoleDAL.GetRoleIDByAccount(Account);
       }
        /// <summary>
        /// 根据管理员的RoleID来获得该管理员的角色名
        /// </summary>
       public string GetRoleNameByAccount(int RoleID)
       {
           return this._RoleDAL.GetRoleNameByAccount(RoleID);
       }

        /// <summary>
        /// 获得所有角色信息
        /// </summary>
       public DataTable GetAllRoleInfo()
       {
           return this._RoleDAL.GetAllRoleInfo();
       }

        /// <summary>
        /// 根据管理员的ID来获得其角色ID
        /// </summary>
       public int GetRoleIDByAdminID(int AdminID)
       {
           return this._RoleDAL.GetRoleIDByAdminID(AdminID);
       }
        
         /// <summary>
        /// 根据管理员的ID来获得其角色名
        /// </summary>
       public string GetRoleNameByAdminID(int AdminID)
       {
           return this._RoleDAL.GetRoleNameByAdminID(AdminID);
       }

       /// <summary>
       /// 根据角色ID获取其角色名
       /// </summary>
       public string GetRoleNameByRoleID(int RoleID)
       {
           return this._RoleDAL.GetRoleNameByRoleID(RoleID);

       }

   }
}
