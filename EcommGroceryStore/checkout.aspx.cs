using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommGroceryStore.Controllers;

namespace EcommGroceryStore
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["cartid"] != null)
            {
                if (!string.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
                {
                    var value = Request.Cookies["cartid"].Value;
                    ProductDetailsController prd = new ProductDetailsController();
                    prd.AddOrder(Convert.ToInt16(value), HttpContext.Current.User.Identity.Name);
                    var httpCookie = Response.Cookies["cartid"];
                    if (httpCookie != null)
                        httpCookie.Expires = DateTime.Now.AddDays(-1);
                }
            }
        }
    }
}