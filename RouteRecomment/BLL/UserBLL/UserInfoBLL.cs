using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.UserDAL;
using Model.User;
using System.Data;
using Model;
using DAL.UserDAL;

namespace BLL.UserBLL
{
   public class UserInfoBLL
    {
       public UserInfoDAL _UserInfoDAL = null;

       public UserInfoBLL()
       {
         this._UserInfoDAL= new UserInfoDAL ();
       }

       #region 
       //根据用户的UserAccount更新Active
       public bool UpdateUserActiveByAlivationCode(string AlivationCode)
       {
           return this._UserInfoDAL.UpdateUserActiveByAlivationCode(AlivationCode);
       }
       #endregion

       #region  
       //增加一个用户
       public bool AddUser(UserInfo _User)
       {
           return this._UserInfoDAL.AddUser(_User);
       }
       #endregion

       #region
       //删除一个用户
       public  bool DeleteUser(int UserID)
       {
           return this._UserInfoDAL.DeleteUser(UserID);
       }
       #endregion

      

       #region  
       //添加一个用户的验证码
       public bool UpdateUserByAccount(string UserAccount, string AlivationCode)
       {
           return this._UserInfoDAL.UpdateUserByAccount(UserAccount, AlivationCode);
       }
       #endregion

       #region  
       //根据UserAccount取出该用户的验证码
       public DataTable GetAlivationCodeByAccount(string UserAccount)
       {
           return this._UserInfoDAL.GetAlivationCodeByAccount(UserAccount);
       }
       #endregion

       #region
       //检查邮箱是否已经注册
       public int IsUserEmailExist(string UserEmail)
       {
           return this._UserInfoDAL.IsUserEmailExist(UserEmail);
       }
       #endregion

       #region
       //检查昵称是否存在
       public int IsNickNameExist(string UserNickName)
       {
           return this._UserInfoDAL.IsNickNameExist(UserNickName);
       }
       #endregion


       #region
       //检查账号是否存在
       public int IsAccountExist(string UserAccount)
       {
           return this._UserInfoDAL.IsAccountExist(UserAccount);
       }
       #endregion

       #region
       //根据账号密码判断该用户是否存在  用于登录的检测
       public int IsUserExist(string   UserAccount, string UserPassWord)
       {
           return this._UserInfoDAL.IsUserExist(UserAccount, UserPassWord);
       }
       #endregion

        #region 
       //查询所有用户的信息
       public DataTable GetAllUserInfo()
       {
           return _UserInfoDAL.GetAllUserInfo();
       }
        #endregion

       #region
       //更新用户信息
       public bool UpdateUserInfo(int UserID,UserInfo _UserInfo)
       {
           return _UserInfoDAL.UpdateUserInfo(UserID,_UserInfo);
       }
       #endregion

        #region 
       //查询出用户的ID
       public string  GetUserID(string   UserAccount)
       {
           return _UserInfoDAL.GetUserID(UserAccount);
       }
        #endregion

     /*  #region
       //查询用户的昵称
       public int GetUserNickName( String UserAccount)
       {
           return _UserInfoDAL.GetUserNickName(UserAccount);
       }
        #endregion
       */
    }
}
