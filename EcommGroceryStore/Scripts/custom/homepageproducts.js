//first step call the webservice and get data
function getcarouselproducts() {
    return $.getJSON("/api/ProductDetails/getProductList",
        function (data) {
        });
}

//use the data to generate mark up 

function getHomepageproductsAndGenerateHtml(data) {
    var totalrecords = 0;
    var totaloutput = "";
    $.each(data, function (key, val) {

        var val2 = generateMarkup(val.ProductName, val.ImageURL, val.Description, val.Quantity, val.PricePerUnit, val.Unit);
        totalrecords++;
        totaloutput += val2;
        //console.log(totalrecords + ' ' + (totalrecords % 4));
        //console.log(totaloutput);

        if (totalrecords % 4 === 0 && totalrecords !== 0) {
            //console.log(totalrecords + ' ' + (totalrecords % 4));
            totaloutput = "<div class=\"item-left-products item\">" + totaloutput + "</div>";
            $("div.slider-left-product.basic-product.owl-carousel.owl-theme").append(totaloutput);
            //console.log(totaloutput);
            val2 = "";
            totaloutput = "";
        }
    });
}

// use this function to generate the markup
function generateMarkup(productName, imageURL, description, quantity, pricePerUnit, unit) {

    var val = "   <div class=\"bs-item cf\">"
        + "    <!-- Begin bs-item-inner -->"
        + "    <div class=\"bs-item-inner\">"
        + ""
        + "        <div class=\"bs-image\">"
        + "	        <a href=\"\\Details\\" + productName + "\" title=\"" + productName + "\">"
        + "		        <img src=\"\\" + imageURL + "\" title=\"Coconut water\" alt=\"" + productName + "\">"
        + "	        </a>"
        + "        </div>"
        + "        <!-- Begin bs-content -->"
        + "        <div class=\"bs-content\">"
        + "	        <div class=\"bs-title\">"
        + "		        <a href=\"\\Details\\" + productName + "\" title=\"" + productName + "\">" + productName + "</a>"
        + "	        </div>"
        + "	        <div class=\"bs-price\">"
        + "		        <div class=\"sale-price\">"
        + "			        <div class=\"price-box\">"
        + "				        <span class=\"regular-price\">"
        + "					        <span class=\"price\">₹" + pricePerUnit + "</span>/" + unit + " gm</span>"
        + "			        </div>"
        + "		        </div>"
        + "	        </div>"
        + "	        <div class=\"bs-btn-addtocart\">"
        + "             <a data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Cart\" href=\"\\Details\\" + productName + "\" class=\"btn-pd btn-cart\">Add to Cart</a> "
        + "        </div>"
        + "        </div>"
        + "        <!-- End bs-content -->"
        + "        </div>"
        + "        <!-- End bs-item-inner -->"
        + "     </div>";

    return val;
}

//first step call the webservice and get data
function getcarouselcat_29products() {
    return $.getJSON("/api/ProductDetails/getVegOnlyList",
        function (data) {
        });
}

//use the data to generate mark up 

function getHomepagecat_29productsAndGenerateHtml(data) {

    $.each(data, function (key, val) {
        var val2 = generatecat_29Markup(val.ProductName, val.ImageURL, val.Description, val.Quantity, val.PricePerUnit, val.Unit);
        $("div.ltabs-items-container.slider-cat-29").append(val2);
    });
}

// use this function to generate the markup
function generatecat_29Markup(productName, imageURL, description, quantity, pricePerUnit, unit) {

    var val = "<div class=\"item item-supercat respl-item\">"
        + "<div class=\"item-inner\">"
        + "     <div class=\"w-image-box\">"
        + "         <span class=\"hover-background\"></span>"
        + "         <div class=\"item-image\">"
        + "             <a href=\"\\Details\\" + productName + "\" class=\"product-image rspl-image\"> "
        + "                 <img src=\"\\" + imageURL + "\" alt=\"" + productName + "\" />"
        + "             </a>"
        + "         </div> "
        + "         <div class=\"sale-item\">"
        + "             <span>Sale</span>"
        + "         </div> "
        + "     </div> "
        + "     <div class=\"item-info\"> "
        + "         <div class=\"item-title\">"
        + "             <a href=\"\\Details\\" + productName + "\" title=\"" + productName + "\">"
        + "               " + productName + ""
        + "             </a>"
        + "         </div> "
        + "         <div class=\"item-price\">"
        + "             <div class=\"sale-price\"> "
        + "                 <div class=\"price-box\">"
        + "                     <span class=\"regular-price\"> "
        + "                         <span class=\"price\">₹" + pricePerUnit + "</span>/" + unit + " gm"
        + "                     </span> "
        + "                 </div>"
        + "             </div>"
        + "         </div> "
        + "     </div> "
        + "     <a class=\"product-image\" style=\"display:none;\" href=\"\\Details\\" + productName + "\"> </a><!--LINK FOR QUICKVIEW-->  "
        + "     <a data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Cart\" href=\"\\Details\\" + productName + "\" class=\"btn-pd btn-cart\">Add to Cart</a> "
        + "     <a data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Wishlist\" href=\"\\Details\\" + productName + "\" class=\"btn-pd item-wishlist\">Add to Wishlist</a> "
        + " </div>"
        + " </div>"
        + " </div>";

    return val;
}


//first step call the webservice and get data
//get subcategory
function getcarouselsubcategory(mainCategoryName) {
    return $.getJSON("/api/ProductDetails/GetAllSubCategory", { mainCategoryName: mainCategoryName },
        function (data) {
        });
}


//first step call the webservice and get data
function getcarouselcat_30products(mainCategoryName) {
    return $.getJSON("/api/ProductDetails/GetAllItemsFromMainCategory", { mainCategoryName: mainCategoryName },
        function (data) {
        });
}

function GetAllItemsFromMainCategoryAndSubCategory(mainCategoryName, subCategoryName) {
    return $.getJSON("/api/ProductDetails/GetAllItemsFromMainCategoryAndSubCategory", { mainCategoryName: mainCategoryName, subCategoryName: subCategoryName },
        function (data) {
        });
}

//use the data to generate mark up 

//use the data to generate mark up for sub category
function getHomepagesubCategoryAndGenerateHtml(data, divtag) {
    $.each(data, function (key, val) {
        var val2 = generatesubCategoryMarkup(val.Name, val.ImageURL, val.SubCategoryId);
        $(divtag).append(val2);
    });
}
//use the data to generate mark up for sub category
function generatesubCategoryMarkup(productName, imageURL, subCategoryId) {

    var val = "<div class=\"item item-supercat respl-item\">"
        + "<div class=\"item-inner\">"
        + "     <div class=\"w-image-box\">"
        + "         <span class=\"hover-background\"></span>"
        + "         <div class=\"item-image\">"
        + "             <a href=\"\\products\\" + subCategoryId + "\" class=\"product-image rspl-image\"> "
        + "                 <img src=\"\\" + imageURL + "\" alt=\"" + productName + "\" />"
        + "             </a>"
        + "         </div> "
        + "     </div> "
        + "     <div class=\"item-info\"> "
        + "         <div class=\"item-title\" style=\"text-align:center;font-size: 14px;\">"
        + "             <a href=\"\\products\\" + subCategoryId + "\" title=\"" + productName + "\">"
        + "               " + productName + ""
        + "             </a>"
        + "         </div> "
        + "     </div> "
        + "     <a class=\"product-image\" style=\"display:none;\" href=\"\\products\\" + subCategoryId + "\"> </a>"
        + " </div>"
        + " </div>"
        + " </div>";

    return val;
}


function getHomepagecat_30productsAndGenerateHtml(data, divtag) {

    $.each(data, function (key, val) {
        var val2 = generatecat_30Markup(val.ProductName, val.ImageURL, val.Description, val.Quantity, val.PricePerUnit, val.Unit);
        $(divtag).append(val2);
    });
}

// use this function to generate the markup
function generatecat_30Markup(productName, imageURL, description, quantity, pricePerUnit, unit) {

    var val = "<div class=\"item item-supercat respl-item\">"
        + "<div class=\"item-inner\">"
        + "     <div class=\"w-image-box\">"
        + "         <span class=\"hover-background\"></span>"
        + "         <div class=\"item-image\">"
        + "             <a href=\"\\Details\\" + productName + "\" class=\"product-image rspl-image\"> "
        + "                 <img src=\"\\" + imageURL + "\" alt=\"" + productName + "\" />"
        + "             </a>"
        + "         </div> "
        + "         <div class=\"sale-item\">"
        + "             <span>Sale</span>"
        + "         </div> "
        + "     </div> "
        + "     <div class=\"item-info\"> "
        + "         <div class=\"item-title\">"
        + "             <a href=\"\\Details\\" + productName + "\" title=\"" + productName + "\">"
        + "               " + productName + ""
        + "             </a>"
        + "         </div> "
        + "         <div class=\"item-price\">"
        + "             <div class=\"sale-price\"> "
        + "                 <div class=\"price-box\">"
        + "                     <span class=\"regular-price\"> "
        + "                         <span class=\"price\">₹" + pricePerUnit + "</span>/" + unit + " gm"
        + "                     </span> "
        + "                 </div>"
        + "             </div>"
        + "         </div> "
        + "     </div> "
        + "     <a class=\"product-image\" style=\"display:none;\" href=\"\\Details\\" + productName + "\"> </a><!--LINK FOR QUICKVIEW-->  "
        + "     <a data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Cart\" href=\"\\Details\\" + productName + "\" class=\"btn-pd btn-cart\">Add to Cart</a> "
        + "     <a data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Wishlist\" href=\"wishlist/index/add/product/29/form_key/P8pJx2VEoRAa8IH3/index.html\" class=\"btn-pd item-wishlist\">Add to Wishlist</a> "
        + " </div>"
        + " </div>"
        + " </div>";

    return val;
}




//first step call the webservice and get data
function getcarouselcat_8products() {
    return $.getJSON("/api/ProductDetails/getFruitsOnlyList",
        function (data) {
        });
}

//use the data to generate mark up 

function getHomepagecat_8productsAndGenerateHtml(data) {

    $.each(data, function (key, val) {
        var val2 = generatecat_8Markup(val.ProductName, val.ImageURL, val.Description, val.Quantity, val.PricePerUnit, val.Unit);
        $("div.ltabs-items-container.slider-cat-8").append(val2);
    });
}

// use this function to generate the markup
function generatecat_8Markup(productName, imageURL, description, quantity, pricePerUnit, unit) {

    var val = "<div class=\"item item-supercat respl-item\">"
        + "<div class=\"item-inner\">"
        + "     <div class=\"w-image-box\">"
        + "         <span class=\"hover-background\"></span>"
        + "         <div class=\"item-image\">"
        + "             <a href=\"\\Details\\" + productName + "\" class=\"product-image rspl-image\"> "
        + "                 <img src=\"\\" + imageURL + "\" alt=\"" + productName + "\" />"
        + "             </a>"
        + "         </div> "
        + "         <div class=\"sale-item\">"
        + "             <span>Sale</span>"
        + "         </div> "
        + "     </div> "
        + "     <div class=\"item-info\"> "
        + "         <div class=\"item-title\">"
        + "             <a href=\"\\Details\\" + productName + "\" title=\"" + productName + "\">"
        + "               " + productName + ""
        + "             </a>"
        + "         </div> "
        + "         <div class=\"item-price\">"
        + "             <div class=\"sale-price\"> "
        + "                 <div class=\"price-box\">"
        + "                     <span class=\"regular-price\"> "
        + "                         <span class=\"price\">₹" + pricePerUnit + "</span>/" + unit + " gm"
        + "                     </span> "
        + "                 </div>"
        + "             </div>"
        + "         </div> "
        + "     </div> "
        + "     <a class=\"product-image\" style=\"display:none;\" href=\"\\Details\\" + productName + "\"> </a><!--LINK FOR QUICKVIEW-->  "
        + "     <a data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Cart\" href=\"\\Details\\" + productName + "\" class=\"btn-pd btn-cart\">Add to Cart</a> "
        + "     <a data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Wishlist\" href=\"wishlist/index/add/product/29/form_key/P8pJx2VEoRAa8IH3/index.html\" class=\"btn-pd item-wishlist\">Add to Wishlist</a> "
        + " </div>"
        + " </div>"
        + " </div>";

    return val;
}