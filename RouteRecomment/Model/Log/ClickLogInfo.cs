using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Log
{
   public class ClickLogInfo
    {
       public ClickLogInfo()
       {
           this.UserID = 0;
       }

       private int vUserID;
       public int UserID
       {
           get { return vUserID; }
           set { this.vUserID = value; }
       }

       private DateTime vClickTime;
       public DateTime ClickTime
       {
           get { return vClickTime; }
           set { this.vClickTime = value; }
       }

       private String vClickContent;
       public String ClickContent
       {
           get { return vClickContent; }
           set { this.vClickContent = value; }
       }

       private String vContentType;
       public String ContentType
       {
           get { return this.vContentType; }
           set { this.vContentType = value; }
       }

       private String vIP;
       public String IP
       {
           get { return this.vIP; }
           set { this.vIP = value; }
       
       }

       private int vContentFlag;
       public int ContentFlag
       {
           get { return this.vContentFlag; }
           set { this.vContentFlag = value; }
       }
    }
}
