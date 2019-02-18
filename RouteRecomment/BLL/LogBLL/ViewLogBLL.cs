using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.LogDAL;
using Model.Log;
using System.Data;

namespace BLL.LogBLL
{
   public  class ViewLogBLL
    {

       public ViewLogDAL _ViewLogDAL;
       public ViewLogBLL()
       {
           this._ViewLogDAL = new ViewLogDAL();
       }

       /// <summary>
       /// 添加一个浏览日志
       /// </summary>
       /// <param name="_ViewLogInfo"></param>
       /// <returns></returns>
       public int AddViewLog(ViewLogInfo _ViewLogInfo)
       {
           return this._ViewLogDAL.AddViewLog(_ViewLogInfo);
       }

       /// <summary>
       /// 分页显示浏览日志
       /// </summary>
       /// <param name="PageIndex"></param>
       /// <param name="PageSize"></param>
       /// <returns></returns>
       public DataTable GetViewLogSplit(int PageIndex, int PageSize)
       {
           return this._ViewLogDAL.GetViewLogSplit(PageIndex,PageSize);
       }

              /// <summary>
       /// 查询出浏览日志个数
       /// </summary>
       /// <returns></returns>
       public int GetViewLogCount()
       {
           return this._ViewLogDAL.GetViewLogCount();
       }

        /// <summary>
       /// 根据日志ID删除一条日志记录
       /// </summary>
       /// <param name="ID"></param>
       /// <returns></returns>
       public bool DelViewLog(int ID)
       {
           return this._ViewLogDAL.DelViewLog(ID);
       }
    }

}
