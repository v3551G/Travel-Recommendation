using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Authority
{
   public class RoleResource
    {
       public RoleResource()
       { 
       
       }
       public RoleResource(int _ResourceID, int _RoleID)
        {
            this.vResourceID = _ResourceID;
            this.vRoleID = _RoleID;

        }
        private int vResourceID;
        public int ResourceID
        {
            get { return vResourceID; }
            set { vResourceID = value; }

        }
        private int vRoleID;
        public int RoleID
        {
            get { return vRoleID; }
            set { vRoleID = value; }

        }
    }
}
