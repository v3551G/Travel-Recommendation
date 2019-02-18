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
    public partial class SceneryInfoEdit : System.Web.UI.Page
    {
        public String CityName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
             * <%=DT.Rows[i]["SceneryID"].ToString()%>&CityName=<%=CityID%>&SceneryName=<%=DT.Rows[i]["SceneryName"].ToString()%>
             */
            if (!IsPostBack)
            {
                if (Request.QueryString["CityName"] != null)
                    CityName = Request.QueryString["CityName"].ToString().Trim();

                Bind();
            }
        }

        private void Bind()
        { 
           //绑定景点信息
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            int SceneryID=0 ;
            if(Request.QueryString["SceneryID"]!=null)
               SceneryID = int.Parse(Request.QueryString["SceneryID"].ToString());

            DataTable DT = _SceneryInfoBLL.GetSceneryInfoByID(SceneryID);
            this.txtSceneryName.Text = DT.Rows[0]["SceneryName"].ToString();
            this.txtSceneryName.Enabled = false;

            this.txtSceneryPrice.Text = DT.Rows[0]["SceneryPrice"].ToString();
            this.TxtSceneryLoc.Text = DT.Rows[0]["SceneryLoc"].ToString();

            this.TxtOpenTime.Text = DT.Rows[0]["OpenTime"].ToString();

            this.txtSceneryLat.Text = DT.Rows[0]["SLongitude"].ToString().Substring(0, 8);
            this.txtSceneryLgt.Text = DT.Rows[0]["Slatitude"].ToString().Substring(0, 8);

            this.TxtSceneryIntroduce.Text = DT.Rows[0]["SceneryIntro"].ToString();
            this.TxtScenerySuitTime.Text = DT.Rows[0]["BestTravel"].ToString();


           //显示景点类型状态
            STypeBLL _STypeBLL = new STypeBLL();
            DataTable _DT = _STypeBLL.GetAllSType();
            this.CBoxType.Items.Clear();
            this.CBoxType.DataSource = _DT;
            this.CBoxType.DataTextField = "TypeName";
            this.CBoxType.DataValueField = "TypeID";
            this.CBoxType.DataBind();


            DataTable STypeDT = _STypeBLL.GetSceTypeByID(SceneryID);
            for (int i = 0; i < STypeDT.Rows.Count; i++)
                for (int j = 0; j < CBoxType.Items.Count; j++)
                    if (STypeDT.Rows[i]["TypeID"].ToString().Trim() == CBoxType.Items[j].Value.ToString().Trim())
                        CBoxType.Items[j].Selected = true;
            

        }


        protected void btEdit_Click(object sender, EventArgs e)
        {
            //根据景点信息跟新景点
            SceneryInfoBLL _SceneryInfoBLL = new SceneryInfoBLL();
            SceneryInfo _SceneryInfo = new SceneryInfo();


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

            //更新景点信息

            int SceneryID = int.Parse(Request.QueryString["SceneryID"].ToString());
            int CityID = int.Parse(Request.QueryString["CityID"].ToString());

            //更新景点类型  先把景点类型都删除然后
            bool TypeFlag = true;
            STypeBLL _STypeBLL = new STypeBLL();
            ArrayList TypeList = new ArrayList();
            for (int i = 0; i < this.CBoxType.Items.Count; i++)
            {
                if (this.CBoxType.Items[i].Selected)
                {
                    TypeList.Add(this.CBoxType.Items[i].Value);
                }

            }
            if (_STypeBLL.GetSceTypeCount(SceneryID)>0)
                _STypeBLL.DelSType(SceneryID);
    
            for (int j = 0; j < TypeList.Count; j++)
                if (!_STypeBLL.AddSceneryType(int.Parse(TypeList[j].ToString()),SceneryID))
                    TypeFlag = false;
          
            if (_SceneryInfoBLL.UpdSceneryInfoByID(SceneryID, _SceneryInfo)&&TypeFlag)
            {
                Response.Write("<script language='javascript'>");
                Response.Write("alert('更新成功');");
                Response.Write("document.location.href='SceneryInfoList.aspx?CityID="+CityID.ToString()+"';");
                Response.Write("</script>");
            }
        }
    }
}
