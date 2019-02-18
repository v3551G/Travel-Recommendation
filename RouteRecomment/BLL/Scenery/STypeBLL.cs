using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.Scenery;
using System.Data;
using Model.Scenery;

namespace BLL.Scenery
{
   public class STypeBLL
    {
       private STypeDAL _STypeDAL = null;

       public STypeBLL ()
       {
         this._STypeDAL = new STypeDAL ();
       }

       ///<summary>
       ///景点的ID找出该景点的类型
       /// </summary>
       public DataTable GetSceTypeByID(int SceneryID)
       {
           return this._STypeDAL.GetSceTypeByID(SceneryID);
       }

        ///<summary>
        ///查询出所有的类型
        /// </summary>
       public DataTable GetAllSType()
       {
           return this._STypeDAL.GetAllSType();
       }

        ///<summary>
        ///添加一个景点的类型
        /// </summary>
       public bool AddSceneryType(int TypeID, int SceneryID)
       {
           return this._STypeDAL.AddSceneryType(TypeID,SceneryID);
       }

        ///<summary>
        ///根据景点ID删除一个景点类型
        /// </summary>
       public bool DelSType(int SceneryID)
       {
           return this._STypeDAL.DelSType(SceneryID);
       }

       ///<summary>
       ///根据类型ID删除一个景点的类型
       /// </summary>
       public bool DelSceneryType(int TypeID)
       {
           return this._STypeDAL.DelSceneryType(TypeID);
       }
       
       ///<summary>
       ///根据类型ID删除一个景点类型
       /// </summary>
       public bool DelSTypebyTID(int TypeID)
       {
           return this._STypeDAL.DelSTypebyTID(TypeID);
       }
        ///<summary>
        ///根据景点ID找出该景点的所有类型
        /// </summary>
       public int GetSceTypeCount(int SceneryID)
       {
           return this._STypeDAL.GetSceTypeCount(SceneryID);
       }

       ///<summary>
       ///添加一个类型
       /// </summary>
       public bool AddSType(SType _SType)
       {
           return this._STypeDAL.AddSType(_SType);
       }

        ///<summary>
        ///根据类型ID查看景点类型个数
        /// </summary>
       public int GetSceTypeCountByTID(int TypeID)
       {
           return this._STypeDAL.GetSceTypeCountByTID(TypeID);
       }
    }
}
