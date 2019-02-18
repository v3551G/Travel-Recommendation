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
using BLL.Scenery;
using Model.Scenery;

namespace RouteRecomment.Admin.SubPages.SceneryManage.SceneryInfoManage
{
    public partial class SceneryInfoAdd : System.Web.UI.Page
    {
        public String CityName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            // "SceneryInfoAdd.aspx?CityID="+Value+"&CityName="+Text;
            if (!IsPostBack)
            {
                if (Request.QueryString["CityName"] != null)
                    CityName = Request.QueryString["CityName"].ToString()+"景点添加";
                Bind();
            }
        }

        //景点类型的绑定
        private void Bind()
        {
            STypeBLL _STypeBLL = new STypeBLL();
            DataTable DT = _STypeBLL.GetAllSType();
            this.CBoxType.Items.Clear();
            this.CBoxType.DataSource = DT;
            this.CBoxType.DataTextField = "TypeName";
            this.CBoxType.DataValueField = "TypeID";
            this.CBoxType.DataBind();

        
        }

        protected void btEdit_Click(object sender, EventArgs e)
        {
            //添加景点信息
            STypeBLL _STypeBLL = new STypeBLL();
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            SceneryInfo _SceneryInfo = new SceneryInfo();
            _SceneryInfo.SceneryName = this.txtSceneryName.Text.Trim();
            _SceneryInfo.CityID = int.Parse(Request.QueryString["CityID"].ToString());

            _SceneryInfo.SceneryPrice = this.txtSceneryPrice.Text.Trim();
            _SceneryInfo.SceneryLoc = this.TxtSceneryLoc.Text.Trim();
            _SceneryInfo.OpenTime = this.TxtOpenTime.Text.Trim();
            _SceneryInfo.SceneryIntro = this.TxtSceneryIntroduce.Text.Trim();
            _SceneryInfo.BestTravel = this.TxtScenerySuitTime.Text.Trim();

            if (txtSceneryLgt.Text.Trim() != "")
                _SceneryInfo.SLongitude = float.Parse(txtSceneryLgt.Text.Trim().ToString());
            else
                _SceneryInfo.SLongitude = 0.0f;

            if (txtSceneryLat.Text.Trim() != "")
                _SceneryInfo.Slatitude = float.Parse(txtSceneryLat.Text.Trim().ToString());
            else
                _SceneryInfo.Slatitude = 0.0f;

            //添加景点类型
            ArrayList TypeList = new ArrayList();
            for (int i = 0; i < this.CBoxType.Items.Count; i++)
            {
                if (this.CBoxType.Items[i].Selected)
                {
                    TypeList.Add(this.CBoxType.Items[i].Value);
                }
            
            }

            bool IsSType = true;
            for (int j = 0; j < TypeList.Count; j++)
            { 
                if(!_STypeBLL.AddSceneryType(int.Parse(TypeList[j].ToString()),_SceneryInfo.CityID))  
                {
                     IsSType = false;
                     break;
                }
            }

            //判断是否添加成功
            if (_SceneryInfoBLL.AddScenery(_SceneryInfo)&&IsSType)
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('添加成功');");
                Response.Write("document.location.href='SceneryInfoList.aspx';");
                Response.Write("</script>");
            }
        }
    }
}
