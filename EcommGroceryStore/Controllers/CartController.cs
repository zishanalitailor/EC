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
using Unique.EcommGroceryStore.DAL.EntityModel;
using EcommGroceryStore.ViewModels;
 
namespace EcommGroceryStore.Controllers
{
    public class CartController : ApiController
    {
        private EcommGroceryDataContext db = new EcommGroceryDataContext();

        // GET api/Cart
        public IQueryable<Cart> GetCart()
        {
            return db.Cart;
        }

        // GET api/Cart/5
        [ResponseType(typeof(Cart))]
        public IHttpActionResult GetCart(int id)
        {
            Cart cart = db.Cart.Find(id);
            if (cart == null)
            {
                return NotFound();
            } 
            return Ok(cart);
        }
         
        [ResponseType(typeof(vmCartDetailsAll))]
        public IHttpActionResult GetCartDetail(int id)
        {
            vmCartDetailsAll objvmCartDetailsAll =  DoCartDetailsGetProcess(id);
            return Ok(objvmCartDetailsAll);
        }

        private vmCartDetailsAll DoCartDetailsGetProcess(int id)
        {
            List<vmCartDetail> vmCartdetails = CartRepository.GetCartDetailsList(id);
            vmCartDetailSummary vmCartDetailsummary = new vmCartDetailSummary();
            decimal tmpvalue;
            decimal? result = decimal.TryParse((string)vmCartdetails.Sum(x => x.NetAmount).ToString(), out tmpvalue) ?
                              tmpvalue : (decimal?)null;

            vmCartDetailsummary.TotalAmount = tmpvalue;
            vmCartDetailsummary.TotalItems = vmCartdetails.Count();

            vmCartDetailsAll objvmCartDetailsAll = new vmCartDetailsAll();
            objvmCartDetailsAll.objvmCartDetails = vmCartdetails;
            objvmCartDetailsAll.objvmCartDetailSummary = vmCartDetailsummary;
            return objvmCartDetailsAll;  
        }

        public IHttpActionResult GetMyHistoryResult(int userid)
        {
            var transactionList = db.TransactionDetails.Where(x => x.UserId == userid)
                .Select(
                    x => new
                    {
                        tid = x.TransactionId  ,
                        cartid = x.CartId
                    })
                .ToList();

            List<vmCartDetailsAll> objvmCartDetailsAll = new List<vmCartDetailsAll>();

            for (int i = 0; i < transactionList.Count(); i++)
            {
                //GetCartDetail(transactionList[i].cartid);
                objvmCartDetailsAll.Add(DoCartDetailsGetProcess(transactionList[i].cartid)); 
            } 
            
            return Ok(objvmCartDetailsAll);
        }

        // PUT api/Cart/5
        public IHttpActionResult PutCart(int id, Cart cart)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != cart.CartId)
            {
                return BadRequest();
            }

            db.Entry(cart).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CartExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST api/Cart
        [ResponseType(typeof(Cart))]
        [HttpPost]
        public IHttpActionResult PostCart(Cart cart)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);//"error";//
            }

            cart.DateCreated = System.DateTime.Now;
            db.Cart.Add(cart);
            db.SaveChanges();
            return CreatedAtRoute("CartApi", new { id = cart.CartId }, cart);
        }


        [ResponseType(typeof(CartDetail))]
        [HttpPost]
        public IHttpActionResult PostCartDetail(CartDetail cartdetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);//"error";//
            } 
            ProductDetails pd = db.ProductDetails.Where(x => x.ProductId == cartdetail.ProductId).Single();

            CartDetail cd = db.CartDetail.Where(x => x.ProductId == cartdetail.ProductId && x.CartId == cartdetail.CartId).FirstOrDefault();
            if (cd != null)
            {
                cartdetail.Amount = (cd.Amount.HasValue ? cd.Amount : 0) + Convert.ToDecimal(pd.PricePerUnit) * cartdetail.Quantity;
                cartdetail.NetAmount = (cd.NetAmount.HasValue ? cd.NetAmount : 0) + (Convert.ToDecimal(pd.PricePerUnit) * cartdetail.Quantity) - (cartdetail.Discount.HasValue ? cartdetail.Discount : 0);
            }
            else
            {
                cartdetail.Amount = Convert.ToDecimal(pd.PricePerUnit) * cartdetail.Quantity;
                cartdetail.NetAmount = (Convert.ToDecimal(pd.PricePerUnit) * cartdetail.Quantity) - (cartdetail.Discount.HasValue ? cartdetail.Discount : 0);
            }
            cartdetail.Timestamp = System.DateTime.Now;
              
            bool count = db.CartDetail.Where(x => x.ProductId == cartdetail.ProductId && x.CartId == cartdetail.CartId).Any();
            if (count)
            {   
                var quantitysupplied = cd.Quantity.HasValue ? cd.Quantity : 0;
                cartdetail.CartDetailId = cd.CartDetailId;
                cartdetail.Quantity = (cartdetail.Quantity.HasValue ? cartdetail.Quantity : 0) + Convert.ToInt16(quantitysupplied);


                db.Entry(cd).State = EntityState.Detached; 
                db.Entry(cartdetail).State = EntityState.Modified;

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    throw;
                } 
                // cartdetail.CartDetailId 
            }
            else
            {
                
                db.CartDetail.Add(cartdetail);
                db.SaveChanges();
            }
            var totalamount = db.CartDetail.Where(x => x.CartDetailId == cartdetail.CartDetailId).Sum(x => x.NetAmount);
            return CreatedAtRoute("CartApi", new { id = cartdetail.CartDetailId + "_" + totalamount }, cartdetail);
        }


        [ResponseType(typeof(List<CartDetail>))]
        [HttpPost]
        public IHttpActionResult PostListCartDetail(List<CartDetail> cartdetail)
        {
            for (int i = 0; i < cartdetail.Count(); i++)
            { 
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);//"error";//
                }

                var productId = cartdetail[i].ProductId;
                ProductDetails pd = db.ProductDetails.Where(x => x.ProductId == productId).Single();
                 
                var cartId = cartdetail[i].CartId;
                CartDetail cd = db.CartDetail.Where(x => x.ProductId == productId && x.CartId == cartId).FirstOrDefault();
                var quantity = cartdetail[i].Quantity;
                var discount = cartdetail[i].Discount;

                cd.Quantity = cartdetail[i].Quantity;
                cd.Amount = Convert.ToDecimal(pd.PricePerUnit) * quantity;
                cd.NetAmount = (Convert.ToDecimal(pd.PricePerUnit) * quantity) - (discount.HasValue ? discount : 0);
                cd.Timestamp = System.DateTime.Now;

                db.Entry(cd).State = EntityState.Modified;

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    throw;
                } 
            }
            return CreatedAtRoute("CartApi", new { id =  0 }, cartdetail);
        }

        public void Posting([FromBody]string name)
        {
        }


        [ResponseType(typeof(string))]
        [HttpPost]
        public IHttpActionResult GetNewPostMethod(string cart)
        { 
            return CreatedAtRoute("CartApi", new { id = 1 }, cart);  
        }

        // DELETE api/Cart/5
        [ResponseType(typeof(Cart))]
        public IHttpActionResult DeleteCart(int id)
        {
            Cart cart = db.Cart.Find(id);
            if (cart == null)
            {
                return NotFound();
            } 
            db.Cart.Remove(cart);
            db.SaveChanges(); 
            return Ok(cart);
        } 
        [ResponseType(typeof(CartDetail))]
        public IHttpActionResult DeleteItem(int cartDetailId, int productId)
        {
            CartDetail cartDetail = db.CartDetail.Where(x => x.CartDetailId == cartDetailId && x.ProductId == productId).FirstOrDefault();
            if (cartDetail == null)
            {
                return NotFound();
            }

            db.CartDetail.Remove(cartDetail);
            db.SaveChanges(); 
            return Ok(cartDetail);
        }

        [ResponseType(typeof(CartDetail))]
        public IHttpActionResult DeleteEverything(int cartId)
        {
            List<CartDetail> cartDetail = db.CartDetail.Where(x => x.CartId == cartId).ToList();
            if (cartDetail == null)
            {
                return NotFound();
            }

            for (int i = 0; i < cartDetail.Count(); i++)
            {
                db.CartDetail.Remove(cartDetail[i]);
                db.SaveChanges();                
            }  
            return Ok(cartDetail);
        }
         
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CartExists(int id)
        {
            return db.Cart.Count(e => e.CartId == id) > 0;
        }
    }
}