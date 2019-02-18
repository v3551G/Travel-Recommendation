using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Sort
{
   public class RoteFre:IComparable<RoteFre>
    {
        private int vRoteID;
        private double vPreCount;

        public RoteFre()
        {
            this.vPreCount = 0.0;
        }

        public int RoteID
        {
            get { return vRoteID; }
            set { this.vRoteID = value; }
        }

        public double PreCount
        {
            get { return vPreCount; }
            set { this.vPreCount = value; }
        }
        //从大到小排列
        public int CompareTo(RoteFre _RoteFre)
        {


            if ((_RoteFre.PreCount - this.PreCount) > 0)
                return 1;
            else if
            ((_RoteFre.PreCount - this.PreCount) < 0)
                return -1;
            else
                return 0;


        }
    }
}
