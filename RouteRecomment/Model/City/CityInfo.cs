using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.City
{
   public  class CityInfo
    {
       public CityInfo()
       { 
       
       }
       public CityInfo(String _CityName, string _Introduction)
        {
            this.vCityName = _CityName;
            this.vIntroduction = _Introduction;

        }

       private string vIntroduction;
       public string Introduction
        {
            get { return vIntroduction; }
            set { vIntroduction = value; }

        }

       private string vCityName;
       public string CityName
        {
            get { return vCityName; }
            set { vCityName = value; }

        }
    }
}
