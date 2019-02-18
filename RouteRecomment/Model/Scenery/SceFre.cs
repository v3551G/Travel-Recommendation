using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Scenery
{
    public class SceFre : IComparable<SceFre>
    {
        private String vFileName;
        private double vPreCount;

        public SceFre()
        {
            this.vPreCount = 0.0;
        }

        public String FileName
        {
            get { return vFileName; }
            set { this.vFileName = value; }
        }

        public double PreCount
        {
            get { return vPreCount; }
            set { this.vPreCount = value; }
        }
        //从大到小排列
        public int CompareTo(SceFre _SceFre)
        {


            if ((_SceFre.PreCount - this.PreCount) > 0)
                return 1;
            else if
            ((_SceFre.PreCount - this.PreCount) < 0)
                return -1;
            else
                return 0;


        }

    }
}
