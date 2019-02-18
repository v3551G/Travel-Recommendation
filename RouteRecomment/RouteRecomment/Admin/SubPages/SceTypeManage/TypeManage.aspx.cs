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
using BLL.Scenery;

namespace RouteRecomment.Admin.SubPages.SceTypeManage
{
    public partial class TypeManage : System.Web.UI.Page
    {
        public AllSceTypeBLL _AllSceTypeBLL;
        protected void Page_Load(object sender, EventArgs e)
        {
            _AllSceTypeBLL = new AllSceTypeBLL();

            this.AddType();
            this.TextBox1.Text = "完成";
        }

        //1.添加主要类型2.添加景点子类型3.添加主要类型与子类型的关联

        public void AddType()
        {
            String MTypeFP = "F:\\网站代码2014\\RouteRecomment\\RouteRecomment\\JuneThirdPages\\SceneryType\\景点类型.txt";
            StreamReader SR = new StreamReader(MTypeFP);

            String Line = "";
            String[] MTypeSubType;
            String[] SubTypeList;
            while((Line=SR.ReadLine())!=null)
            {
                MTypeSubType = Line.Split('|');
                _AllSceTypeBLL.AddMType(MTypeSubType[0]);
                DataTable MTypeDT = _AllSceTypeBLL.GetMTypeByName(MTypeSubType[0]);
                int MTypeID = int.Parse(MTypeDT.Rows[0]["MTID"].ToString());
                SubTypeList = MTypeSubType[1].Split('、');

                for (int i = 0; i < SubTypeList.Length; i++)
                {
                    _AllSceTypeBLL.AddSubType(SubTypeList[i]);
                    DataTable SubTypeDT = _AllSceTypeBLL.GetSubTypeByName(SubTypeList[i]);
                    int SubTypeID = int.Parse(SubTypeDT.Rows[0]["STypeID"].ToString());
                    _AllSceTypeBLL.AddMTSType(MTypeID,SubTypeID);

                }
                
            }
        }



        //添加景点子类型
    }
}
