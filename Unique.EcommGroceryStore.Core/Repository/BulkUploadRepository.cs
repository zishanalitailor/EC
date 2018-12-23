using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unique.EcommGroceryStore.DAL.EntityModel;
using Unique.EcommGroceryStore.Core.Utility;

namespace Unique.EcommGroceryStore.Core.Repository
{
    public class BulkUploadRepository
    {
        public List<ProductDetails> _list { get; set; }
        public BulkUploadRepository(List<ProductDetails> list)
        {
            _list = list;
        }

        public void UploadProduct()
        {
            string consString = ConfigurationManager.AppSettings["SQLConnectionString"];
            using (var connection = new SqlConnection(consString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                using (var bulkCopy = new SqlBulkCopy(connection, SqlBulkCopyOptions.Default, transaction))
                {
                    bulkCopy.BatchSize = 100;
                    bulkCopy.DestinationTableName = "dbo.ProductDetails";
                    try
                    {
                        bulkCopy.ColumnMappings.Add("ProductName", "ProductName");
                        bulkCopy.ColumnMappings.Add("SubCategoryId", "SubCategoryId");
                        bulkCopy.ColumnMappings.Add("Quantity", "Quantity");
                        bulkCopy.ColumnMappings.Add("Description", "Description");
                        bulkCopy.ColumnMappings.Add("ImageURL", "ImageURL");
                        bulkCopy.ColumnMappings.Add("PricePerUnit", "PricePerUnit");
                        bulkCopy.ColumnMappings.Add("Unit", "Unit");
                        bulkCopy.ColumnMappings.Add("Status", "Status");
                        bulkCopy.WriteToServer(_list.AsDataTable());
                    }
                    catch (Exception)
                    {
                        transaction.Rollback();
                        connection.Close();
                    }
                }

                transaction.Commit();
            }
        }
    }


}
