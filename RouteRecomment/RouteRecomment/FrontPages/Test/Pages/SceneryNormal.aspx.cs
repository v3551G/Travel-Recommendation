using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Collections.Generic;

namespace RouteRecomment.FrontPages.Test.Pages
{
    public partial class SceneryNormal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.ScenryNormal();
            //RoteNormal();
            //SceneryQuChong();
            SceLib();
        }

        /// <summary>
        /// 过滤出包含景点大于或等于三的线路
        /// </summary>
        private void ScenryNormal()
        {
            String FP = "C:\\Users\\Administrator\\Desktop\\景点名.txt";
            String FPNormal = "C:\\Users\\Administrator\\Desktop\\景点.txt";
            StreamReader SR = new StreamReader(FP);
            StreamWriter SW = new StreamWriter(FPNormal);

            int LineNum = 1;
            String Temp;
            String Line;
            while ((Line = SR.ReadLine()) != null)
            {
                Temp = LineNum.ToString() + "," + Line;
                SW.WriteLine(Temp);
                LineNum++;
            
            }
            SR.Close();
            SW.Close();
        
        }
        private List<string> SceneryQuChong()
        {
            String FP = "C:\\Users\\Administrator\\Desktop\\景点名.txt";
            String FPNormal = "C:\\Users\\Administrator\\Desktop\\景点.txt";
            StreamReader SR = new StreamReader(FP);
            StreamWriter SW = new StreamWriter(FPNormal);

            List<String> SceList = new List<string>();
            String Line = "";

            while((Line=SR.ReadLine())!=null)
            {
                if (!SceList.Contains(Line.Trim()))
                    SceList.Add(Line.Trim());
            }
            SR.Close();
            for (int i = 0; i < SceList.Count; i++)
            {   
                if(SceList[i]!="")
                SW.WriteLine(SceList[i]);
            }

            SR.Close();
            SW.Close();
            return SceList;
        
        }
        private void RoteNormal()
        {
            String FP = "C:\\Users\\Administrator\\Desktop\\10492Strategy";
            String RotesFP = "C:\\Users\\Administrator\\Desktop\\N10492Strategy";

            DirectoryInfo StrDir = new DirectoryInfo(FP);
            FileSystemInfo[] Files = StrDir.GetFiles();
            List<String> RoteList = new List<String>();
            
            for (int i = 0; i < 10; i++)
            {
                String TempName = Files[i].Name;
                TempName = RotesFP +"\\"+ TempName;

                StreamReader sr = new StreamReader(Files[i].FullName, System.Text.Encoding.Default);
                String Content = sr.ReadToEnd();
                
                if (Content.Contains("Baidu Button END"))
                {
                    int star = Content.IndexOf("Baidu Button END");
                    Content = Content.Substring(star+16,Content.Length-16-star);
                }

                StreamWriter SW = new StreamWriter(TempName,true, System.Text.Encoding.Default);
                SW.Write(Content);
                sr.Close();
            }

        }
        private void StraNormal()
        {
            String FP = "C:\\Users\\Administrator\\Desktop\\8098Rotes.txt";
            String RotesFP = "C:\\Users\\Administrator\\Desktop\\Rotes.txt";

            List<String> RoteList = new List<String>();
            StreamReader SR = new StreamReader(FP);
            StreamWriter SW = new StreamWriter(RotesFP);
            String Line = "";
            String[] TempLine;

            while ((Line = SR.ReadLine()) != null)
            {
                Line = Line.Trim();
                if (!RoteList.Contains(Line))
                    RoteList.Add(Line);
            }
            SR.Close();

            for (int i = 0; i < RoteList.Count; i++)
                SW.WriteLine(RoteList[i]);
            SW.Close();
        }

        private void SceLib()
        {
            List<String> Temp = SceneryQuChong();

            List<String> SceList = new List<string>();

            for (int i = 0; i < Temp.Count; i++)
                SceList.Add(Temp[i]);

            String FP = "C:\\Users\\Administrator\\Desktop\\10492条路线.txt";
            StreamReader SR = new StreamReader(FP);
            //提出路线  切分出景点 添加进去链表
            string Line = "";
            String[] SceArr;
            while ((Line = SR.ReadLine()) != null)
            {

                    SceArr = Line.Trim().Split(' ');

                for (int j = 0; j < SceArr.Length; j++)
                { 
                   if(SceArr[j]!="")
                   {
                       if (!SceList.Contains(SceArr[j]))
                       {
                           SceList.Add(SceArr[j]);
                       }
                  }
                }
             }
            SR.Close();
            String FinalSceFP = "C:\\Users\\Administrator\\Desktop\\综合景点.txt";
            StreamWriter SW = new StreamWriter(FinalSceFP);
            for (int k = 0; k < SceList.Count; k++)
            {
                SW.WriteLine(SceList[k]);
            
            }
            SW.Close();

        }
    }
}
