using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using Model.Authority;

namespace BLL.AuthorityBLL
{
   public class RoleResourceBLL
    {
       RoleResourceDAL _RoleResourceDAL = null;
       public RoleResourceBLL()
       {
           this._RoleResourceDAL = new RoleResourceDAL();
       }

       //增加一个角色的资源
       public bool AddRoleResource(RoleResource _RoleResource)
       {
           return _RoleResourceDAL.AddRoleResource(_RoleResource);
       }
      
       //删除一个角色资源
       public bool DeleteRoleResource(RoleResource _RoleResource)
       {
           return _RoleResourceDAL.DeleteRoleResource(_RoleResource);
       }

       //删除一个角色的所有资源
       public bool DeleteRoleAllResource(int RoleID)
       {
           return _RoleResourceDAL.DeleteRoleAllResource(RoleID);
       }
      
       ///<summary>
       ///根据资源ID判断角色资源表中有没有该资源
       ///</summary>
       public int GetRoleResourceCount(int ResourceID)
       {
           return _RoleResourceDAL.GetRoleResourceCount(ResourceID);
       }

       //根据资源ID删除所有角色资源
       public bool DeleteRoleResource(int ResourceID)
       {
           return _RoleResourceDAL.DeleteRoleResource(ResourceID);

       }

        ///<summary>
       ///根据角色ID判断角色资源表中有没有该角色
       ///</summary>
       public int GetRoleResourceCountByRoleID(int RoleID)
       {
           return _RoleResourceDAL.GetRoleResourceCountByRoleID(RoleID);
       }

       ///<summary>
       ///根据角色名判断它对应的资源名
       ///</summary>
       public String GetResNameByRoleID(int RoleID)
       {
           return _RoleResourceDAL.GetResNameByRoleID(RoleID);
       }
        ///<summary>
        ///根据角色名更改它对应的资源
        ///</summary>
       public bool UpdateRoleRes(int RoleID, int RescourceID)
       {
           return _RoleResourceDAL.UpdateRoleRes(RoleID,RescourceID);
       }
    }
}
