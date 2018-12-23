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
    public class CartRepository
    {
        private EcommGroceryDataContext _db = new EcommGroceryDataContext();
        public static List<vmCartDetail> GetCartDetailsList(int id)
        {
            using (EcommGroceryDataContext db = new EcommGroceryDataContext())
            {
                List<vmCartDetail> listVmCartDetails =
                    db.CartDetail.Where(x => x.CartId == id).Select(x => new vmCartDetail
                    {
                        CartDetailId = x.CartDetailId,
                        CartId = x.CartId,
                        ProductId = x.ProductId,
                        Amount = x.Amount,
                        Discount = x.Discount,
                        NetAmount = x.NetAmount,
                        Timestamp = x.Timestamp,
                        IsActive = x.IsActive,
                        Quantity = x.Quantity,
                        PricePerUnit = x.PricePerUnit,
                        Unit = x.Unit,
                        productDetail =
                            db.ProductDetails.Where(xx => xx.ProductId == x.ProductId).Select(y => new vmProductDetails
                            {
                                ProductId = y.ProductId,
                                ProductName = y.ProductName,
                                SubCategoryName = y.SubCategoryMaster.Name,
                                Quantity = y.Quantity,
                                Description = y.Description,
                                ImageURL = y.ImageURL,
                                PricePerUnit = y.PricePerUnit,
                                Unit = y.Unit,
                                Status = y.Status
                            }).FirstOrDefault()
                    }).ToList();
                return listVmCartDetails;
            }
        }

        
    }
}