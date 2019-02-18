using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Log
{
   public class ViewLogInfo
    {
       public ViewLogInfo()
       { 
         
       }

       private int vUserID;
       public int UserID
       {
           get { return this.vUserID; }
           set { this.vUserID = value; }
       }

       private DateTime vViewTime;
       public DateTime ViewTime
       {
           get { return this.vViewTime; }
           set { this.vViewTime = value; }
       }

       private String vViewContent;
       public String ViewContent
       {
           get { return this.vViewContent; }
           set { this.vViewContent = value ; }
       }

       private float vTimeSpan;
       public float TimeSpan
       {
           get { return this.vTimeSpan; }
           set { this.vTimeSpan = value; }
       }

       private String vIP;
       public String IP
       {
           get { return this.vIP; }
           set { this.vIP = value; }
       }
    }
}
