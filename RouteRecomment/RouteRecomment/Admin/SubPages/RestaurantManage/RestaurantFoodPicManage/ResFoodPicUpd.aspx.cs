﻿using System;
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
using BLL.PicBLL;
using Model.Picture;

namespace RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantFoodPicManage
{
    public partial class ResFoodPicUpd : System.Web.UI.Page
    {
        public int CityID;
        public int RestaurantID;
        public int FoodID;
        UpLoadFile _UpLoadFile = new UpLoadFile(); 
        protected void Page_Load(object sender, EventArgs e)
        {   
            if(!IsPostBack)
            {
                if (Request.QueryString["CityID"] != "0")
                {
                    this.CityID = int.Parse(Request.QueryString["CityID"].ToString());
                }
                if (Request.QueryString["RestaurantID"] != "0")
                {
                    this.RestaurantID = int.Parse(Request.QueryString["RestaurantID"].ToString());
                }
                if (Request.QueryString["FoodID"] != "0")
                {
                    this.RestaurantID = int.Parse(Request.QueryString["FoodID"].ToString());
                }
                else
                {
                    Response.Write("<script language='javascript'>"); 
                    Response.Write("alert('先选择菜，再添加图片');");
                    Response.Write("document.location.href='ResFoodPicList.aspx?CityID=" + CityID.ToString() + "&RestaurantID=" + RestaurantID.ToString() + "&FoodID=" + FoodID.ToString()+ "'");
                    Response.Write("</script>");
                }
            }

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string imgUrl = "";
                if (this.txtImgUrl.FileName.Trim() != "")
                {

                    _UpLoadFile.FilePath = @"..\..\..\UpLoadPics\";
                    _UpLoadFile.HtmlKey = "txtImgUrl";
                    HttpFileCollection updFiles = HttpContext.Current.Request.Files;


                    string PictureName = this.txtPicName.Text.ToString();
                    _UpLoadFile.ExecUploadFile(updFiles);//执行上传
                    ArrayList fileArr = (ArrayList)_UpLoadFile.Result[0];



                    if (fileArr[0].ToString() == "1") { return; }
                    if (fileArr[0].ToString() == "2")
                    {

                        Response.Write("<script language='javascript'>");
                        Response.Write("alert('图片重名!');");
                        Response.Write("</script>");
                        return;
                    }
                    if (fileArr[0].ToString() == "3")
                    {

                        Response.Write("<script language='javascript'>");
                        Response.Write("alert('图片格式不正确!');");
                        Response.Write("</script>");
                        return;
                    }
                    else
                    {
                        imgUrl = fileArr[0].ToString();
                        PicInfoBLL _PicInfoBLL = new PicInfoBLL();
                        //根据市ID向图片表中插入一张图片
                        PicInfo _PicInfo = new PicInfo();
                        _PicInfo.PictureName = this.txtPicName.Text.Trim();
                        _PicInfo.PicPath = imgUrl;
                        _PicInfo.Introduction = "";
                        _PicInfo.UpLoadTime = DateTime.Now;
                        if (_PicInfoBLL.AddPic(_PicInfo))
                        {

                            int PicID = _PicInfoBLL.GetPicID(this.txtPicName.Text.Trim(), _PicInfo.UpLoadTime);
                            CityID = int.Parse(Request.QueryString["CityID"].ToString());
                            RestaurantID = int.Parse(Request.QueryString["RestaurantID"].ToString());
                            FoodID = int.Parse(Request.QueryString["FoodID"].ToString());
                            //根据市ID向市图片表中插入一张图片
                            if (_PicInfoBLL.AddFoodPic(FoodID,PicID))
                            {
                                Response.Write("<script language='javascript'>"); //"CityInfoDel.aspx?CityID=" + delWitch;
                                Response.Write("alert('图片添加成功');");
                                Response.Write("document.location.href='ResFoodPicList.aspx?CityID=" + CityID.ToString() + "&RestaurantID=" + RestaurantID.ToString() +"&FoodID="+FoodID.ToString()+ "'");
                                Response.Write("</script>");

                            }

                        }


                    }

                }

            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加失败!');");
                Response.Write("</script>");
            }

        }
       
    }
}
