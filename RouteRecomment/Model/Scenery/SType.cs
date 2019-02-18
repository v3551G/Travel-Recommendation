using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Scenery
{
   public class SType
    {
       public SType()
       { 
       
       }

       private String vTypeName;
       public String TypeName
       {
           get { return this.vTypeName; }
           set { this.vTypeName = value; }
       }
    }
}
