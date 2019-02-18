using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAL.AuthorityDAL
{
    public class SQLHelper
    {
        private SqlConnection Conn = null;
        private SqlCommand cmd = null;
        private SqlDataReader sdr = null;


        public SQLHelper()
        {
            string Connstr = System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
            Conn = new SqlConnection(Connstr);

        }

        private SqlConnection GetConn()
        {
            if (Conn.State == ConnectionState.Closed)
            {
                Conn.Open();
            }
            return Conn;
        }


        /// <summary>
        /// 执行不带参数的增删改SQL语句或存储过程
        /// </summary>
        /// <param name="cmdText">SQL语句或存储过程</param>
        /// <returns>增删改影响的行数</returns>
        public int ExecuteNonQuery(string cmdText, CommandType ct)
        {
            int res;
            try
            {
                cmd = new SqlCommand(cmdText, GetConn());
                cmd.CommandType = ct;
                res = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Conn.State == ConnectionState.Open)
                {
                    Conn.Close();
                }
            }
            return res;
        }



        /// <summary>
        /// 执行带参数的增删改SQL语句或存储过程
        /// </summary>
        /// <param name="cmdText">SQL语句或存储过程</param>
        /// <returns>增删改影响的行数</returns>
        public int ExecuteNonQuery(string sql, SqlParameter[] paras, CommandType ct)
        {
            int res;
            try
            {
                using (cmd = new SqlCommand(sql, GetConn()))
                {
                    cmd.Parameters.AddRange(paras);
                    cmd.CommandType = ct;
                    res = cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Conn.State == ConnectionState.Open)
                {
                    Conn.Close();
                }
            }
            return res;
        }

        /// <summary>
        /// 该方法执行传入不带参数的SQL语句或存储过程
        /// </summary>
        /// <param name="cmdText">SQL语句或存储过程名称</param>
        /// <returns>DataTable</returns>
        public DataTable ExecuteQuery(string cmdText, CommandType ct)
        {
            DataTable dt = new DataTable();
            cmd = new SqlCommand(cmdText, GetConn());
            cmd.CommandType = ct;
            using (sdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
            {
                dt.Load(sdr);
            }
            return dt;
        }

        /// <summary>
        /// 该方法执行传入带参数的SQL语句或存储过程
        /// </summary>
        /// <param name="cmdText">SQL语句或存储过程名称</param>
        /// <returns>DataTable</returns>
        public DataTable ExecuteQuery(string cmdText, SqlParameter[] paras, CommandType ct)
        {
            DataTable dt = new DataTable();
            cmd = new SqlCommand(cmdText, GetConn());
            cmd.Parameters.AddRange(paras);
            cmd.CommandType = ct;
            using (sdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
            {
                dt.Load(sdr);
            }
            return dt;
        }

        /// <summary>
        /// 该方法执行传入带参数的SQL语句或存储过程
        /// </summary>
        /// <param name="cmdText">SQL语句或存储过程名称</param>
        /// <returns>SqlDataReader</returns>
        public SqlDataReader ExecuteDataReader(string cmdText, SqlParameter[] paras, CommandType ct)
        {
            cmd = new SqlCommand(cmdText, GetConn());
            cmd.Parameters.AddRange(paras);
            cmd.CommandType = ct;
            return cmd.ExecuteReader();
            //using (sdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
            //{
            //    return sdr;
            //}
        }

        /// <summary>
        /// 该方法执行传入不带参数的SQL语句或存储过程
        /// </summary>
        /// <param name="cmdText">SQL语句或存储过程名称</param>
        /// <returns>SqlDataReader</returns>
        public SqlDataReader ExecuteDataReader(string cmdText, CommandType ct)
        {
            cmd = new SqlCommand(cmdText, GetConn());
            cmd.CommandType = ct;
            return cmd.ExecuteReader();
        }

        /// <summary>
        /// 返回结果首行首列
        /// </summary>
        /// <param name="cmdText"></param>
        /// <param name="paras"></param>
        /// <param name="ct"></param>
        /// <returns></returns>
        public object ExecuteScalar(string cmdText, SqlParameter[] paras, CommandType ct)
        {
            cmd = new SqlCommand(cmdText, GetConn());
            cmd.Parameters.AddRange(paras);
            cmd.CommandType = ct;
            return cmd.ExecuteScalar();
        }


        /// <summary>
        /// 返回结果首行首列
        /// </summary>
        /// <param name="cmdText"></param>
        /// <param name="paras"></param>
        /// <param name="ct"></param>
        /// <returns></returns>
        public object ExecuteScalar(string cmdText, CommandType ct)
        {
            try
            {
                cmd = new SqlCommand(cmdText, GetConn());
                cmd.CommandType = ct;
                return cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

    }
}
