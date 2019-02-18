using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Hotel
{
   public class HotelInfo
    {
       public HotelInfo()
       { 
       
       }

       private String vHotelName;
       public String HotelName
       {
           get { return this.vHotelName; }
           set { this.vHotelName = value; }    
       }

       private int vStar;
       public int Star
       {
           get { return this.vStar; }
           set { this.vStar = value; }
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

       private String vHotelService;
       public String HotelService
       {
           get { return this.vHotelService; }
           set { this.vHotelService = value; }
       }

       private String vHotelIntroduction;
       public String HotelIntroduction
       {
           get { return this.vHotelIntroduction; }
           set { this.vHotelIntroduction = value; }
       }

       private String vRestaurantDevice;
       public String RestaurantDevice
       {
           get { return this.vRestaurantDevice; }
           set { this.vRestaurantDevice = value; }
       }

       private String vIndoorService;
       public String IndoorService
       {
           get { return this.vIndoorService; }
           set { this.vIndoorService = value; }
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
           get { return this.vSlatitude; }
           set { this.vSlatitude = value; }
       }
    }
}
