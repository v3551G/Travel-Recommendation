using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL.DragLog;
using Model.Log;
using System.Data;

namespace BLL.LogBLL
{
   public class DragLogBLL
    {
       private DragLogDAL _DragLogDAL;

       public DragLogBLL()
       {
           this._DragLogDAL = new DragLogDAL();
       }

       /// <summary>
       /// 添加拖拽日志
       /// </summary>
       /// <param name="_DragLogInfo"></param>
       /// <returns></returns>
       public bool AddDragLog(DragLogInfo _DragLogInfo)
       {
           return this._DragLogDAL.AddDragLog(_DragLogInfo);
       }
       /// <summary>
       /// 分页显示拖拽日志
       /// </summary>
       /// <param name="PageSize"></param>
       /// <param name="PageIndex"></param>
       /// <returns></returns>
       public DataTable DragLogSplit(int PageSize, int PageIndex)
       {
           return this._DragLogDAL.DragLogSplit(PageSize, PageIndex);
       }
              /// <summary>
       /// 获得拖拽日志的个数
       /// </summary>
       /// <returns></returns>
       public int GetDragLogCount()
       {
           return this._DragLogDAL.GetDragLogCount();
       }
              /// <summary>
       /// 根据拖拽日志ID删除日志
       /// </summary>
       /// <param name="ID"></param>
       /// <returns></returns>
       public bool DelDragLog(int ID)
       {
           return this._DragLogDAL.DelDragLog(ID);
       }
    }
}
