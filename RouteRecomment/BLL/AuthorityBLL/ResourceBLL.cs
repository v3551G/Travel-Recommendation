using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model.Authority;
using System.Data;
using DAL.AuthorityDAL;

namespace BLL.AuthorityBLL
{
   public class ResourceBLL
    {
       ResourceDAL _ResourceDAL = null;

       public ResourceBLL()
       {
           this._ResourceDAL = new ResourceDAL();
       }

       //添加一种资源
       public bool AddResource(Resource _Resource)
       {
           return _ResourceDAL.AddResource(_Resource);
       }
       //删除一种资源
       public bool DeleteResource(int ResourceID)
       {
           return _ResourceDAL.DeleteResource(ResourceID);
       }

       //查询出所有资源信息
       public DataTable GetAllResource()
       {
           return _ResourceDAL.GetAllResource();
       }
       
       //根据资源名获取其ID
       public int GetIDByResName(string ResName)
       {
           return _ResourceDAL.GetIDByResName(ResName);
       }
    }
}
