﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Entertainment
{
   public class EntertainmentInfo
    {
       public EntertainmentInfo()
       { 
       
       }


       private String vLocal;
       public String Local
       {
           get { return this.vLocal; }
           set { this.vLocal = value; }
       }

       private String vPhoneNum;
       public String PhoneNum
       {
           get { return this.vPhoneNum; }
           set { this.vPhoneNum = value; }
       }

       private String vIntroduction;
       public String Introduction
       {
           get { return this.vIntroduction; }
           set { this.vIntroduction = value; }
       }

       private String vOpenTime;
       public String OpenTime
       {
           get { return this.vOpenTime; }
           set { this.vOpenTime = value; }
       }

       private int vCityID;
       public int CityID
       {
           get { return this.vCityID; }
           set { this.vCityID = value; }
       }

       private float vSLongitude;
       public float SLongitude
       {
           get { return this.vSLongitude; }
           set { this.vSLongitude = value; }
       }

       private float vSlatitude;
       public float Slatitude
       {
           get { return this.vSLongitude; }
           set { this.vSLongitude = value; }
       }

       private String vEntertainmentName;
       public String EntertainmentName
       {
           get { return this.vEntertainmentName; }
           set { this.vEntertainmentName = value; }
       }

    }
}
