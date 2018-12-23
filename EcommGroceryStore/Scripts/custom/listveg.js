//alert('this should work');


(function () {
    //alert('this shoudl also work');

    function vegBox(productName, imageURL, description, quantity, pricePerUnit) {

        var val = "<div class=\"item col-lg-3 col-md-4 col-sm-4 respl-item\">"
                  + "     <div class=\"item-inner\">"
                  + "         <div class=\"w-image-box\">"
                  + "             <div class=\"item-image\">"
                  + " <a href=\"" + imageURL + "\" title=\"" + productName + "\" class=\"product-image\">"
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
                  + "           title=\"Awala\">Awala</a>"
                  + "     </div>"
                  + "    <div class=\"item-price\"> "
                  + "        <div class=\"price-box\">"
                  + "            <span class=\"regular-price\"> "
                  + "               <span class=\"price\">₹20.00</span>/250 gm"
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
     
    function getFruits() {
        jQuery.getJSON("api/ProductDetails/getVegList",
            function (data) {
                jQuery.each(data, function (key, val) {
                    var val2 = fruitBox(val.ProductName, val.ImageURL, val.Description, val.Quantity, val.PricePerUnit, val.Unit);
                    //                    alert(val2);
                   // console.log(val2);
                    //<div class="products-grid row">
                    jQuery("div.products-grid.row").append(val2);
                });
            });
    }
    getFruits();
})();