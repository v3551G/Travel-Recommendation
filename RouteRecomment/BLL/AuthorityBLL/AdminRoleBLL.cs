using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using Model.Authority;

namespace BLL.AuthorityBLL
{
   public class AdminRoleBLL
    {

       AdminRoleDAL _AdminRoleDAL = null;
       public AdminRoleBLL()
       {
           this._AdminRoleDAL = new AdminRoleDAL();
       }

       //给一个管理员增加一个角色
       public bool AddAdminRole(AdminRole _AdminRole)
       {
          return  _AdminRoleDAL.AddAdminRole(_AdminRole);
       }
       
       //删除管理员的一个角色
       public bool DeleteAdminRole(AdminRole _AdminRole)
       {
          return  _AdminRoleDAL.DeleteAdminRole(_AdminRole);
       }
      
       //根据管理员ID删除其角色
       public bool DeleteAdminRole(int AdminID)
       {
           return _AdminRoleDAL.DeleteAdminRole(AdminID);
       }
       
       //根据管理员ID更新其角色
       public bool UpdateAdminRole(int AdminID, int RoleID)
       {
           return _AdminRoleDAL.UpdateAdminRole(AdminID,RoleID);
       }

       ///<summary>
       /// 根据角色ID删除管理员角色
       /// </summary>
       public bool DeleteAdminRoleByRoleID(int RoleID)
       {
           return _AdminRoleDAL.DeleteAdminRoleByRoleID(RoleID);
       }

               /// <summary>
        /// 根据角色ID来获得其角色个数
        /// </summary>
       public int GetCountByRoleID(int RoleID)
       {
           return _AdminRoleDAL.GetCountByRoleID(RoleID);
       }


        /// <summary>
        /// 根据管理员ID来获得其角色个数
        /// </summary>
       public int GetCountByAdminID(int AdminID)
       {
           return _AdminRoleDAL.GetCountByAdminID(AdminID);
       }
       
    }
}
