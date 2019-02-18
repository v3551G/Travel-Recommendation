using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Hotel
{
   public class HtlType
    {
       public HtlType()
       { 
       
       }
       private int vHotelID;
       public int HotelID
       {
           get { return this.vHotelID; }
           set { this.vHotelID = value; }
       }

       private String vHouseType;
       public String HouseType
       {
           get { return vHouseType; }
           set { this.vHouseType = value; }
       }

       private int vSqure;
       public int Squre
       {
           get { return this.vSqure; }
           set { this.vSqure = value; }
       }

       private string vFloor;
       public String Floor
       {
           get { return this.vFloor; }
           set { this.vFloor = value; }
       }

       private String vBedType;
       public String BedType
       {
           get { return this.vBedType; }
           set { this.vBedType = value; }
       }

       private String vInternet;
       public String Internet
       {
           get { return this.vInternet; }
           set { this.vInternet = value; }
       }
    }
}
