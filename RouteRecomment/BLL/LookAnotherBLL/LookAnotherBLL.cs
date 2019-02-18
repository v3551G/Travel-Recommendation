using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model.LookAnother;
using DAL.LookAnother;


namespace BLL.LookAnotherBLL
{
   public class LookAnotherBLL
    {
       private LookAnotherDAL _LookAnotherDAL;
       public LookAnotherBLL()
       {
           _LookAnotherDAL = new LookAnotherDAL();
       }

       /// <summary> 
       /// 插入一条看了又看信息
       /// </summary>
       /// <param name="_LookAnotherInfo"></param>
       /// <returns></returns>
       public int AddLookAnother(LookAnotherInfo _LookAnotherInfo)
       {
           return this._LookAnotherDAL.AddLookAnother(_LookAnotherInfo);
       }

       
       /// <summary>
       /// 根据元素ID，类型  删除该类型的该元素
       /// </summary>
       /// <param name="KeyID"></param>
       /// <param name="Type"></param>
       /// <returns></returns>
       public int DelByIDType(int KeyID, String Type)
       {
           return this._LookAnotherDAL.DelByIDType(KeyID,Type);
       }

           
    }
}
