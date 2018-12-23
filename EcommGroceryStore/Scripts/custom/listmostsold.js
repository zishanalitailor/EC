(function () {


    function ImageBox(productName, imageURL, description) {
        var val = " <div class=\"bs-item cf\"> <div class=\"bs-item-inner\">  <div class=\"bs-image\">"
            + " <a href=\"" + productName + ".html\" title=\"" + description + "\">"
            + " <img src=\"" + imageURL + "\" title=\"" + description + "\" alt=\"" + description + "\">"
            + "</a></div>";
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
            + "<span class=\"price\">" + pricePerUnit + "</span> / " + unit + " gm"
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

    function getProducts() {
        jQuery.getJSON("api/ProductDetails/getProductList",
            function (data) {
                jQuery.each(data, function (key, val) {
                    var val1 = ImageBox(val.ProductName, val.ImageURL, val.Description);
                    var val2 = ContentBox(val.ProductName, val.ImageURL, val.Description, val.Quantity, val.PricePerUnit, val.Unit );
                    if (key === 0) {
                        jQuery();
                        jQuery("div.slider-left-product.basic-product").append("<div class=\"item-left-products item\">");
                    }
                    jQuery("div.slider-left-product.basic-product").append(val1 + val2);
                });
            });
        jQuery("div.slider-left-product.basic-product").append("</div>");
        var owl_left = jQuery(".basic-product");
        owl_left.owlCarousel({
            itemsCustom: [
                [0, 1],
                [480, 1],
                [768, 2],
                [992, 1],
                [1200, 1]
            ],

            slideSpeed: 300,
            stopOnHover: true,
            paginationSpeed: 400,
            autoPlay: false,
            pagination: false,
        });


        jQuery(".nav-left-product .next-bs").click(function () {
            owl_left.trigger('owl.next');
        });
        jQuery(".nav-left-product .prev-bs").click(function () {
            owl_left.trigger('owl.prev');
        });
    }

    getProducts();
   /* $('.owl-carousel').owlCarousel();*/


})();