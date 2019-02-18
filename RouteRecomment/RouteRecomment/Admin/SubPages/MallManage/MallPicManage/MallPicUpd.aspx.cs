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
using Model.Picture;
using BLL.PicBLL;

namespace RouteRecomment.Admin.SubPages.MallManage.MallPicManage
{
    public partial class MallPicUpd : System.Web.UI.Page
    {
        UpLoadFile _UpLoadFile = new UpLoadFile();  
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            int MallID = int.Parse(Request.QueryString["MallID"].ToString());
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());
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
                            //根据市ID向市图片表中插入一张图片
                            if (_PicInfoBLL.AddMallPic(MallID, PicID))
                            {
                                Response.Write("<script language='javascript'>"); //"CityInfoDel.aspx?CityID=" + delWitch;
                                Response.Write("alert('图片添加成功');");
                                Response.Write("document.location.href='MallPicList.aspx?MallID=" + MallID.ToString() + "&CityID=" + CityID.ToString() + "'");
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
                Response.Write("document.location.href='EntertainmentList.aspx?MallID=" + MallID.ToString() + "&CityID" + CityID.ToString() + "'");
                Response.Write("</script>");
            }

        }
    }
}
