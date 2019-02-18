using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.LookAnother
{
   public class LookAnotherInfo
    {
       public LookAnotherInfo()
       { 
       
       }

       private int vKeyID;
       public int KeyID
       {
           get { return this.vKeyID; }
           set { this.vKeyID = value; }
       }

       private int vAnotherLookID;
       public int AnotherLookID
       {
           get { return this.vAnotherLookID; }
           set { this.vAnotherLookID = value; }
       }

       private String vGoalType;
       public String GoalType
       {
           get { return this.vGoalType; }
           set { this.vGoalType = value; }
       }
    }
}
