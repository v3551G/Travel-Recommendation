using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using DAL.AuthorityDAL;
using System.Data;

namespace BLL.AuthorityBLL
{
   public class AdminInfoBLL
    {
       AdminInfoDAL _AdminInfoDAL = null;

       public AdminInfoBLL()
       {
           this._AdminInfoDAL = new AdminInfoDAL();
       }

       //添加一个管理员信息
       public bool AddAdminInfo(AdminInfo _AdminInfo)
       {
           return _AdminInfoDAL.AddAdminInfo(_AdminInfo);
       }
       
      //删除一个管理员信息
       public bool DeleteAdminInfo(int AdminID)
       {
           return _AdminInfoDAL.DeleteAdminInfo(AdminID);
       }
       
       //根据管理员的信息(账号和密码)来检测该管理员存在与否  
       public int CheckLoginInfo(String AdminAccount, String PassWord)
       {
           return _AdminInfoDAL.CheckLoginInfo(AdminAccount,PassWord);
       }

       /// <summary>
       /// 根据管理员的角色类型、资源名来判断该管理员是否有相应的权限
       /// </summary>
       public bool CheckFunction(int RoleID, String ResourceName)
       {
           return _AdminInfoDAL.CheckFunction(RoleID, ResourceName);
       }

        /// <summary>
        /// 根据管理员的账号、密码判断该管理员是否是系统管理员
        /// </summary>
       public bool IsSys(string Account, string Password)
       {
           return _AdminInfoDAL.IsSys(Account,Password);
       }

         /// <summary>
        /// 查询出所有管理员的信息
        /// </summary>
       public DataTable GetAllAdminInfo()
       {
           
           return _AdminInfoDAL.GetAllAdminInfo();
       }

        /// <summary>
        /// 查询出管理员的ID
        /// </summary>
       public int GetAdminID(String AdminAccount)
       {
           return _AdminInfoDAL.GetAdminID(AdminAccount);
       }
              /// <summary>
       /// 查询出管理员是否存在
       /// </summary>
       public int AdminExist(String AdminAccount)
       {
           return _AdminInfoDAL.AdminExist(AdminAccount);
       }

        /// <summary>
        /// 根据管理员ID查出该管理员的详细信息
        /// </summary>
       public DataTable GetAdminInfoByID(int AdminID)
       {
           return _AdminInfoDAL.GetAdminInfoByID(AdminID);
       }
       /// <summary>
       /// 根据管理员的ID来更新其信息
       /// </summary>
       public bool UpdateAdminInfo(int AdminID, AdminInfo _AdminInfo)
       {
           return _AdminInfoDAL.UpdateAdminInfo(AdminID,_AdminInfo);
       }

       /// <summary>
       /// 根据管理员的ID判断该管理员是否是系统管理员
       /// </summary>
       public bool IsSys(int AdminID)
       {
           return _AdminInfoDAL.IsSys(AdminID);
       }
    }  
}
