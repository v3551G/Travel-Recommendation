using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Log
{
   public class DragLogInfo
    {
       public DragLogInfo()
       {
           this.UserID = 0;
       }
       private int vUserID;
       public int UserID
       {
           get { return this.vUserID; }
           set { this.vUserID = value; }
       }

       private DateTime vDateTime;
       public DateTime DateTime
       {
           get { return this.vDateTime; }
           set { this.vDateTime = value; }
       }

       private String vDragContent;
       public String DragContent
       {
           get { return this.vDragContent; }
           set { this.vDragContent = value; }
       }

       private String vIP;
       public String IP
       {
           get { return this.vIP; }
           set { this.vIP = value; }
       }

       private String vUserAccount;
       public String  UserAccount
       {
           get { return this.vUserAccount; }
           set { this.vUserAccount = value; }
       }
    }
}
