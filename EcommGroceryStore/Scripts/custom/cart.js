function generateCart(cart) {
      

    if (document.getElementById('cartid').value == '') {
        var APIRoute = "/api/Cart/PostCart";
        //var cart = { ip: ip, IsActive: IsActive };
        $.ajax({
            url: APIRoute,
            type: 'POST',
            contentType: "application/json",
            //contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: JSON.stringify(cart),
            success: function (data, textStatus, xhr) {
                document.getElementById('cartid').value = data.CartId;
                var product = {
                    CartId: $("#cartid").val(),
                    ProductId: $("#ProductId").text(),
                    Quantity: $("#qty").val()

                }
                AddProductToCart(product);
            },
            error: function (xhr, textStatus, errorThrown) {
                console.log('Cart could not be generated and product could not be added to cart');
            }
        });
    }
}




function generateCartOnly(cart) {

    if (document.getElementById('cartid').value == '') {
        var APIRoute = "/api/Cart/PostCart";
        //var cart = { ip: ip, IsActive: IsActive };
        $.ajax({
            url: APIRoute,
            type: 'POST',
            contentType: "application/json",
            //contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: JSON.stringify(cart),
            success: function (data, textStatus, xhr) {
                console.log(data);
                document.getElementById('cartid').value = data.CartId;
            },
            error: function (xhr, textStatus, errorThrown) {
                console.log('Cart could not be generated');
            }
        });
    }
}


function AddProductToCart(cartdetail) {
    if (document.getElementById('cartid').value != '') {
        cartdetail.CartId = document.getElementById('cartid').value;
        var APIRoute = "/api/Cart/PostCartDetail";
        $.ajax({
            url: APIRoute,
            type: 'POST',
            contentType: "application/json",
            data: JSON.stringify(cartdetail),
            success: function (data, textStatus, xhr) {
                console.log(data);
                console.log(data.CartDetailId);
                AddUpdateCartLabel();
                //document.getElementById('CartDetailId').value = data.CartDetailId;
            },
            error: function (xhr, textStatus, errorThrown) {
                console.log('product could not be added to cart');
            }
        });
    }
}
 


function AddProductListToCart(cartdetail) {
    if (document.getElementById('cartid').value != '') {
        cartdetail.CartId = document.getElementById('cartid').value;
        var APIRoute = "/api/Cart/PostListCartDetail";
        $.ajax({
            url: APIRoute,
            type: 'POST',
            contentType: "application/json",
            data: JSON.stringify(cartdetail),
            success: function (data, textStatus, xhr) {  
                AddUpdateCartLabel(); 
            },
            error: function (xhr, textStatus, errorThrown) {
                console.log('product could not be added to cart');
            }
        });
    }
}


function AddUpdateCartLabel() {
    if (document.getElementById('cartid').value != '') {
        var CartId = document.getElementById('cartid').value;
        var APIRoute = "/api/Cart/GetCartDetail";
        $.ajax({
            url: APIRoute,
            type: 'GET',
            contentType: "application/json",
            data: { id: CartId },
            success: function (data, textStatus, xhr) {
                //console.log(data);
                $('.item-cart').text(data.objvmCartDetailSummary.TotalAmount + '(' + data.objvmCartDetailSummary.TotalItems + ')');
                $("#block-inner > ol").remove();
                $("#block-inner > div > ol").remove();

                if ($("#checkout_grandtotal").length) {
                    $("#checkout_grandtotal").text(data.objvmCartDetailSummary.TotalAmount);
                    $("#checkout_subtotal").text(data.objvmCartDetailSummary.TotalAmount);
                }
                generateHiddenCart(data.objvmCartDetails);
                console.log('from details page webservice call ended ');
            },
            error: function (xhr, textStatus, errorThrown) {
                console.log('CartList Could not be retrieved');
            }
        });
    }
}

function generateHiddenCart(data) {
    if ($('#shopping-cart-table').length) {
        $('#shopping-cart-table > tbody').remove()
        $('#shopping-cart-table').append("<tbody></tbody>");
    }
    for (var i = 0; i < data.length; i++) {
        var res = "<ol id=\"minicart-sidebar\" class=\"mini-products-list\">" +
    "<li class=\"item last odd\">" +
            "<a href=\"" + data[i].productDetail.ProductName + "\" title=\"" + data[i].productDetail.ProductName + "\" class=\"product-image\">" +
                  "<img src=\"/" + data[i].productDetail.ImageURL + "\" alt=\"" + data[i].productDetail.ProductName + "\">" +
            "</a> " +
    "<div class=\"detail-item\">" +
     "<div class=\"product-details\">" +
    	"<a href=\"" + data[i].productDetail.ProductName + "\"  title=\"Remove This Item\" onclick=\"return confirm('Are you sure you would like to remove this item from the shopping cart?');\" class=\"btn-remove\"><span></span> </a>     " +

        "<a href=\"Edit/" + data[i].productDetail.ProductName + "\"  title=\"Edit item\" class=\"btn-edit\"><span></span></a> " +
				"<div class=\"rating-container\">" +
			    "<p class=\"no-rating\"><a title=\"Write Your Review\" href=\"Review/" + data[i].productDetail.ProductName + "\" >Write Your Review</a></p></div>  " +
       " <p class=\"product-name\">" +
			 "<a title=\"" + data[i].productDetail.ProductName + "\" href=\"ProductDetail/" + data[i].productDetail.ProductName + "\">" + data[i].productDetail.ProductName + " </a> <span class=\"qty-number\">" + data[i].Quantity + "</span></p>  </div> " +

	"<div class=\"product-details-bottom\"> <span class=\"price\"> ₹" + data[i].NetAmount + "</span>  </div></div> <!--div class=\"edit-remove\"></div--></li></ol> ";
        //$("#block-inner").append(res);
        $(".price-total").before(res);
       
        if ($('#shopping-cart-table').length) {
            var res1 = "<tr class=\"first last odd\">" +
                        "<td style=\"display:none;\">" + +data[i].productDetail.ProductId + "</td>" +
                        "<td class=\"a-center\"><a href=\"\" title=\"" + data[i].productDetail.ImageURL + "\" class=\"product-image\">" +
                         "<img height=\"85px\" width=\"85px\" src=\"\\" + data[i].productDetail.ImageURL + "\" alt=\"Coconut water\"></a></td>" +
                         "<td class=\"a-center\">" +
                         "<h2 class=\"product-name\">" +
                         "<a href=\"\">" + data[i].productDetail.ProductName + "</a>" +
                         "</h2>" +
                         "</td>" +
                         "<td class=\"a-center\">" +
                         "<a href=\"\" title=\"Edit item parameters\">Edit</a>" +
                         "</td> " +
                         "<td class=\"a-center\">" +
                         "<span class=\"cart-price\">" +
                         "    <span class=\"price\">₹" + data[i].productDetail.PricePerUnit + "</span>" +
                         "</span> " +
                         "</td>" +
                         "<td class=\"a-center\">" +
                         "<input name=\"" + data[i].productDetail.ProductName + "\" value=\"" + data[i].Quantity + "\" size=\"4\" title=\"Qty\" class=\"input-text qty a-center\" maxlength=\"12\">" +
                         "</td>" +
                         "<td class=\"a-center\">" +
                         "<span class=\"cart-price\"> " +
                         "    <span class=\"price\">₹" + data[i].Amount + "</span>" +
                         "</span>" +
                         "</td>" +
                         "<td class=\"a-center last\"><a href=\"\" title=\"Remove item\" id=\"\\del_"+ data[i].CartDetailId + '_'+ data[i].ProductId +"\" class=\"icon-remove btn-remove btn-remove2\"></a></td>" +
                         "</tr>";
            $('#shopping-cart-table > tbody').append(res1);
        }
    }
}