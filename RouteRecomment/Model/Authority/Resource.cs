using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Authority
{
    public class Resource
    {
        public Resource()
        {
           
        }
        public Resource(String _ResourceName)
        {
            this.vResourceName = _ResourceName;
        }
        private string vResourceName;
        public string ResourceName
        {
            get { return vResourceName; }
            set { vResourceName = value; }

        }
    }
}
