 
function ProductBox(productName, imageURL, description, quantity, pricePerUnit, unit) {

    var val = "<div class=\"item col-lg-3 col-md-4 col-sm-4 respl-item\">"
              + "     <div class=\"item-inner\">"
              + "         <div class=\"w-image-box\">"
              + "             <div class=\"item-image\">"
              + " <a href=\"/Details\\" + productName + "\" title=\"" + productName + "\" class=\"product-image\">"
              + "<img id=\"product-collection-image-77\" src=\"../" + imageURL + "\" alt=\"" + productName + "\" /> "
              + " </a> </div> "
              + "  <div class=\"sale-item\">"
              + "      <span class=\"txt-label\">Sale</span>"
              + "  </div>"
              + "  </div>"
              + "  <div class=\"item-info\">"
              + "      <div class=\"item-review\">"
              + "           <p class=\"no-rating\"><a title=\"Write Your Review\" href=\"" + imageURL + ">Write Your Review</a></p>"
              + "       </div> "
              + "       <div class=\"item-title\">"
              + "           <a href=\"fruits/awala.html\""
              + "           title=\"" + productName + "\">" + productName + "</a>"
              + "     </div>"
              + "    <div class=\"item-price\"> "
              + "        <div class=\"price-box\">"
              + "            <span class=\"regular-price\"> "
              + "               <span class=\"price\">₹" + pricePerUnit + "</span>/" + unit + " gm"
              + "            </span> "
              + "       </div>"
              + "    </div>"
              + "   </div> "
              + "   <button data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Cart\" type=\"button\" class=\"btn-pd btn-cart\" onclick=\"location.href=\"" + productName + "\">"
              + "       <span>"
              + "           <span>Add to Cart</span>"
              + "       </span>"
              + "   </button> "
              + "   <a style=\"display:none;\" href=\"fruits/awala.html\"></a>"
              + "   <a data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Wishlist\" href=\"../wishlist/index/add/product/77/form_key/10mZJsjNieAFmLSZ/index.html\" class=\"btn-pd item-wishlist\">"
              + "       <span>Add to Wishlist</span>"
              + "   </a> "
              + "   <a data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Compare\" href=\"../catalog/product_compare/add/product/77/uenc/aHR0cDovL3d3dy5vbmxpbmVzYWJqaXdhbGEuY29tL2ZydWl/form_key/10mZJsjNieAFmLSZ/index-144.html\" class=\"btn-pd item-compare\">"
              + "       <span>Add to Compare</span>"
              + "   </a> "
              + "   </div>"
              + "   </div>"
    return val;


}

function ContentBox(productName, imageURL, description, quantity, pricePerUnit, unit) {

    var val = "<div class=\"bs-content\">"
        + "<a href=\"" + productName + ".html\" title=\"" + description + "\">"
        + "" + productName + ""
        + "</a>"
        + "</div>"
        + "<div class=\"bs-price\">"
        + "<div class=\"sale-price\">"
        + "<div class=\"price-box\">"
        + "<span class=\"regular-price\">"
        + "<span class=\"price\">" + pricePerUnit + "</span>" + unit + " gm"
        + "</span>"
        + "</div>"
        + "</div>"
        + "</div>"
        + "<div class=\"bs-btn-addtocart\">"
        + "<button type=\"button\" title=\"Add to Cart\" class=\"button btn-cart\" onclick=\"location.href=\"" + productName + "\">"
        + "<span><span>Add to Cart</span></span>"
        + "</button>"
        + "</div>"
        + "</div>"
        + "</div></div></div>";
    return val;
}


function LoopAndGenerate(data, querystring) {
    var totalrecords = 0;
    jQuery("div.products-grid.row").empty();
    jQuery.each(data, function (key, val) {
        var val2 = ProductBox(val.ProductName, val.ImageURL, val.Description, val.Quantity, val.PricePerUnit, val.Unit);
        totalrecords++;
        jQuery("div.products-grid.row").append(val2);
    });
}
function getProducts(sort, pagesize, index, all, min, max, querystring) {
  //  console.log('i, getFruits, got called parameters passed are ' + sort + ' ' + pagesize + ' ' + index + ' ' + all + ' ' + min + ' ' + max);
    var startindex = 0;
    var endindex = 0;
    if (index == undefined) {
        startindex = 0;
        endindex = 8;
    }
    else {
        startindex = (index - 1) * 8;
        endindex = (index) * 8;;
    }
    return jQuery.getJSON("/api/ProductDetails/getFruitsListWithSummary?sort=" + sort + "&pagesize=" + pagesize + "&index=" + index + "&all=" + all + "&min=" + min + "&max=" + max  + "&querystring=" + querystring + "",
       function (data) {
       });
}


function getProductDetail(querystring) {
    return jQuery.getJSON("/api/ProductDetails/GetProductDetails?ProductName=" + querystring+ "",
   function (data) {
   });
}

 