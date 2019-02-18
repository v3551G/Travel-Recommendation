using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Web;
using System.IO;

namespace Model.Picture
{
   public class UpLoadFile
    {
        private string _filePath;//文件存放路径
        private string _htmlKey;//input file name  
        private ArrayList _result = new ArrayList();

        public UpLoadFile()
        {

        }

        // 文件存放地址
        public string FilePath
        {
            set { _filePath = value; }
            get { return _filePath; }
        }

        // file key 标识
        public string HtmlKey
        {
            set { _htmlKey = value; }
            get { return _htmlKey; }
        }

        // 返回结果
        public ArrayList Result
        {
            set { _result.Add(value); }
            get { return _result; }
        }
        /// <summary>
        /// 上传图片
        /// </summary>
        /// <param name="filePath">图片放置路径</param>
        /// <param name="htmlKey">input file 的名字</param>
        /// <returns></returns>
        /**
                fileUPD.FilePath = @"uploadfiles\act\";
                fileUPD.HtmlKey = "txtImgUrl";
                fileUPD.ImgSlt = false;
                fileUPD.FilePathSlt = @"uploadfiles\act\slt\";
         **/
        public void ExecUploadFile(HttpFileCollection fileCollection)
        {
            String nowTime = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss").Replace("-", "").Replace(":", "").Replace(" ", "");
            ArrayList arrayFilePath = new ArrayList();
            for (int i = 0; i < fileCollection.Count; i++)
            {
                if (fileCollection.Keys[i] == _htmlKey)   //这条语句有什么用？
                {
                    //没有选取文件
                    if (fileCollection[i].ContentLength == 0)
                    {
                        arrayFilePath.Add("1");
                        Result.Add(arrayFilePath);
                    }
                    else
                    {
                        string fileContentType = fileCollection[i].ContentType;
                        string filea = fileCollection[i].FileName;
                        // 文件名称
                        string fileName = nowTime + i.ToString() + filea.Substring(filea.LastIndexOf(@"\") + 1); 

                        string webPath = _filePath + fileName;
                        // 服务器端文件路径
                        string webFilePath = System.Web.HttpContext.Current.Server.MapPath(webPath);         
              

                        int fileSize = fileCollection[i].ContentLength;

                        string fileOkType = "image/bmp|image/gif|image/pjpeg|image/jpg|image/jpeg|application/x-shockwave-flash|application/octet-stream";

                        if (fileOkType.IndexOf(fileContentType) > -1)
                        {
                            if (!File.Exists(webFilePath))
                            {
                                try
                                {
                                    //上传图片
                                    fileCollection[i].SaveAs(webFilePath);       //正常保存
                                    arrayFilePath.Add(webPath.Replace(@"\", "/"));
                                    Result.Add(arrayFilePath);
                                   

                                }
                                catch (Exception exc)
                                {
                                   // System.Web.HttpContext.Current.Response.Write("<Script Language='JavaScript'>window.alert('" + exc.Message.ToString() + "');</script>");
                                    arrayFilePath.Add(exc.Message);
                                    Result.Add(arrayFilePath);
                                    
                                }
                            }
                            //处理问存在问题，重名问题:2
                            else
                            {
                                arrayFilePath.Add("2");
                                Result.Add(arrayFilePath);
                            }
                        }
                        //图片格式问题：3
                        else
                        {
                            arrayFilePath.Add("3");
                            Result.Add(arrayFilePath);
                        }
                    }
                }
            }
        }

       
    }
}
