using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Antlr.Runtime;
using Unique.EcommGroceryStore.DAL.EntityModel;
using EcommGroceryStore.ViewModels;
using Unique.EcommGroceryStore.Core.Utility;

namespace EcommGroceryStore.Controllers
{
    public class ProductDetailsController : ApiController
    {

        private EcommGroceryDataContext dbContext = new EcommGroceryDataContext();

        // GET api/<controller>
        public IQueryable<ProductDetails> GetProductDetails()
        {
            return dbContext.ProductDetails;
            //try
            //{
            //    using (var dbContext = new EcommGroceryDataContext())
            //    {
            //        return dbContext.ProductDetails;
            //    }
            //}
            //catch (Exception ex)
            //{
            //    throw;
            //}  
        }

        public IQueryable<vmProductDetails> getProductList()
        {
            return dbContext.ProductDetails.Select(x => new vmProductDetails
            {
                ProductId = x.ProductId,
                ProductName = x.ProductName,
                SubCategoryName = dbContext.ProductDetails.Where(xx => xx.SubCategoryId == x.SubCategoryId).Select(y => y.SubCategoryMaster.Name).FirstOrDefault(),
                Quantity = x.Quantity,
                Description = x.Description,
                ImageURL = x.ImageURL,
                PricePerUnit = x.PricePerUnit,
                Unit = x.Unit,
                Status = x.Status
            });
        }


        public IQueryable<vmProductDetails> getVegOnlyList()
        {
            return dbContext.ProductDetails.Where(x=>x.SubCategoryId == 1).Select(x => new vmProductDetails
            {
                ProductId = x.ProductId,
                ProductName = x.ProductName,
                SubCategoryName = dbContext.ProductDetails.Where(xx => xx.SubCategoryId == x.SubCategoryId).Select(y => y.SubCategoryMaster.Name).FirstOrDefault(),
                Quantity = x.Quantity,
                Description = x.Description,
                ImageURL = x.ImageURL,
                PricePerUnit = x.PricePerUnit,
                Unit = x.Unit,
                Status = x.Status
            });
        }

        public IQueryable<vmProductDetails> getFruitsOnlyList()
        {
            return dbContext.ProductDetails.Where(x => x.SubCategoryId == 2).Select(x => new vmProductDetails
            {
                ProductId = x.ProductId,
                ProductName = x.ProductName,
                SubCategoryName = dbContext.ProductDetails.Where(xx => xx.SubCategoryId == x.SubCategoryId).Select(y => y.SubCategoryMaster.Name).FirstOrDefault(),
                Quantity = x.Quantity,
                Description = x.Description,
                ImageURL = x.ImageURL,
                PricePerUnit = x.PricePerUnit,
                Unit = x.Unit,
                Status = x.Status
            });
        }

        public IQueryable<vmProductDetails> GetProductDetails(string ProductName)
        {

            return dbContext.ProductDetails.Where(y=>y.ProductName == ProductName).Select(x => new vmProductDetails
            {
                ProductId = x.ProductId,
                ProductName = x.ProductName, 
                MainCategoryName = x.SubCategoryMaster.MainCategoryMaster.Name,
                SubCategoryName = x.SubCategoryMaster.Name,
                Quantity = x.Quantity,
                Description = x.Description,
                ImageURL = x.ImageURL,
                PricePerUnit = x.PricePerUnit,
                Unit = x.Unit,
                Status = x.Status
            });  
        }


         

        public vmProductDetailsWithSummary getFruitsListWithSummary(string sort, int pagesize, int index, bool all , int min, int max, string querystring)
        {
             vmProductDetailsWithSummary mainquery = new vmProductDetailsWithSummary(); 
             vmProductDetailsSummary  vmsummary = new vmProductDetailsSummary();
             IQueryable<vmProductDetails> query;
             query = (from x in dbContext.ProductDetails
                      where x.SubCategoryMaster.MainCategoryMaster.Name == querystring && ((min != -1 && max != -1) ? (x.PricePerUnit >= min && x.PricePerUnit <= max) : x.PricePerUnit >= 0) 
                      select new vmProductDetails
                      {
                          ProductId = x.ProductId,
                          ProductName = x.ProductName,
                          SubCategoryName = x.SubCategoryMaster.Name,
                          Quantity = x.Quantity,
                          Description = x.Description,
                          ImageURL = x.ImageURL,
                          PricePerUnit = x.PricePerUnit,
                          Unit = x.Unit,
                          Status = x.Status
                      });
            query = query.OrderByField(sort, pagesize, index, all, true);

             
            vmsummary.TotalRecords = query.Count();
            if (query.Count() == 0)
            {
                vmsummary.MaximumPrice = 0;
                vmsummary.MinimumPrice = 0;
            }
            else
            {
                vmsummary.MaximumPrice = query.Select(x => x.PricePerUnit).Max();
                vmsummary.MinimumPrice = query.Select(x => x.PricePerUnit).Min();
            }
            mainquery.vmProductDetailsSummary = vmsummary;
            mainquery.vmProductDetails = query;
            return mainquery;
        }


        public IQueryable<vmProductDetails> getFruitsList(string sort, int pagesize, int index, bool all)
        {
            IQueryable<vmProductDetails> query;
            query = (from x in dbContext.ProductDetails
                     where x.SubCategoryId == 2
                     select new vmProductDetails
                     {
                         ProductId = x.ProductId,
                         ProductName = x.ProductName,
                         SubCategoryName = x.SubCategoryMaster.Name,
                         Quantity = x.Quantity,
                         Description = x.Description,
                         ImageURL = x.ImageURL,
                         PricePerUnit = x.PricePerUnit,
                         Unit = x.Unit,
                         Status = x.Status
                     });

            query = query.OrderByField(sort, pagesize, index, all, true);

            return query;
        }


        public IQueryable<vmProductDetails> getFruitsListold(int startindex, int stopindex)
        {
            IQueryable<vmProductDetails> query = dbContext.ProductDetails.Where(o => o.SubCategoryId == 2).Select(x => new vmProductDetails
            {
                ProductId = x.ProductId,
                ProductName = x.ProductName,
                SubCategoryName = x.SubCategoryMaster.Name,
                Quantity = x.Quantity,
                Description = x.Description,
                ImageURL = x.ImageURL,
                PricePerUnit = x.PricePerUnit,
                Unit = x.Unit,
                Status = x.Status
            });
            //query = query.OrderByField("ProductName", false, startindex, stopindex);
            return query;
        }

        public IQueryable<vmPrdListDependency> getProductDetailsList()
        {
            return dbContext.ProductDetails.Select(x => new vmPrdListDependency
            {
                ProductId = x.ProductId,
                ProductName = x.ProductName,
                SubCategoryId = x.SubCategoryId,
                //  MainCategoryNames = dbContext.MainCategoryMaster.Select(a => new MainCategoryMasterSub { SubCategoryId = a.SubCategoryId, MainCategoryName = a.Name }).ToList(),
                SubCategoryNames = dbContext.SubCategoryMaster.Select(a => new SubCategoryMasterSub { SubCategoryId = a.SubCategoryId, SubCategoryName = a.Name }).ToList(),
                Quantity = x.Quantity,
                Description = x.Description,
                ImageURL = x.ImageURL,
                PricePerUnit = x.PricePerUnit,
                Unit = x.Unit,
                Status = x.Status
            });
        }


        public vmProductListMainSubCategories getProductDetailsList1()
        {
            dbContext.Configuration.ProxyCreationEnabled = false;
            vmProductListMainSubCategories obj = new vmProductListMainSubCategories();

            // obj.prd = dbContext.ProductDetails.ToList();
            obj.listMain = dbContext.MainCategoryMaster.ToList();
            obj.listSub = dbContext.SubCategoryMaster.ToList();

            return obj;
        }


        //public IQueryable<vmProductDetails> getProductList() {
        //    return dbContext.ProductDetails.Select(x => new vmProductDetails
        //    {
        //        ProductId = x.ProductId,
        //        ProductName = x.ProductName,
        //        SubCategoryId = x.SubCategoryId,
        //        SubCategoryId = x.SubCategoryId,
        //        Quantity = x.Quantity,
        //        Description = x.Description,
        //        ImageURL = x.ImageURL,
        //        PricePerUnit = x.PricePerUnit,
        //        Unit = x.Unit,
        //        Status = x.Status
        //    });
        //}

        [ResponseType(typeof(ProductDetails))]
        public IHttpActionResult GetProductDetails(int id)
        {
            //using (EcommGroceryDataContext dbContext = new EcommGroceryDataContext())
            //{
            ProductDetails prd = dbContext.ProductDetails.Find(id);
            if (prd == null)
            {
                return NotFound();
            }
            return Ok(prd);
            //}
        }

        [ResponseType(typeof(TransactionDetails))]
        public IHttpActionResult AddOrder(int CartId, string userName)
        {

            // CartDetail cartDetail = dbContext.CartDetail.Single(x => x.CartId == CartId); 
            TransactionDetails transactionDetails = new TransactionDetails();
            transactionDetails.CartId = CartId;
            transactionDetails.UserId = dbContext.Users.Single(x => x.UserName == userName).UserId;
            transactionDetails.IsConfirm = false;
            transactionDetails.TransactionDate = DateTime.Now;
            dbContext.TransactionDetails.Add(transactionDetails);
            try
            {
                dbContext.SaveChanges();
            }
            catch (Exception ex)
            {
            }

            return Ok(transactionDetails);
        }


        // POST api/ProductDetails
        [ResponseType(typeof(ProductDetails))]
        public IHttpActionResult PostProductDetails(ProductDetails productdetails)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            //using (EcommGroceryDataContext dbContext = new EcommGroceryDataContext())
            //{
            dbContext.ProductDetails.Add(productdetails);
            dbContext.SaveChanges();
            //} 

            return CreatedAtRoute("ActionApi", new { id = productdetails.ProductId }, productdetails);
        }
         
        // PUT api/<controller>/5
        public IHttpActionResult PutProductDetails(int id, ProductDetails productdetails)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != productdetails.ProductId)
            {
                return BadRequest();
            }


            //using (EcommGroceryDataContext dbContext = new EcommGroceryDataContext())
            //{
            dbContext.Entry(productdetails).State = EntityState.Modified;

            try
            {
                dbContext.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!(dbContext.ProductDetails.Count(e => e.ProductId == id) > 0))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            //} 

            return StatusCode(HttpStatusCode.NoContent);
        }

        // DELETE api/ProductDetails/5
        [ResponseType(typeof(ProductDetails))]
        public IHttpActionResult DeleteProductDetails(int id)
        {
            //using (EcommGroceryDataContext dbContext = new EcommGroceryDataContext())
            //{
            ProductDetails productdetails = dbContext.ProductDetails.Find(id);
            if (productdetails == null)
            {
                return NotFound();
            }

            dbContext.ProductDetails.Remove(productdetails);
            dbContext.SaveChanges();

            return Ok(productdetails);
            //}
        }  


        //[ResponseType(typeof(Cart))]
        //public IHttpActionResult PostCart(Cart cart)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }
             
        //    dbContext.Cart.Add(cart);
        //    dbContext.SaveChanges();  
        //    return CreatedAtRoute("DefaultApi", new { id = cart.CartId}, cart);
        //}


        //[ResponseType(typeof(CartDetail))]
        //public IHttpActionResult PostCartDetail(CartDetail cartDetail)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    dbContext.CartDetail.Add(cartDetail);
        //    dbContext.SaveChanges(); 

        //    return CreatedAtRoute("ProductDetailsApi", new { id = cartDetail.CartDetailId }, cartDetail);
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                dbContext.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}