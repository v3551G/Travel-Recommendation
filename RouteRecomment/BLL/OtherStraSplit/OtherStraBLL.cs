using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.StrategyDAL;
using System.Data;

namespace BLL.OtherStraSplit
{
   public class OtherStraBLL
    {
       private StrategyInfoDAL _StrategyInfoDAL = null;

       public OtherStraBLL()
       {
           this._StrategyInfoDAL = new StrategyInfoDAL();
       }

       //将其他网站的评论按时间的降序分页显示
       public DataTable OtherStraSplit(int PageSize, int PageIndex)
       {
           return this._StrategyInfoDAL.OtherStraSplit(PageSize,PageIndex);
       }

       //根据发布者ID查询出器发布者信息
       public DataTable GetPIByPubID(int PubID)
       {
           return this._StrategyInfoDAL.GetPIByPubID(PubID);
       }
       
       //得出所有的外站攻略
       public int GetStrategyCount()
       {
           return this._StrategyInfoDAL.GetStrategyCount();
       }
       //插入一条攻略景点信息
       public void InsertStraSce(int SceID, int StraID)
       {
           this._StrategyInfoDAL.InsertStraSce(SceID,StraID);
       }

       //得出所有的攻略信息
       public DataTable GetAllStra()
       {
           return this._StrategyInfoDAL.GetAllStra();
       }

       
       //根据根据网站名分页显示攻略
       public DataTable GetStraSplit(int SceneryID,String WebSiteName, int PageSize, int PageIndex)
       {
           return this._StrategyInfoDAL.GetStraSplit(SceneryID,WebSiteName, PageSize, PageIndex);
       }

       //根据网站名获取该网站的所有攻略 针对马蜂窝 同程网 携程网
       public int GetStrCountByNameSceID(String WebSiteName,int SceneryID)
       {
           return this._StrategyInfoDAL.GetStrCountByNameSceID(WebSiteName,SceneryID);
       }

       //获得欣欣网的所有攻略
       public DataTable GetXinXinStraSplit(int PageSize, int PageIndex)
       {
           return this._StrategyInfoDAL.GetXinXinStraSplit(PageSize,PageIndex);
       }

       //获得信息网的攻略数目
       public int GetXinXinStraCount()
       {
           return this._StrategyInfoDAL.GetXinXinStraCount();
       }

       //获取ID在一定范围内攻略
       public DataTable GetOtherStra()
       {
           return this._StrategyInfoDAL.GetOtherStra();
       }

       //更具ID号和内容更新指定的攻略
       public void UpdStra(int StraID, String StrContent)
       {
            this._StrategyInfoDAL.UpdStra(StraID,StrContent);
       }

              //添加一条攻略景点
       public void AddStraSce(int StraID, int SceID)
       {
           this._StrategyInfoDAL.AddStraSce(StraID,SceID);
       }
    }
}
