using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class AdminInfo
    {

        public AdminInfo()
       { 
     
       }

        public AdminInfo(string _AdminAccount, string _PassWord, bool IsSYS)
       {
           this.vAdminAccount = _AdminAccount;
           this.vPassWord = _PassWord;
           this.vIsSYS = IsSYS;
       
       }
       private string vAdminAccount;
       public string AdminAccount
       {
           get { return vAdminAccount; }
           set { vAdminAccount = value; }
       
       }
       private string vPassWord;
       public string PassWord
       {
           get { return vPassWord; }
           set { vPassWord = value; }
       }

       private bool vIsSYS;
       public bool IsSYS
       {
           get { return vIsSYS; }
           set { vIsSYS = value; }
       
       }
    }
}
