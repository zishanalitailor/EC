using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
using Unique.EcommGroceryStore.Core.Utility;

namespace EcommGroceryStore.Apps.Admin.Handlers
{
    /// <summary>
    /// Summary description for GetProductListHandler
    /// </summary>
    public class GetProductListHandler : IHttpHandler, IRequiresSessionState
    {
        private JsonSerializerSettings jsonSetting;
        public void ProcessRequest(HttpContext context)
        {
            #region Write JSON response proper header
            context.Response.ContentType = "application/json";
            #endregion
            #region JSON Request Core Handling Area
            Boolean requesrPrcessed = false;
            #region Generic Json Converter Settings
            jsonSetting = new JsonSerializerSettings();
            jsonSetting.Converters.Add(new StringEnumConverter
            {
                CamelCaseText = false // i always use PASCAL notation for my enums so i set it false
            });
            #endregion

            #region Refined JSON Response Area
            #region Customers
            if (context.Request.Params["___ProductList___"] != null)
            {
                switch (context.Request.Params["___ProductList___"].ToLower())
                {
                    case "get":
                        GetProductList(context);
                        break;
                    case "inactive":
                        ActiveInActiveProduct(false, context);
                        break;
                    case "active":
                        ActiveInActiveProduct(true, context);
                        break;
                    case "delete":
                        DeleteProduct(context);
                        break;
                }

                return;
            }
            #endregion

            #endregion
            #endregion
            #region Default Response Message If Request is not hanlded
            if (!requesrPrcessed)
            {
                var notHandled = new
                {
                    Result = "Failed",
                    Message = "Request Could not handled"
                };
                var result = JsonConvert.SerializeObject(notHandled, Formatting.Indented, jsonSetting);
                context.Response.Write(result);
            }
            #endregion
        }

        private void ActiveInActiveProduct(bool userStatus, HttpContext context)
        {
            SqlParameter p1 = DataAccessLayer.CreateSqlParameter("ProductId", DbType.Int32, context.Request.Params["Id"].ToString());
            SqlParameter p2 = DataAccessLayer.CreateSqlParameter("ProductStatus", DbType.Boolean, userStatus);
            SqlParameter p3 = DataAccessLayer.CreateSqlParameter("Status", DbType.Int16, 0, 0, ParameterDirection.Output);

            SqlParameter[] ps = new SqlParameter[] { p1, p2, p3 };
            using (SqlConnection connection = DataAccessLayer.Connection)
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();
                try
                {
                    DataAccessLayer.ExecuteCommandWithTransaction("Sp_UpdateDeleteProduct", transaction, ps);
                    int status;
                    if (p3.Value != null && int.TryParse(p3.Value.ToString(), out status))
                    {
                        if (status == 1)
                        {
                            transaction.Commit();
                            context.Response.Write(JsonConvert.SerializeObject(new
                            {
                                text = "Product status updated successfully!",
                                type = "success",
                                layout = "topCenter",
                                timeout = true
                            }, jsonSetting));
                        }
                        else
                        {
                            transaction.Rollback();
                            context.Response.Write(JsonConvert.SerializeObject(new
                            {
                                text = "Product could not updated!",
                                type = "warning",
                                layout = "topCenter"
                            }, jsonSetting));
                        }
                    }
                    else
                    {
                        transaction.Rollback();
                        context.Response.Write(JsonConvert.SerializeObject(new
                        {
                            text = "Some error occurred while updating Product status!",
                            type = "error",
                            layout = "topCenter"
                        }, jsonSetting));
                    }
                }
                catch (Exception exp)
                {
                    transaction.Rollback();
                    context.Response.Write(JsonConvert.SerializeObject(new
                    {
                        text = exp.Message,
                        type = "error",
                        layout = "topCenter"
                    }, jsonSetting));
                }
            }
        }

        private void DeleteProduct(HttpContext context)
        {
            SqlParameter p1 = DataAccessLayer.CreateSqlParameter("ProductId", DbType.Int32, context.Request.Params["Id"].ToString());
            SqlParameter p2 = DataAccessLayer.CreateSqlParameter("Status", DbType.Int16, 0, 0, ParameterDirection.Output);
            SqlParameter p3 = DataAccessLayer.CreateSqlParameter("Op", DbType.Int32, 1);

            SqlParameter[] ps = new SqlParameter[] { p1, p2, p3 };
            using (SqlConnection connection = DataAccessLayer.Connection)
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();
                try
                {
                    DataAccessLayer.ExecuteCommandWithTransaction("Sp_UpdateDeleteProduct", transaction, ps);
                    int status;
                    if (p2.Value != null && int.TryParse(p2.Value.ToString(), out status))
                    {
                        if (status == 1)
                        {
                            transaction.Commit();
                            context.Response.Write(JsonConvert.SerializeObject(new
                            {
                                text = "Product deleted successfully!",
                                type = "success",
                                layout = "topCenter",
                                timeout = true
                            }, jsonSetting));
                        }
                        else
                        {
                            transaction.Rollback();
                            context.Response.Write(JsonConvert.SerializeObject(new
                            {
                                text = "Product could not deleted!",
                                type = "warning",
                                layout = "topCenter"
                            }, jsonSetting));
                        }
                    }
                    else
                    {
                        transaction.Rollback();
                        context.Response.Write(JsonConvert.SerializeObject(new
                        {
                            text = "Some error occurred while deleting product!",
                            type = "error",
                            layout = "topCenter"
                        }, jsonSetting));
                    }
                }
                catch (Exception exp)
                {
                    transaction.Rollback();
                    context.Response.Write(JsonConvert.SerializeObject(new
                    {
                        text = exp.Message,
                        type = "error",
                        layout = "topCenter"
                    }, jsonSetting));
                }
            }
        }

        private void GetProductList(HttpContext context)
        {
            NameValueCollection parameters = context.Request.Params;
            int startIndex;
            int pageSize;
            String iDisplayStart = parameters["iDisplayStart"];
            String iDisplayLength = parameters["iDisplayLength"];
            String sSearch = parameters["sSearch"];

            #region Build datatable columns dictionary list to decide which colums are need to be used in sorting query
            Dictionary<String, String> datatableColumns = new Dictionary<string, string>();
            int columnIndex = 0;
            String dataColumnName = String.Format("mDataProp_{0}", columnIndex);
            String dataColumnValue = parameters[dataColumnName];

            while (dataColumnValue != null)
            {
                datatableColumns.Add(dataColumnName, dataColumnValue);

                dataColumnName = String.Format("mDataProp_{0}", ++columnIndex);
                dataColumnValue = parameters[dataColumnName];
            }
            #endregion

            #region Build Order by Clause
            StringBuilder orderByQueryClause = new StringBuilder();

            int totalSortingCols;
            int.TryParse(parameters["iSortingCols"], out totalSortingCols);

            for (int i = 0; i < totalSortingCols; i++)
            {
                String sortColIndex = parameters[String.Format("iSortCol_{0}", i)];

                String orderByColumnName = datatableColumns[String.Format("mDataProp_{0}", sortColIndex)];
                String orderByColumnDir = parameters[String.Format("sSortDir_{0}", i)];

                if (orderByQueryClause.Length == 0)
                {
                    orderByQueryClause.Append(String.Format(" order by {0} {1} ", orderByColumnName, orderByColumnDir));
                }
                else
                {
                    orderByQueryClause.Append(String.Format(", {0} {1} ", orderByColumnName, orderByColumnDir));
                }
            }
            #endregion

            int.TryParse(iDisplayStart, out startIndex);
            int.TryParse(iDisplayLength, out pageSize);

            SqlParameter p1 = DataAccessLayer.CreateSqlParameter("currentIndex", DbType.Int32, startIndex > 0 ? startIndex / pageSize : startIndex);
            SqlParameter p2 = DataAccessLayer.CreateSqlParameter("pageSize", DbType.Int32, pageSize);
            SqlParameter p3 = DataAccessLayer.CreateSqlParameter("totalRecords", DbType.Int32, 0, 0, ParameterDirection.Output);
            SqlParameter p4 = DataAccessLayer.CreateSqlParameter("orderByClause", DbType.String, totalSortingCols > 0 ? orderByQueryClause.ToString() : null);
            SqlParameter p5 = DataAccessLayer.CreateSqlParameter("search", DbType.String, sSearch.Length == 0 ? null : sSearch);
            SqlParameter p6 = DataAccessLayer.CreateSqlParameter("MainCategoryId", DbType.Int32, Convert.ToInt32(context.Request.Params["mCatId"]));
            SqlParameter p7 = DataAccessLayer.CreateSqlParameter("SubCategoryId", DbType.Int32, Convert.ToInt32(context.Request.Params["sCatId"]));

            SqlParameter[] ps = new SqlParameter[] { p1, p2, p3, p4, p5, p6, p7 };

            DataSet ds = DataAccessLayer.LoadTabularData("Sp_GetProductDetailsList", CommandType.StoredProcedure, ps);

            if (ds.Tables.Count == 1)
            {
                Dictionary<String, String> additionalInfo = new Dictionary<string, string>();
                additionalInfo.Add("sEcho", context.Request.Params["sEcho"]);
                additionalInfo.Add("iTotalRecords", p3.Value.ToString());
                additionalInfo.Add("iTotalDisplayRecords", p3.Value.ToString());
                context.Response.Write(Utilities.ConvertDataTableToJSONWithCustomInfo(ds.Tables[0], additionalInfo));
                return;
            }
            else
            {
                context.Response.Write(JsonConvert.SerializeObject(new KeyValuePair<String, String>("Message", "No Data Found in DB")));
                return;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}