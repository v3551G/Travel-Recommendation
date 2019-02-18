using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.Scenery;
using System.Data;

namespace BLL.Scenery
{
   public class AllSceTypeBLL
    {
       AllSceTypeDAL _AllSceTypeDAL;

       public AllSceTypeBLL()
       {
           this._AllSceTypeDAL = new AllSceTypeDAL();
       }

       
       #region //主要类型的添加、查询
       public int AddMType(String MTName)
       {
           return this._AllSceTypeDAL.AddMType(MTName);
       }

       public DataTable GetMTypeByName(String MTName)
       {
           return this._AllSceTypeDAL.GetMTypeByName(MTName);
       }
       #endregion

       #region //子类型的查询操作
       public int AddSubType(String STypeName)
       {
           return this._AllSceTypeDAL.AddSubType(STypeName);
       }
       public DataTable GetSubTypeByName(String SubTypeName)
       {
           return this._AllSceTypeDAL.GetSubTypeByName(SubTypeName);
       }
       #endregion

       #region//主要类型子类型的查询操作
       public int AddMTSType(int MTypeID, int SubTypeID)
       {
           return this._AllSceTypeDAL.AddMTSType(MTypeID,SubTypeID);
       
       }
       #endregion

       #region//对景点类型的查询操作
       public int AddSceSubType(int ScenetyID, int STypeID)
       {
           return this._AllSceTypeDAL.AddSceSubType(ScenetyID,STypeID);
       }
       public DataTable GetSceSubType(int SceneryID)
       {
           return this._AllSceTypeDAL.GetSceSubType(SceneryID);
       }
       #endregion
    }
}
