using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Scenery
{
   public class SceneryInfo
    {
       public SceneryInfo()
       { 
       
       }

       private String vSceneryName;
       public String SceneryName
       {
           get { return this.vSceneryName;}
           set { this.vSceneryName = value; }
       }

       private String vSceneryLoc;
       public String SceneryLoc
       {
           get { return this.vSceneryLoc; }
           set { this.vSceneryLoc = value; }
       }

       private String vOpenTime;
       public String OpenTime
       {
           get { return this.vOpenTime; }
           set { this.vOpenTime = value; }
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

       private int vCityID;
       public int CityID
       {
           get { return this.vCityID; }
           set { this.vCityID = value; }
       }

       private String vSceneryIntro;
       public String SceneryIntro
       {
           get { return this.vSceneryIntro; }
           set { this.vSceneryIntro = value; }
       }

       private String vBestTravel;
       public String BestTravel
       {
           get { return this.vBestTravel; }
           set { this.vBestTravel = value; }
       }

       private String vSceneryPrice;
       public String SceneryPrice
       {
           get { return this.vSceneryPrice; }
           set { this.vSceneryPrice = value; }
       }

    }
}
