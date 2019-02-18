using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.User
{
   public class UserInfo
    {
       public UserInfo()
       { 
       }
       public UserInfo(string vNickName, string vUserAccount, string vUserPassWord, string vUserEmail, int vIsActive)
       {
           this._NickName = vNickName;
           this._UserAccount = vUserAccount;
           this._UserEmail = vUserEmail;
           this._UserPassWord = vUserPassWord;
           this._IsActive = vIsActive;
       }

       private string _NickName;
       public string NickName
       {
           get { return _NickName; }
           set { _NickName = value; }

       }

       private string _UserAccount;
       public string UserAccount
       {
           get { return _UserAccount; }
           set { _UserAccount = value; }
       }

       private string _UserPassWord;
       public string UserPassWord
       {
           get { return _UserPassWord; }
           set { _UserPassWord = value; }
       }

       private string _UserEmail;
       public string UserEmail
       {
           get { return _UserEmail; }
           set { _UserEmail = value; }
       }

       private int _IsActive;
       public int IsActive
       {
           get { return _IsActive; }
           set { _IsActive = value; }
       }
    }
}
