using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unique.EcommGroceryStore.Core.Utility
{
    public class DataAccessLayer
    {
        #region Static Utils Functions
        /// <summary>
        /// Return New SqlParameter Object with Specified Parameters
        /// </summary>
        /// <param name="name">Name of Parameter</param>
        /// <param name="dbType">DbType of Parameter</param>
        /// <param name="size">Size of Parameter</param>
        /// <param name="direction">Direction of Parameter [DEFAULT is Input]</param>
        /// <returns>New SqlParamter Object</returns>
        public static SqlParameter CreateSqlParameter(String name, DbType dbType, object value, int size = 0, ParameterDirection direction = ParameterDirection.Input)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = name;
            param.DbType = dbType;
            param.Direction = direction;

            if (direction != ParameterDirection.Output)
                param.Value = value;

            if (size > 0)
            {
                param.Size = size;
            }

            return param;
        }



        /// <summary>
        /// Fresh Instance Of SqlConnection Will be Returned Depending upon Application running Mode
        /// </summary>
        public static SqlConnection Connection
        {
            get
            {
                return new SqlConnection(ConfigurationManager.AppSettings["SQLConnectionString"]);
            }
        }

        /// <summary>
        /// Load Data From Database 
        /// In Case of Error null be resturned
        /// </summary>
        /// <param name="commandType"></param>
        /// <param name="commandText"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static DataSet LoadTabularData(String commandText, CommandType commandType = CommandType.StoredProcedure, SqlParameter[] parameters = null)
        {
            DataSet ds = new DataSet(commandText);
            try
            {
                using (SqlConnection conn = DataAccessLayer.Connection)
                {
                    SqlDataAdapter adp = new SqlDataAdapter();
                    adp.SelectCommand = new SqlCommand(commandText);
                    adp.SelectCommand.CommandType = commandType;
                    adp.SelectCommand.Parameters.Clear();
                    adp.SelectCommand.CommandTimeout = 300;

                    if (parameters != null)
                        adp.SelectCommand.Parameters.AddRange(parameters);

                    adp.SelectCommand.Connection = conn;
                    adp.Fill(ds);
                    adp.Dispose();
                }
            }
            catch (Exception exp)
            {
                ds = null;
            }
            finally
            {

            }
            return ds;
        }

        /// <summary>
        /// Load Data From Database 
        /// In Case of Error null be resturned
        /// </summary>
        /// <param name="commandType"></param>
        /// <param name="commandText"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static DataTable LoadTabularDataInDataTable(String commandText, CommandType commandType = CommandType.StoredProcedure, SqlParameter[] parameters = null)
        {
            DataTable dt = new DataTable(commandText);

            try
            {
                using (SqlConnection conn = DataAccessLayer.Connection)
                {
                    SqlDataAdapter adp = new SqlDataAdapter();
                    adp.SelectCommand = new SqlCommand(commandText);
                    adp.SelectCommand.CommandType = commandType;
                    adp.SelectCommand.Parameters.Clear();
                    adp.SelectCommand.CommandTimeout = 300;

                    if (parameters != null)
                        adp.SelectCommand.Parameters.AddRange(parameters);

                    adp.SelectCommand.Connection = conn;
                    adp.Fill(dt);
                    adp.Dispose();
                }
            }
            catch (Exception exp)
            {
                dt = null;
            }
            finally
            {

            }
            return dt;
        }

        /// <summary>
        /// Load Tabular Data
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="commandType"></param>
        /// <param name="pars"></param>
        /// <returns>Load All Data in Seperate Datasets and Output Results are Added in Last Table in DATASET in Name/Value form</returns>
        public static DataSet LoadTabularDataWithCustomParameters(String commandText, List<DatabaseParamter> pars, CommandType commandType = CommandType.StoredProcedure)
        {
            DataSet ds = new DataSet(commandText);

            try
            {
                using (SqlConnection conn = DataAccessLayer.Connection)
                {
                    SqlDataAdapter adp = new SqlDataAdapter();
                    adp.SelectCommand = new SqlCommand(commandText);
                    adp.SelectCommand.CommandType = commandType;
                    adp.SelectCommand.Parameters.Clear();

                    foreach (DatabaseParamter p in pars)
                    {
                        SqlParameter _p = new SqlParameter();
                        _p.ParameterName = p.Name;
                        _p.DbType = p.DBType;
                        _p.Direction = p.Direction;

                        if (p.Direction != ParameterDirection.Output)
                            _p.Value = p.Value;

                        if (p.Size > 0)
                            _p.Size = p.Size;

                        adp.SelectCommand.Parameters.Add(_p);
                    }

                    adp.SelectCommand.Connection = conn;
                    adp.Fill(ds);

                    if (ds != null && ds.Tables.Count >= 1)
                    {
                        DataTable outputTbl = new DataTable("Outputs");

                        DataColumn c1 = new DataColumn("Name", typeof(String));
                        DataColumn c2 = new DataColumn("Value", typeof(String));

                        outputTbl.Columns.Add(c1);
                        outputTbl.Columns.Add(c2);

                        foreach (SqlParameter pIn in adp.SelectCommand.Parameters)
                        {
                            if (pIn.Direction == ParameterDirection.Output || pIn.Direction == ParameterDirection.InputOutput || pIn.Direction == ParameterDirection.ReturnValue)
                            {
                                DataRow row = outputTbl.NewRow();
                                row[0] = pIn.ParameterName;
                                row[1] = pIn.Value;

                                outputTbl.Rows.Add(row);
                            }
                        }

                        ds.Tables.Add(outputTbl);

                    }
                }
            }
            catch (Exception exp)
            {
                ds = null;
            }
            finally
            {

            }
            return ds;
        }

        /// <summary>
        /// Execute Some Command That return Number of Rows Affected after execution
        /// OR -1 in case of Exception
        /// </summary>
        /// <param name="commandType"></param>
        /// <param name="commandText"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static int ExecuteCommand(String commandText, CommandType commandType = CommandType.StoredProcedure, SqlParameter[] parameters = null)
        {
            int result = 0;

            try
            {
                using (SqlConnection conn = DataAccessLayer.Connection)
                {
                    SqlCommand cmd = new SqlCommand(commandText);
                    cmd.CommandType = commandType;

                    if (parameters != null)
                        cmd.Parameters.AddRange(parameters);

                    if (conn.State != ConnectionState.Open)
                    {
                        conn.Open();
                    }

                    cmd.Connection = conn;

                    result = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception exp)
            {
                return -1;
            }
            finally
            {

            }

            return result;
        }

        public static int ExecuteCommandWithTransaction(String commandText, SqlTransaction transaction, SqlParameter[] parameters, CommandType commandType = CommandType.StoredProcedure)
        {
            int result = 0;

            try
            {
                using (SqlConnection conn = DataAccessLayer.Connection)
                {
                    SqlCommand cmd = new SqlCommand(commandText);
                    cmd.CommandType = commandType;

                    cmd.Transaction = transaction;

                    cmd.Connection = transaction.Connection;

                    if (parameters != null)
                        cmd.Parameters.AddRange(parameters);

                    result = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception exp)
            {
                return -1;
            }
            finally
            {

            }

            return result;
        }
        #endregion
    }

    public enum ApplicationRunningMode
    {
        Development = 1,
        Production = 2
    }

    public class DatabaseParamter
    {
        public String Name;
        public DbType DBType;
        public int Size;
        public ParameterDirection Direction;
        public Object Value;
    }
}
