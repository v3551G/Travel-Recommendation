using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Authority
{
   public class AdminRole
    {
       public AdminRole()
       { 
       
       }
       public AdminRole(int _AdminID, int _RoleID)
        {
            this.vAdminID = _AdminID;
            this.vRoleID = _RoleID;

        }
        private int vAdminID;
        public int AdminID
        {
            get { return vAdminID; }
            set { vAdminID = value; }

        }
        private int vRoleID;
        public int RoleID
        {
            get { return vRoleID; }
            set { vRoleID = value; }

        }
    }
}
