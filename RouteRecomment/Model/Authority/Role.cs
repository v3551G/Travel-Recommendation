using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Authority
{
   public class Role
    {
       public Role()
       {
          
       }
        public Role(String _RoleName)
        {
            this.vRoleName = _RoleName;


        }
        private string vRoleName;
        public string RoleName
        {
            get { return vRoleName; }
            set { vRoleName = value; }

        }
    }
}
