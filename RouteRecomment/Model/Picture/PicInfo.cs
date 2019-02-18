using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model.Picture
{
   public class PicInfo
    {
       public PicInfo()
       { 
       
       }

       //图片在服务器段的地址
       private string vPicPath;
       public string PicPath
       {
           get { return vPicPath; }
           set { vPicPath = value; }
       }

       //图片的介绍信息
       private string vIntroduction;
       public string Introduction
       {
           get { return vIntroduction; }
           set { vIntroduction = value; }
       }

       //图片的名称
       private string vPictureName;
       public string PictureName
       {
           get { return vPictureName; }
           set { vPictureName = value; }
       }

       private DateTime vUpLoadTime;
       public DateTime UpLoadTime
       {
           get { return vUpLoadTime; }
           set { vUpLoadTime = value; }
       }
    }
}
