using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Restaurant
{
   public class RestaurantFoodInfo
    {
       public RestaurantFoodInfo()
       { 
       
       }

       private String vFoodName;
       public String FoodName
       {
           get { return this.vFoodName; }
           set { this.vFoodName = value; }
       }

       private float vFoodPrice;
       public float FoodPrice
       {
           get { return this.vFoodPrice; }
           set { this.vFoodPrice = value; }
       }

       private  int vRestaurantID;
       public int RestaurantID
       {
           get { return this.vRestaurantID; }
           set { this.vRestaurantID = value; }
       }

    }
}
