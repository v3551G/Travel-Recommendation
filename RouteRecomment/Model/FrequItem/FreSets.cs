using System;
using System.Linq;
using System.Text;
using System.Web;
using System.Collections;
using System.Collections.Generic;

namespace Model.FrequItem
{
    //存储频繁项集
    public class FreSets
    {
        public string items;
        public double fre;
        public string seq;
        public string slalon;
        public string timeSpan;

        public string TimeSpan
        {
            get { return timeSpan; }
            set { timeSpan = value; }
        }
        public string Items
        {
            get { return items; }
            set { items = value; }
        }
        public double Sup
        {
            get { return fre; }
            set { fre = value; }
        }

        public string Slalon {
            get { return slalon; }
            set { items = value; }
        }
        public string Seq {
            get { return seq; }
            set { seq = value; }
        }
        public FreSets()//对象初始化
        {
            items = null;
            fre = 0.00;
            seq = null;
            timeSpan = null;
        }
    }
}
