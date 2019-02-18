
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Collections.Generic;

namespace Model.FrequItem
{
    //线路存储对象
    public class Routes : IComparable<Routes>
    {
        public String sceStr;   //景点序列
        public String SceType;  //景点类型
        public String seqStr;   //景点编号序列
        public int[] rouTime = new int[3]; //天数计算
        public int rouPay;      //门票消费
        public double rate;     //线路优先等级
        public String slalon;   //经纬度
        public String timeSpans;//适游时间序列
        public String toNextTimes;//到下一景点时间序列
        public Routes()//初始化
        {
            sceStr = null;
            seqStr = null;
            rouPay = 0;
            rouTime[0] = rouTime[1] = rouTime[2] = 0;
            rate = 0.0;
            slalon = null;
            SceType = null;
            timeSpans = null;
            toNextTimes = null;
        }

        public string TimeSpans
        {
            get { return timeSpans;}
            set { timeSpans = value;}
        }

        public string ToNextTims
        {
            get { return toNextTimes;}
            set { toNextTimes = value; }
        }
        public string SceStr
        {
            get { return sceStr; }
            set { sceStr = value; }
        }
        public string Slalon
        {
            get { return slalon; }
            set { slalon = value; }
        }
        public string SeqStr
        {
            get { return seqStr; }
            set { seqStr = value; }
        }
        public int RouPay
        {
            get { return rouPay; }
            set { rouPay = value; }
        }

        public double Rate
        {
            get { return rate; }
            set { rate = value; }
        }

        public void AddTime(int minute)
        {
            int kk = 0;
            int k = (this.rouTime[2] + minute) / 60;
            this.rouTime[2] = (this.rouTime[2] + minute) % 60;
            if (k != 0)
            {
                kk = (this.rouTime[1] + k) / 9;
                this.rouTime[1] = (this.rouTime[1] + k) % 9;
            }
            if (kk != 0)
                this.rouTime[0] = this.rouTime[0] + kk;
        }

        public bool AddTry(int minute, int Days)
        {
            int kk = 0;
            int[] Time = new int[3];
            int k = (this.rouTime[2] + minute) / 60;
            Time[2] = (this.rouTime[2] + minute) % 60;
            if (k != 0)
            {
                kk = (this.rouTime[1] + k) / 9;
                Time[1] = (this.rouTime[1] + k) % 9;
            }
            if (kk != 0)
                Time[0] = this.rouTime[0] + kk;
            if ((Time[0] < Days))
                return true;
            else
                return false;
        }
        public int CompareTo(Routes _Routes)
        {
            if ((_Routes.rate - this.rate) > 0)
                return 1;
            else if
            ((_Routes.rate - this.rate) < 0)
                return -1;
            else
                return 0;
        }
    }
}