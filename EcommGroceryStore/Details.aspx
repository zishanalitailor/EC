<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSabji.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="EcommGroceryStore.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="/../Scripts/custom/listfruits.js"></script>
    <script src="/../Scripts/custom/cart.js"></script>


    <script>
        $(document).ready(function ($) {
            var querystring = "";//(window.location.href).substring((window.location.href).lastIndexOf('/') + 1, (window.location.href).length);
            var domain = window.location.host + "/Details/";
            var nonDomainPart = window.location.href.indexOf(domain);
            if (nonDomainPart !== -1) {
                querystring = (window.location.href).substring(nonDomainPart + domain.length, (window.location.href).length);
            }
            $(document).ajaxStop(function () {
                //$('body').css('opacity', '1');
                $("#pageloaddiv").css('display', 'none');
            });
            $(document).ajaxError(function (event, xhr, options, exc) {
                //console.log("An error occurred!");
            });
            getProductDetail(querystring);
            $.when(getProductDetail(querystring)).done(function (newdata) {

                //console.log('from details page' + newdata[0].PricePerUnit + '  ' + newdata[0].ProductName);

                //console.log(data);
                $("#ProductId").text(newdata[0].ProductId);
                $("#product_name_details").text(newdata[0].ProductName);
                $("#price_details").text('₹ ' + newdata[0].PricePerUnit);
                $(".short-description").text(newdata[0].ProductName);
                $("#yt_cloudzoom").attr('href', newdata[0].ImageURL);
                $("#image").attr('src', '../' + newdata[0].ImageURL);
                //data.ProductId
            });
            $("#AddToCart").click(function () {

                if (document.getElementById('cartid').value == '') {
                    var cart = new Object();
                    cart.IpAddress = $("#ip").val();
                    cart.IsActive = true;
                    //alert('generate cart called ');
                    generateCart(cart);
                }
                else {
                    var product = {
                        CartId: $("#cartid").val(),
                        ProductId: $("#ProductId").text(),
                        Quantity: $("#qty").val()
                    }
                    //alert('AddProductToCart called ' + product);
                    AddProductToCart(product);
                }
            });
        });

        function DecreaseByOne() {
            if (Number(document.getElementById('qty').value) > 1)
            { document.getElementById('qty').value = Number(document.getElementById('qty').value) - 1; }
        }

        function IncreaseByOne() {
            document.getElementById('qty').value = Number(document.getElementById('qty').value) + 1;
        }
    </script>

    <div class="yt-main-inner yt-content-inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="col-1-wrapper">
                        <div id="messages_product_view"></div>
                        <div class="yt-product-detail" itemscope="" itemtype="http://schema.org/Product">
                            <div class="yt-product-detail-inner">
                                <div class="row product-essential">
                                    <div class="box-1">
                                        <div class="image-box-detail col-lg-6 col-md-6 col-sm-9 col-xs-12">
                                            <div class="product-img-box">


                                                <div class="yt-detail-image zoom-wrapper-detail">
                                                    <div class="product-image product-image-zoom">
                                                        <div class="product-image-zoom">
                                                            <div id="wrap" style="top: 0px; z-index: 9999; position: relative;">
                                                                <a id="yt_cloudzoom" class="cloud-zoom" href="" rel="zoomWidth:300, zoomHeight:300, adjustX: 20, adjustY: -3" title="Apple Indian"
                                                                    style="position: relative; display: block;">
                                                                    <img src="" id="image" alt="Apple Indian" title="Apple Indian" style="display: block;">
                                                                    <span class="sale-product have-ico">Sale</span>
                                                                </a>
                                                                <div class="mousetrap" style="z-index: 999; position: absolute; width: 459px; height: 459px; left: 0px; top: 0px; cursor: move; background-image: url(&quot;.&quot;);"></div>
                                                            </div>
                                                            <div class="popup-btn  hidden-phone product-image-gallery">
                                                                <a id="yt_popup" class="fancybox-button" href="" data-fancybox-group="button">Zoom
                                                                </a>
                                                                <a style="display: none;" class="fancybox-image-hidden" href="" data-fancybox-group="button"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <script type="text/javascript">

                                                    jQuery(document).ready(function ($) {

                                                        //  $('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();

                                                        $('.fancybox-image-hidden').each(function () {
                                                            attr = $(this).attr('href');
                                                            href_current = $('a#yt_popup').attr('href');
                                                            if (attr == href_current) {
                                                                $(this).removeClass("fancybox-button");
                                                            }
                                                        });

                                                        $('a.cloud-zoom-gallery').bind('click', function () {
                                                            $('a#yt_popup').attr('href', $(this).attr('href'));
                                                            $('.fancybox-image-hidden').addClass("fancybox-button");
                                                            $('.fancybox-image-hidden').each(function () {
                                                                attr = $(this).attr('href');
                                                                href_current = $('a#yt_popup').attr('href');
                                                                if (attr == href_current) {
                                                                    $(this).removeClass("fancybox-button");
                                                                }
                                                            });
                                                        });

                                                        $('.jCarouselLite ul li a').each(function () {
                                                            if ($(this).hasClass('actived')) {
                                                                $(this).parent().addClass('selected');
                                                            }
                                                        });

                                                        $('.jCarouselLite ul li a').click(function () {
                                                            $this = $(this);
                                                            $('.jCarouselLite ul li a').parent().removeClass('selected');
                                                            if ($this.hasClass('actived')) {
                                                                $this.parent().addClass('selected');
                                                            }
                                                        });
                                                    });
                                                </script>

                                                <script type="text/javascript">
                                                    jQuery(document).ready(function ($) {
                                                        $('.product-options .configurable-swatch-list .swatch-label').has('img').click(function () {
                                                            setTimeout(function () {
                                                                var href = $('.product-image-gallery .visible').attr('src');
                                                                //alert(href);
                                                                $('#yt_popup').attr('href', href);
                                                                $('#yt_cloudzoom').attr('href', href);
                                                                $('#yt_cloudzoom img').attr('src', href);
                                                                $('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
                                                            }, 500);

                                                        });

                                                        $('.product-options .configurable-swatch-list .swatch-label').has('img').click(function () {
                                                            //alert('aaaaa');
                                                            setTimeout(function () {
                                                                var n_img = $('.item-inner a.product-image img.hidden').length;
                                                                var n_imdefault = $('.item-inner a.product-image img.hidden').next('img').length;
                                                                if (n_img == 1 && n_imdefault == 0) {
                                                                    $('.item-inner a.product-image img.hidden').removeClass('hidden');
                                                                }

                                                            }, 500);
                                                        });

                                                    });
                                                </script>

                                            </div>
                                        </div>
                                        <div class="yt-detail-right col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <script type="text/javascript">                                                /*decorateGeneric($$('#product-options-wrapper dl'), ['last']);*/</script>
                                            <input type="hidden" name="ProductId" id="ProductId" value="">

                                            <div class="product-shop simple-product">
                                                <h2 class="product-name" id="product_name_details" itemprop="name"></h2>
                                                <div class="product-review">
                                                    <p class="no-rating"><a title="Write Your Review" href="/review/product/list/id/72/#review-form">Write Your Review</a></p>
                                                </div>
                                                <div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                                                    <p class="availability in-stock">
                                                        Availability: <span>
                                                            <link itemprop="availability" href="http://schema.org/InStock">
                                                            In stock</span>
                                                    </p>
                                                    <div class="price-box">
                                                        <span class="regular-price">
                                                            <span id="price_details" class="price"></span></span>
                                                    </div>
                                                </div>
                                                <div class="product-options clearfix" id="product-options-wrapper">
                                                    <dl class="last">
                                                        <div class="w-option">
                                                            <dt>
                                                                <label class="required">Quantity<em>*</em></label></dt>
                                                            <dd class="last">
                                                                <div class="input-box">
                                                                    <div class="selector" id="uniform-select_54" style="width: 166px;">
                                                                        <span style="width: 111px; -webkit-user-select: none;">-- Please Select --</span>
                                                                        <select name="options[54]" id="select_54" class="required-entry product-custom-option jqtransformdone" title="">
                                                                            <option value="">-- Please Select --</option>
                                                                            <option value="0">500gm </option>
                                                                            <option value="1">1kg </option>
                                                                            <option value="2">2kg </option>
                                                                            <option value="3">3kg </option>
                                                                            <option value="4">4kg </option>
                                                                            <option value="5">5kg </option>
                                                                            <option value="6">6kg </option>
                                                                            <option value="7">7kg </option>
                                                                            <option value="8">8kg </option>
                                                                            <option value="9">9kg </option>
                                                                            <option value="10">10kg </option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </div>
                                                    </dl>
                                                </div>

                                                <div class="add-to-holder have-price">
                                                    <div class="price-box">
                                                        <span class="regular-price"><span class="price_details"></span></span>
                                                    </div>
                                                    <div class="wrap-qty">
                                                        <div class="qty-title"><span>Qty:</span></div>
                                                        <div class="qty-set">
                                                            <span class="quantity-box">
                                                                <input type="hidden" name="proId" id="proId" value="29">
                                                                <input type="button" class="quantity-controls quantity-minus" onclick="DecreaseByOne()" value="">
                                                                <input type="text" name="qty" id="qty" maxlength="12" value="1" title="Qty" class="quantity-input qty">
                                                                <input type="hidden" id="qty_stock" name="qty_stock" value="84">
                                                                <input type="hidden" id="max_qty_stock" name="max_qty_stock" value="10">
                                                                <input type="hidden" id="min_qty_stock" name="min_qty_stock" value="1">
                                                                <input type="button" class="quantity-controls quantity-plus" onclick="IncreaseByOne()" value="">
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart product-addcart">
                                                        <button type="button" title="Add to Cart" id="AddToCart" class="button btn-cart btn-cart-single"><span><span>Add to Cart</span></span></button>
                                                    </div>
                                                    <div class="product-add-box">
                                                        <ul class="add-to-links">
                                                            <li class="wishlist"><a href="http://www.onlinesabjiwala.com/wishlist/index/add/product/29/form_key/dVq8b97n8WRfZrE2/" onclick="productAddToCartForm.submitLight(this, this.href); return false;" class="link-wishlist" title="Add to Wishlist">Add to Wishlist</a></li>
                                                            <li class="compare"><a href="http://www.onlinesabjiwala.com/catalog/product_compare/add/product/29/uenc/aHR0cDovL3d3dy5vbmxpbmVzYWJqaXdhbGEuY29tL2FwcGxlLWluZGlhbi5odG1sP1NJRD01ZWFiNzA0ZjIzOThjNjllNDhjMDgwYjAyYWYyMmVkNw,,/form_key/dVq8b97n8WRfZrE2/" class="link-compare" title="Add to Compare">Add to Compare</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="clear: both;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-block-home">
            <div class="container">
                <div class="row">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
