using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.AuthorityDAL;
using System.Data;
using BLL.Md5;
using Model.User;
using System.Data.SqlClient;

namespace DAL.UserDAL
{
   public class UserInfoDAL
    {
       SQLHelper SqlHelper = null;
       MD5_Encrypt Md5 = null;

       public UserInfoDAL()
       {
           this.SqlHelper = new SQLHelper();
           this.Md5 = new MD5_Encrypt();
       }


       #region 
       //增加一个用户
       public bool AddUser(UserInfo _User)
       {
           string Sql = "insert into UserInfo (UserAccount,UserNickName,UserPassWord,Email,IsActive)" +
                " values (@UserAccount,@NickName,@UserPassWord,@UserEmail,@IsActive)";

           String PassWord = Md5.GetMd5Hash(_User.UserPassWord);

           SqlParameter[] paras = new SqlParameter[]
            {
              new SqlParameter("@UserAccount",_User.UserAccount),
              new SqlParameter("@NickName",_User.NickName),
              new SqlParameter("@UserPassWord",PassWord),
              new SqlParameter("@UserEmail",_User.UserEmail),
              new SqlParameter("@IsActive",_User.IsActive)
            
            };

           if (SqlHelper.ExecuteNonQuery(Sql, paras, CommandType.Text) > 0)
           {
               return true;
           }
           else
               return false;

       }

       #endregion

       //删除
       public bool DeleteUser(int UserID)
       {
           String Sql = "delete * from UserInfo where UserID=@UserID1";
           SqlParameter[] Paras=new SqlParameter[1];

           Paras[0] = new SqlParameter("@UserID1",UserID);

           if (SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0)
           {
               return true;
           }
           return false;
       }

       #region   
       //添加一个用户的验证码
       public bool UpdateUserByAccount(string UserAccount, string AlivationCode)
       {
           string Sql = "update UserInfo set AlivationCode =@AlivationCode Where UserAccount = '" + UserAccount + "'";

           SqlParameter[] para = new SqlParameter[] { new SqlParameter("@AlivationCode", AlivationCode) };

           if (SqlHelper.ExecuteNonQuery(Sql, para, CommandType.Text) > 0)
           {
               return true;
           }
           return false;
       }
       #endregion
       #region  
       //根据UserAccount取出该用户的验证码
       public DataTable GetAlivationCodeByAccount(string UserAccount)
       {
           string Sql = "select AlivationCode from UserInfo where UserAccount = '" + UserAccount + "'";

           return SqlHelper.ExecuteQuery(Sql, CommandType.Text);
       }

       #endregion
       #region 
       //根据用户的UserAccount更新Active
       public bool UpdateUserActiveByAlivationCode(string AlivationCode)
       {
           string Sql = "Update UserInfo set IsActive = '1' where AlivationCode = '" + AlivationCode + "'";
           if (SqlHelper.ExecuteNonQuery(Sql, CommandType.Text) > 0)
               return true;
           return false;
       }
       #endregion
       //检查邮箱是否已经注册
       public int IsUserEmailExist(string UserEmail)
       {
           string Sql = "select count(UserID) from UserInfo where Email=" + "'" + UserEmail + "'";
           return (int)SqlHelper.ExecuteScalar(Sql, CommandType.Text);
       }

       //检查昵称是否存在
       public int IsNickNameExist(string UserNickName)
       {
           string Sql = "select count(UserID) from UserInfo where UserNickName=" + "'" + UserNickName + "'";
           return (int)SqlHelper.ExecuteScalar(Sql, CommandType.Text);
       }

       //检查账号是否存在
       public int IsAccountExist(string UserAccount)
       {
           string Sql = "select count(UserID) from UserInfo where UserAccount=" + "'" + UserAccount + "'";
           return (int)SqlHelper.ExecuteScalar(Sql, CommandType.Text);
       }

       //根据账号密码判断该用户是否存在  用于登录的检测
       public int IsUserExist(string   UserAccount, string UserPassWord)
       {
           String Password = Md5.GetMd5Hash(UserPassWord);
           string Sql = " select count(UserID) from UserInfo where UserAccount= '" + UserAccount + "' and UserPassWord= '" + Password + "' ";
           return (int)SqlHelper.ExecuteScalar(Sql, CommandType.Text);
       }

       //根据UserID查出该用户的详细信息
       public DataTable GetUserInfoByID(int UserID)
       {
           String Sql = "select UserID,UserNickName,UserAccount,UserPassWord from UserInfo where UserID=@UserID";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter ("@UserID",UserID)
           };
           return (DataTable)SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

       //查找该用户的UserID
       public string   GetUserID(string   UserAccount)
       {
           String Sql = "select UserID from UserInfo where UserAccount=@UserAccount";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter ("@UserAccount",UserAccount)
           };
           return (string)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       }

       //查找用户的昵称
     /*  public int GetUserNickName(String UserAccount)
       {
           String Sql = "Select UserNickName from UserInfo where UserAccount=@UserAccount";
           SqlParameter[] Paras = new SqlParameter[]
           {
               new SqlParameter ("@UserAccount",UserAccount )
           };
           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       }*/

       //查询出所有用户的信息
       public DataTable GetAllUserInfo()
       {
           String Sql = "select * from UserInfo";
           return (DataTable)SqlHelper.ExecuteQuery(Sql,CommandType.Text);
       }

       //根据用户ID更新其信息
       public bool UpdateUserInfo(int UserID,UserInfo _UserInfo)
       {
           String Sql = "update UserInfo set UserAccount=@UserAccount,UserNickName=@UserNickName,UserPassWord=@UserPassWord"+" where UserID=@UserID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter ("@UserAccount",_UserInfo.UserAccount),
              new SqlParameter ("@UserPassWord",_UserInfo.UserPassWord),
              new SqlParameter ("@UserID",UserID),
           };
           return (SqlHelper.ExecuteNonQuery(Sql,Paras,CommandType.Text)>0? true:false );
       }
    }
}
