using System;
using System.Linq;
using System.Text;
using System.Web;
using System.Collections;
using System.Collections.Generic;

namespace Model.FrequItem
{
    //存储关联规则
    public class ItemSets
    {
        public string items;
        public int sup;
        public string Items
        {
            get { return items; }
            set { items = value; }
        }
        public int Sup
        {
            get { return sup; }
            set { sup = value; }
        }
        public ItemSets()//对象初始化
        {
            items = null;
            sup = 0;
        }
    }
}
