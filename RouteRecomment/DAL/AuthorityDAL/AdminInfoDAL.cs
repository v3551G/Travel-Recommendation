using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Data;
using System.Data.SqlClient;

namespace DAL.AuthorityDAL
{
   public class AdminInfoDAL
    {
       SQLHelper SqlHelper = null;

       public AdminInfoDAL()
       {
           this.SqlHelper = new SQLHelper();
       }

       //添加一个管理员信息
       public bool AddAdminInfo(AdminInfo _AdminInfo)
       {
           string Sql = "insert into AdminInfo(AdminAccount,AdminPass,IsSys) values (@AdminAccount,@AdminPass,@IsSys)";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@AdminAccount",_AdminInfo.AdminAccount),
              new SqlParameter("@AdminPass",_AdminInfo.PassWord),
              new SqlParameter("@IsSys",_AdminInfo.IsSYS)
           };

           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
           {
               return true;
           }
           else
               return false;
       }
       //删除一个管理员信息
       public bool DeleteAdminInfo(int AdminID)
       {
           String Sql = "delete from AdminInfo where AdminID = @AdminID1";
           SqlParameter[] Paras = new SqlParameter[1];

           Paras[0] = new SqlParameter("@AdminID1", AdminID);
          
           if (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       }

       //根据管理员的信息(账号和密码)来检测该管理员存在与否  
       public int CheckLoginInfo(String AdminAccount, String PassWord)
       {
           string sql = "select count(*) from AdminInfo where AdminAccount = @AdminAccount and " +
                         "AdminPass = @Password";

           SqlParameter[] Paras = new SqlParameter[] { new SqlParameter("@AdminAccount", AdminAccount) ,
                                                       new SqlParameter("@Password",PassWord)};

           return ((int)SqlHelper.ExecuteScalar(sql, Paras, CommandType.Text)>0 ? 1:0);
       }

        /// <summary>
        /// 根据管理员的角色类型、资源名来判断该管理员是否有相应的权限
        /// </summary>
       public bool CheckFunction(int RoleID,String Resource)
       {
           string Sql = "select Count(*) from RoleResource,Resource where RoleResource.ResourceID = Resource.ResourceID " +
               " and RoleResource.RoleID = @RoleID and Resource.ResourceName = @Resource";

           SqlParameter[] Paras = new SqlParameter []
           {
                 new SqlParameter("RoleID",RoleID),
                 new SqlParameter("Resource",Resource)  
           };

           if( (int)SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text) > 0)
               return true;
           return false;
       
       }

        /// <summary>
        /// 根据管理员的账号、密码判断该管理员是否是系统管理员
        /// </summary>
       public bool IsSys(string Account, string Password)
       {
           string Sql = "select IsSys from AdminInfo where AdminInfo.AdminAccount =@Account and "+
                        " AdminInfo.AdminPass =@Password";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@Account",Account),
              new SqlParameter("@Password",Password)
           };
           int Temp = int.Parse(SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text).ToString());
           if(Temp>0)
           return true;
           return false;
            
       }

       /// <summary>
       /// 根据管理员的ID判断该管理员是否是系统管理员
       /// </summary>
       public bool IsSys(int AdminID)
       {
           String Sql = "select IsSys from AdminInfo where AdminInfo.AdminID = @AdminID";

           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@AdminID",AdminID)
           };

           return (int.Parse(SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text).ToString()) > 0 ? true:false);
       
       }
        /// <summary>
        /// 查询出所有管理员的信息
        /// </summary>
       public DataTable  GetAllAdminInfo()
       {
           String Sql = "select * from AdminInfo ";

           return (DataTable)SqlHelper.ExecuteQuery(Sql,CommandType.Text);
       }
      
        /// <summary>
        /// 根据管理员账号查出该管理员的详细信息
        /// </summary>
       public DataTable GetAdminInfoByID(int AdminID)
       {
           String Sql = "select AdminAccount,AdminPass from AdminInfo where AdminID=@AdminID";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@AdminID",AdminID)
           };

           return (DataTable)SqlHelper.ExecuteQuery(Sql,Paras,CommandType.Text);
       }

        /// <summary>
        /// 查询出管理员的ID
        /// </summary>
       public int GetAdminID(String AdminAccount)
       {
           String Sql = "select AdminID from AdminInfo where AdminAccount = @AdminAccount";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@AdminAccount",AdminAccount)
           };

           return (int)SqlHelper.ExecuteScalar(Sql,Paras,CommandType.Text);
       
       }
       /// <summary>
       /// 查询出管理员是否存在
       /// </summary>
       public int AdminExist(String AdminAccount)
       {
           String Sql = "select Count(*) from AdminInfo where AdminAccount = @AdminAccount";
           SqlParameter[] Paras = new SqlParameter[]
           {
              new SqlParameter("@AdminAccount",AdminAccount)
           };

           return (int)SqlHelper.ExecuteScalar(Sql, Paras, CommandType.Text);
       
       }
       /// <summary>
       /// 根据管理员的ID来更新其信息
       /// </summary>
       public bool UpdateAdminInfo(int AdminID, AdminInfo _AdminInfo)
       {
           String Sql = "Update AdminInfo set AdminAccount=@AdminAccount ,AdminPass = @AdminPass " +
                        "where AdminID = @AdminID";

           SqlParameter[] Paras = new SqlParameter[]
            {
                new SqlParameter("@AdminAccount",_AdminInfo.AdminAccount),
                new SqlParameter("@AdminPass",_AdminInfo.PassWord),
                new SqlParameter("@AdminID",AdminID)
            
            };

           return (SqlHelper.ExecuteNonQuery(Sql, Paras, CommandType.Text) > 0 ? true : false);
       }
    }
}
