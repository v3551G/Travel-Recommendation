using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.LookAnother
{  
   //记录对各个关键的所有元素的观看次数
   public class SeeCount:IComparable<SeeCount>
    {
   
       private String vKeyName;
      private int vCount;
      private int vKeyID;
      
      public SeeCount()
      {
        this.vCount = 0;
      }

      public String KeyName
      {
          get { return this.vKeyName; }
          set { this.vKeyName = value; }
      }

      public int KeyID
      {
          get { return this.vKeyID; }
          set { this.vKeyID = value; }
      }
      public int Count
      {
          get { return this.vCount; }
          set { this.vCount = value; }
      }

      public int CompareTo(SeeCount _SeeCount)
      {
          return _SeeCount.Count - this.Count;
      }

    }
}
