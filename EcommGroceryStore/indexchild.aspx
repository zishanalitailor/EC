<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSabji.Master" AutoEventWireup="true" CodeBehind="indexchild.aspx.cs" Inherits="EcommGroceryStore.indexchild" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="yt_content" class="yt-content wrap">
        <div class="yt-breadcrumbs">
            <div class="container">
                <div class="row">
                </div>
            </div>
        </div>

        <div class="yt-content-inner">
            <div class="container">
                <div class="row">
                    <div class="col-2-wrapper">
                        <div id="yt_left" class="col-lg-3 col-md-3">
                            <div class="yt-left-wrap"> 
                                <div class="mega-left-title">
                                    <strong>Shop</strong>
                                </div>

                                <div class="css_effect sm_megamenu_wrapper_vertical_menu sambar" id="sm_megamenu_menu5739aaebe1abb" data-sam="6717955891463397099">
                                    <div class="sambar-inner">
                                        <a class="btn-sambar" data-sapi="collapse" href="#sm_megamenu_menu5739aaebe1abb">
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </a>
                                        <ul class="sm-megamenu-hover sm_megamenu_menu sm_megamenu_menu_black" data-jsapi="on">
                                            <li class="other-toggle          sm_megamenu_lv1 sm_megamenu_drop parent">
                                                <a class="sm_megamenu_head sm_megamenu_drop " href="fruits-vegetables.html" id="sm_megamenu_4">
                                                    <span class="sm_megamenu_icon sm_megamenu_nodesc">
                                                        <span class="sm_megamenu_title">Fruits &amp; Vegetables</span>


                                                    </span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--End Module-->
                                <script type="text/javascript">
                                    // <![CDATA[ 
                                    $(document).ready(function ($) {
                                        $(".sm_megamenu_wrapper_horizontal_menu .sm_megamenu_menu > li").hover(function () {
                                            var dropdown_w = $(this).children('div').width();
                                            var ul_width = $('.sm_megamenu_menu').width();
                                            var left_li = $(this).position().left;
                                            if (dropdown_w >= (ul_width - left_li)) {
                                                $(this).children('div').css({ 'right': '0px' });
                                            }
                                        });
                                    });
                                    // ]]> 
                                </script>


                                <script type="text/javascript">
                                    // <![CDATA[ 
                                    $(document).ready(function ($) {
                                        $(".sm_megamenu_wrapper_vertical_menu .sm_megamenu_menu > li").has("div").addClass('parent-child');

                                        $('.sm_megamenu_wrapper_horizontal_menu .rw-url > a.sm_megamenu_head').attr('href', 'index.html');
                                    });
                                    // ]]> 
                                </script>



                                <div class="block block-left-products">
                                    <div class="block-title">
                                        <strong>
                                            <span>Best Seller</span>
                                        </strong>
                                        <div class="customNavigation nav-left-product">
                                            <a title="Previous" class="btn-bs prev-bs icon-angle-left"></a>
                                            <a title="Next" class="btn-bs next-bs icon-angle-right"></a>
                                        </div>
                                    </div>

                                    <div id="sm_basic_products_1462422055796027053" class="block-content">
                                        <div class="slider-left-product basic-product owl-carousel owl-theme">
                                        </div>
                                    </div>
                                    <!-- End Sm-basic-products -->

                                </div>
                                <div class="block faqs-block">
                                    <div class="block-title"><strong><span>FAQs</span> </strong></div>
                                    <div class="block-content">
                                        <div class="faq-wrapper">
                                            <div class="faq-item">
                                                <div id="section1" class="accordion accordion-close"><span>How do I register?</span></div>
                                                <div class="container-accordion" style="display: none;">
                                                    <div class="content">You can register by clicking on the "Login" link at the top right corner of the homepage its free and easy!. Just provide the information in the form that appears and submit the registration information.</div>
                                                </div>
                                            </div>
                                            <div class="faq-item">
                                                <div id="section2" class="accordion accordion-open"><span>What is 'My Account'?</span></div>
                                                <div class="container-accordion">
                                                    <div class="content">'My Account' allows you complete control over your information and transactions on Onlinesabjiwala</div>
                                                </div>
                                            </div>
                                            <div class="faq-item">
                                                <div id="section3" class="accordion accordion-close"><span>How do I update my information?</span></div>
                                                <div class="container-accordion" style="display: none;">
                                                    <div class="content">It is easy to update your Onlinesabjiwala account and view your orders any time through 'My Account'.</div>
                                                </div>
                                            </div>
                                            <div class="faq-item">
                                                <div id="section4" class="accordion accordion-close"><span>What are the modes of payment?</span></div>
                                                <div class="container-accordion" style="display: none;">
                                                    <div class="content">
                                                        You can pay for your order on TheAnchorvizag.com using the following modes of payment:<br>
                                                        a. Cash on delivery
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                         
                                        $(document).ready(function ($) {

                                            /**
 * Accordion, jQuery Plugin
 *
 * This plugin provides an accordion with cookie support.
 *
 * Copyright (c) 2010 John Snyder (snyderplace.com)
 * @license http://www.snyderplace.com/accordion/license.txt New BSD
 * @version alpha 0.1
 */
                                            (function ($) {
                                                $.fn.accordion_snyderplace = function (options) {
                                                    initialize(this, options);
                                                };

                                                //create the initial accordion
                                                function initialize(obj, options) {
                                                    //build main options before element iteration
                                                    var opts = $.extend({}, $.fn.accordion_snyderplace.defaults, options);

                                                    //store any opened default values to set cookie later
                                                    var opened = '';

                                                    //iterate each matched object, bind, and open/close
                                                    obj.each(function () {
                                                        var $this = $(this);
                                                        saveOpts($this, opts);

                                                        //bind it to the event
                                                        if (opts.bind == 'mouseenter') {
                                                            $this.bind('mouseenter', function (e) {
                                                                e.preventDefault();
                                                                toggle($this, opts);
                                                            });
                                                        }

                                                        //bind it to the event
                                                        if (opts.bind == 'mouseover') {
                                                            $this.bind('mouseover', function (e) {
                                                                e.preventDefault();
                                                                toggle($this, opts);
                                                            });
                                                        }

                                                        //bind it to the event
                                                        if (opts.bind == 'click') {
                                                            $this.bind('click', function (e) {
                                                                e.preventDefault();
                                                                toggle($this, opts);
                                                            });
                                                        }

                                                        //bind it to the event
                                                        if (opts.bind == 'dblclick') {
                                                            $this.bind('dblclick', function (e) {
                                                                e.preventDefault();
                                                                toggle($this, opts);
                                                            });
                                                        }

                                                        //initialize the panels
                                                        //get the id for this element
                                                        id = $this.attr('id');

                                                        //if not using cookies, open defauls
                                                        if (!useCookies(opts)) {
                                                            //close it if not defaulted to open
                                                            if (id != opts.defaultOpen) {
                                                                $this.addClass(opts.cssClose);
                                                                $this.next().hide();
                                                            } else { //its a default open, open it
                                                                $this.addClass(opts.cssOpen);
                                                                $this.next().show();
                                                                opened = id;
                                                            }
                                                        } else { //can use cookies, use them now
                                                            //has a cookie been set, this overrides default open
                                                            if (issetCookie(opts)) {
                                                                if (inCookie(id, opts) === false) {
                                                                    $this.addClass(opts.cssClose);
                                                                    $this.next().hide();
                                                                } else {
                                                                    $this.addClass(opts.cssOpen);
                                                                    $this.next().show();
                                                                    opened = id;
                                                                }
                                                            } else { //a cookie hasn't been set open defaults
                                                                if (id != opts.defaultOpen) {
                                                                    $this.addClass(opts.cssClose);
                                                                    $this.next().hide();
                                                                } else { //its a default open, open it
                                                                    $this.addClass(opts.cssOpen);
                                                                    $this.next().show();
                                                                    opened = id;
                                                                }
                                                            }
                                                        }
                                                    });

                                                    //now that the loop is done, set the cookie
                                                    if (opened.length > 0 && useCookies(opts)) {
                                                        setCookie(opened, opts);
                                                    } else { //there are none open, set cookie
                                                        setCookie('', opts);
                                                    }

                                                    return obj;
                                                };

                                                //load opts from object
                                                function loadOpts($this) {
                                                    return $this.data('accordion-opts');
                                                }

                                                //save opts into object
                                                function saveOpts($this, opts) {
                                                    return $this.data('accordion-opts', opts);
                                                }

                                                //hides a accordion panel
                                                function close(opts) {
                                                    opened = $(document).find('.' + opts.cssOpen);
                                                    $.each(opened, function () {
                                                        //give the proper class to the linked element
                                                        $(this).addClass(opts.cssClose).removeClass(opts.cssOpen);
                                                        opts.animateClose($(this), opts);
                                                    });
                                                }

                                                //opens a accordion panel
                                                function open($this, opts) {
                                                    close(opts);
                                                    //give the proper class to the linked element
                                                    $this.removeClass(opts.cssClose).addClass(opts.cssOpen);

                                                    //open the element
                                                    opts.animateOpen($this, opts);

                                                    //do cookies if plugin available
                                                    if (useCookies(opts)) {
                                                        // split the cookieOpen string by ","
                                                        id = $this.attr('id');
                                                        setCookie(id, opts);
                                                    }
                                                }

                                                //toggle a accordion on an event
                                                function toggle($this, opts) {
                                                    // close the only open item
                                                    if ($this.hasClass(opts.cssOpen)) {
                                                        close(opts);
                                                        //do cookies if plugin available
                                                        if (useCookies(opts)) {
                                                            // split the cookieOpen string by ","
                                                            setCookie('', opts);
                                                        }
                                                        return false;
                                                    }
                                                    close(opts);
                                                    //open a closed element
                                                    open($this, opts);
                                                    return false;
                                                }

                                                //use cookies?
                                                function useCookies(opts) {
                                                    //return false if cookie plugin not present or if a cookie name is not provided
                                                    if (!$.cookie || opts.cookieName == '') {
                                                        return false;
                                                    }

                                                    //we can use cookies
                                                    return true;
                                                }

                                                //set a cookie
                                                function setCookie(value, opts) {
                                                    //can use the cookie plugin
                                                    if (!useCookies(opts)) { //no, quit here
                                                        return false;
                                                    }

                                                    //cookie plugin is available, lets set the cookie
                                                    $.cookie(opts.cookieName, value, opts.cookieOptions);
                                                }

                                                //check if a accordion is in the cookie
                                                function inCookie(value, opts) {
                                                    //can use the cookie plugin
                                                    if (!useCookies(opts)) {
                                                        return false;
                                                    }

                                                    //if its not there we don't need to remove from it
                                                    if (!issetCookie(opts)) { //quit here, don't have a cookie
                                                        return false;
                                                    }

                                                    //unescape it
                                                    cookie = unescape($.cookie(opts.cookieName));

                                                    //is this value in the cookie arrray
                                                    if (cookie != value) { //no, quit here
                                                        return false;
                                                    }

                                                    return true;
                                                }

                                                //check if a cookie is set
                                                function issetCookie(opts) {
                                                    //can we use the cookie plugin
                                                    if (!useCookies(opts)) { //no, quit here
                                                        return false;
                                                    }

                                                    //is the cookie set
                                                    if ($.cookie(opts.cookieName) == null) { //no, quit here
                                                        return false;
                                                    }

                                                    return true;
                                                }

                                                // settings
                                                $.fn.accordion_snyderplace.defaults = {
                                                    cssClose: 'accordion-close', //class you want to assign to a closed accordion header
                                                    cssOpen: 'accordion-open', //class you want to assign an opened accordion header
                                                    cookieName: 'accordion', //name of the cookie you want to set for this accordion
                                                    cookieOptions: { //cookie options, see cookie plugin for details
                                                        path: '/',
                                                        expires: 7,
                                                        domain: '',
                                                        secure: ''
                                                    },
                                                    defaultOpen: '', //id that you want opened by default
                                                    speed: 'slow', //speed of the slide effect
                                                    bind: 'click', //event to bind to, supports click, dblclick, mouseover and mouseenter
                                                    animateOpen: function (elem, opts) { //replace the standard slideDown with custom function
                                                        elem.next().slideDown(opts.speed);
                                                    },
                                                    animateClose: function (elem, opts) { //replace the standard slideUp with custom function
                                                        elem.next().slideUp(opts.speed);
                                                    }
                                                };
                                            })(jQuery);
                                            $('.accordion').accordion_snyderplace({
                                                defaultOpen: 'section2',
                                                speed: 'fast',
                                                animateOpen: function (elem, opts) { //replace the standard slideUp with custom function
                                                    elem.next().slideFadeToggle(opts.speed);
                                                },
                                                animateClose: function (elem, opts) { //replace the standard slideDown with custom function
                                                    elem.next().slideFadeToggle(opts.speed);
                                                }
                                            });
                                            //custom animation for open/close
                                            $.fn.slideFadeToggle = function (speed, easing, callback) {
                                                return this.animate({ opacity: 'toggle', height: 'toggle' }, speed, easing, callback);
                                            };
                                        });
                                      
                                    </script>
                                </div>
                            </div>
                        </div>

                        <div id="yt_main" class="yt-main-right yt-main col-main col-lg-9 col-md-9">
                            <div class="yt_main_inner">
                                <noscript>
                                    &lt;div class="global-site-notice noscript"&gt;
            &lt;div class="notice-inner"&gt;
                &lt;p&gt;
                    &lt;strong&gt;JavaScript seems to be disabled in your browser.&lt;/strong&gt;&lt;br /&gt;
                    You must have JavaScript enabled in your browser to utilize the functionality of this website.                &lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
                                </noscript>

                                <div class="std">
                                    <div class="no-display">&nbsp;</div>
                                </div>
                                <div class="yt-slideshow">
                                    <div style="overflow: hidden;">
                                        <div class="margin-sl-image">
                                            <div id="sm_imageslider_6751362021462422074" class="sm_imageslider_wrap">

                                                <div class="sm_imageslider owl-carousel owl-theme" style="opacity: 1; display: block;">
                                                    <div class="item">
                                                        <a href="#" title="Fresh Hand picked">
                                                            <img src="media/wysiwyg/slideshow/home-default/onlinesabjiwala-home-banner-3.jpg" alt="Fresh Hand picked">
                                                        </a>
                                                    </div>
                                                    <div class="item">
                                                        <a href="#" title="Best Quality Fruits &amp; Vegetables">
                                                            <img src="media/wysiwyg/slideshow/home-default/onlinesabjiwala-home-banner-2.jpg" alt="Best Quality Fruits &amp; Vegetables">
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="owl-controls clickable">
                                                    <div class="owl-pagination">
                                                        <div class="owl-page"><span class=""></span></div>
                                                        <div class="owl-page active"><span class=""></span></div>
                                                    </div>
                                                    <div class="owl-buttons">
                                                        <div class="owl-prev">prev</div>
                                                        <div class="owl-next">next</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <script type="text/javascript">
                                $(document).ready(function ($) {
                                    $('.sm_imageslider').owlCarousel({
                                        navigation: true,
                                        slideSpeed: 800,
                                        stopOnHover: true,
                                        paginationSpeed: 800,
                                        autoPlay: true,
                                        pagination: true,
                                        singleItem: true,
                                        transitionStyle: "goDown"
                                    });
                                });
                            </script>


                            <script type="text/javascript">
                                //<![CDATA[
                                //data = new Date(2013, 10, 26, 12, 00, 00);
                                //var listdeal = [];
                                //function CountDown(date, id) {
                                //    dateNow = new Date();
                                //    amount = date.getTime() - dateNow.getTime();
                                //    delete dateNow;
                                //    if (amount < 0) {
                                //        document.getElementById(id).innerHTML = "Now!";
                                //    } else {
                                //        days = 0; hours = 0; mins = 0; secs = 0; out = "";
                                //        amount = Math.floor(amount / 1000);
                                //        days = Math.floor(amount / 86400);
                                //        amount = amount % 86400;
                                //        hours = Math.floor(amount / 3600);
                                //        amount = amount % 3600;
                                //        mins = Math.floor(amount / 60);
                                //        amount = amount % 60;
                                //        secs = Math.floor(amount);
                                //        if (days != 0) { out += "<div class='time-item time-day'>" + "<div class='num-time'>" + days + "</div>" + " <div class='name-time'>" + ((days == 1) ? "Day" : "Days") + "</div>" + "</div> "; }
                                //        if (hours != 0) { out += "<div class='time-item time-hour'>" + "<div class='num-time'>" + hours + "</div>" + " <div class='name-time'>" + ((hours == 1) ? "Hour" : "Hours") + "</div>" + "</div> "; }
                                //        out += "<div class='time-item time-min'>" + "<div class='num-time'>" + mins + "</div>" + " <div class='name-time'>" + ((mins == 1) ? "Min" : "Mins") + "</div>" + "</div> ";
                                //        out += "<div class='time-item time-sec'>" + "<div class='num-time'>" + secs + "</div>" + " <div class='name-time'>" + ((secs == 1) ? "Sec" : "Secs") + "</div>" + "</div> ";
                                //        out = out.substr(0, out.length - 2);
                                //        document.getElementById(id).innerHTML = out;
                                //        setTimeout(function () { CountDown(date, id) }, 1000);
                                //    }
                                //}
                                //]]>
                            </script>

                            <%--<div class="deal-wrapper">
                                <div class="block-title-default">
                                    <h2><span>Deals</span></h2>
                                </div>


                                <div id="sm_deal_1462422074708214767" class="sm-deal-wrap">


                                    <div class="w-deal-res deal-home-df">
                                        <div class="customNavigation custom-nav-default">
                                            <a title="Previous" class="button-default prev-deal icon-angle-left"></a>
                                            <a title="Next" class="button-default next-deal icon-angle-right"></a>
                                        </div>
                                        <div class="overflow-owl-slider">
                                            <div class="rw-margin">
                                                <div class="slider-deal" style="opacity: 0;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <script>
                                //jQuery(document).ready(function ($) {
                                //    var owl_deal = $(".slider-deal");
                                //    owl_deal.owlCarousel({
                                //        itemsCustom: [
                                //        [0, 1],
                                //        [480, 2],
                                //        [768, 3],
                                //        [992, 3],
                                //        [1200, 4]
                                //        ],
                                //        navigation: false, // Show next and prev buttons
                                //        slideSpeed: 300,
                                //        stopOnHover: true,
                                //        paginationSpeed: 400,
                                //        autoPlay: false,
                                //        pagination: false,
                                //    });

                                //    $(".next-deal").click(function () {
                                //        owl_deal.trigger('owl.next');
                                //    })
                                //    $(".prev-deal").click(function () {
                                //        owl_deal.trigger('owl.prev');
                                //    })
                                //});
                            </script>

                            <script type="text/javascript">
                                //<![CDATA[
                                //window.onload = function () {
                                //    if (listdeal.length > 0) {
                                //        for (i = 0; i < listdeal.length; i++) {
                                //            var arr = listdeal[i].split("&&||&&");
                                //            var data = new Date(arr[1]);
                                //            CountDown(data, arr[0]);
                                //        }
                                //    }
                                //};
                                //]]>
                            </script>

                            <%--<div id="sm_listing_tabs_5592927011462422075" class="super-category-block first-load">

                                <div class="block-title-default">
                                    <h2>
                                        <a title="Fruits &amp; Vegetables" href="fruits-vegetables.html"><span>Fruits &amp; Vegetables</span></a>
                                    </h2>

                                    <div class="category-wrap-cat">
                                        <ul class="cat-list">

                                            <li class="item">
                                                <a href="fruits-vegetables/fruits.html">Fruits									</a>
                                            </li>
                                            <li class="item">
                                                <a href="fruits-vegetables/vegetables.html">Vegetables									</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>  
                                <div class="supercat-des">
                                </div> 
                                <div class="super-cat-wrapper">
                                    <div class="customNavigation custom-nav-default">
                                        <a title="Previous" class="button-default prev-cat prev-super-cat-29 icon-angle-left"></a>
                                        <a title="Next" class="button-default next-cat next-super-cat-29 icon-angle-right"></a>
                                    </div> 
                                    <div class="overflow-owl-slider">
                                        <div class="border-cat">
                                            <div class="rw-margin">
                                                <div class="ltabs-items-container slider-cat-29 owl-carousel owl-theme">
                                                </div>
                                            </div> 
                                            <script>
                                                $(document).ready(function ($) {
                                                    getcarouselcat_29products();
                                                    $.when(getcarouselcat_29products()).done(function (data) {
                                                        getHomepagecat_29productsAndGenerateHtml(data);
                                                        var owl_cat_29 = $(".slider-cat-29");
                                                        owl_cat_29.owlCarousel({
                                                            itemsCustom: [
                                                            [0, 1],
                                                            [480, 2],
                                                            [768, 3],
                                                            [992, 3],
                                                            [1200, 4]
                                                            ],
                                                            navigation: false, // Show next and prev buttons
                                                            slideSpeed: 800,
                                                            stopOnHover: true,
                                                            paginationSpeed: 400,
                                                            autoPlay: true,
                                                            pagination: false,
                                                        });

                                                        $(".next-super-cat-29").click(function () {
                                                            owl_cat_29.trigger('owl.next');
                                                        });
                                                        $(".prev-super-cat-29").click(function () {
                                                            owl_cat_29.trigger('owl.prev');
                                                        });
                                                    });
                                                });
                                            </script>
                                        </div>
                                    </div>

                                </div>
                            </div>--%>

                             

                            <div id="sm_listing_tabs_167860261714624220761" class="super-category-block first-load">

                                <div class="block-title-default">
                                    <h2>
                                        <a title="Vegetables" href="products/vegetables"><span>Pan Asian</span></a>
                                    </h2> 
                                </div> 

                                <div class="supercat-des">
                                </div>

                                <div class="super-cat-wrapper">
                                    <div class="customNavigation custom-nav-default">
                                        <a title="Previous" class="button-default prev-cat prev-super-cat-30 prev-carousel1 icon-angle-left"></a>
                                        <a title="Next" class="button-default next-cat next-super-cat-30 next-carousel1 icon-angle-right"></a>
                                    </div>

                                    <div class="overflow-owl-slider">
                                        <div class="border-cat">
                                            <div class="rw-margin">
                                                <div class="ltabs-items-container slider-cat-30 carousel1">
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            $(document).ready(function ($) {
                                                getcarouselcat_30products('Pan Asian');
                                                $.when(getcarouselcat_30products('Pan Asian')).done(function (data) {
                                                    if (data.length > 0) {
                                                        console.log('pan asian data length > 0');
                                                        getHomepagecat_30productsAndGenerateHtml(data, "div.ltabs-items-container.slider-cat-30.carousel1");
                                                        var owl_cat_30 = $(".carousel1");
                                                        owl_cat_30.owlCarousel({
                                                            itemsCustom: [
                                                                [0, 1],
                                                                [480, 2],
                                                                [768, 3],
                                                                [992, 3],
                                                                [1200, 4]
                                                            ],
                                                            navigation: false, // Show next and prev buttons
                                                            slideSpeed: 800,
                                                            stopOnHover: true,
                                                            paginationSpeed: 400,
                                                            autoPlay: true,
                                                            pagination: false,
                                                        });

                                                        $(".prev-carousel1").show();
                                                        $(".next-carousel1").show();

                                                        $(".prev-carousel1").click(function () {
                                                            owl_cat_30.trigger('owl.next');
                                                        });
                                                        $(".next-carousel1").click(function () {
                                                            owl_cat_30.trigger('owl.prev');
                                                        });
                                                    }
                                                    else {
                                                        $(".prev-carousel1").hide();
                                                        $(".next-carousel1").hide();
                                                    }
                                                });
                                            });
                                        </script>
                                    </div>

                                </div>
                            </div>
                            
                            <div id="sm_listing_tabs_167860261714624220762" class="super-category-block first-load">

                                <div class="block-title-default">
                                    <h2>
                                        <a title="Vegetables" href="products/vegetables"><span>Pan Indian</span></a>
                                    </h2> 
                                </div> 

                                <div class="supercat-des">
                                </div>

                                <div class="super-cat-wrapper">
                                    <div class="customNavigation custom-nav-default">
                                        <a title="Previous" class="button-default prev-cat prev-super-cat-30 prev-carousel2 icon-angle-left"></a>
                                        <a title="Next" class="button-default next-cat next-super-cat-30 next-carousel2 icon-angle-right"></a>
                                    </div>

                                    <div class="overflow-owl-slider">
                                        <div class="border-cat">
                                            <div class="rw-margin">
                                                <div class="ltabs-items-container slider-cat-30 carousel2">
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            $(document).ready(function ($) {
                                                getcarouselcat_30products('Pan Indian');
                                                $.when(getcarouselcat_30products('Pan Indian')).done(function (data) {
                                                    if (data.length > 0) {
                                                        console.log('Pan Indian data length > 0');
                                                        getHomepagecat_30productsAndGenerateHtml(data, "div.ltabs-items-container.slider-cat-30.carousel2");
                                                        var owl_cat_30 = $(".carousel2");
                                                        owl_cat_30.owlCarousel({
                                                            itemsCustom: [
                                                                [0, 1],
                                                                [480, 2],
                                                                [768, 3],
                                                                [992, 3],
                                                                [1200, 4]
                                                            ],
                                                            navigation: false, // Show next and prev buttons
                                                            slideSpeed: 800,
                                                            stopOnHover: true,
                                                            paginationSpeed: 400,
                                                            autoPlay: true,
                                                            pagination: false,
                                                        });

                                                        $(".prev-carousel2").show();
                                                        $(".next-carousel2").show();

                                                        $(".prev-carousel2").click(function() {
                                                            owl_cat_30.trigger('owl.next');
                                                        });
                                                        $(".next-carousel2").click(function() {
                                                            owl_cat_30.trigger('owl.prev');
                                                        });
                                                    }
                                                    else {
                                                        $(".prev-carousel2").hide();
                                                        $(".next-carousel2").hide();
                                                    }
                                                });
                                            });
                                        </script>
                                    </div>

                                </div>
                            </div>
                            
                            <div id="sm_listing_tabs_167860261714624220763" class="super-category-block first-load">

                                <div class="block-title-default">
                                    <h2>
                                        <a title="Continental" href="products/vegetables"><span>Continental</span></a>
                                    </h2> 
                                </div> 

                                <div class="supercat-des">
                                </div>

                                <div class="super-cat-wrapper">
                                    <div class="customNavigation custom-nav-default">
                                        <a title="Previous" class="button-default prev-cat prev-super-cat-30 prev-carousel3 icon-angle-left"></a>
                                        <a title="Next" class="button-default next-cat next-super-cat-30 next-carousel3 icon-angle-right"></a>
                                    </div>

                                    <div class="overflow-owl-slider">
                                        <div class="border-cat">
                                            <div class="rw-margin">
                                                <div class="ltabs-items-container slider-cat-30 carousel3">
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            $(document).ready(function ($) {
                                                getcarouselcat_30products('Continental');
                                                $.when(getcarouselcat_30products('Continental')).done(function (data) {
                                                    if (data.length > 0) { 
                                                        getHomepagecat_30productsAndGenerateHtml(data, "div.ltabs-items-container.slider-cat-30.carousel3");
                                                        var owl_cat_30 = $(".carousel3");
                                                        owl_cat_30.owlCarousel({
                                                            itemsCustom: [
                                                                [0, 1],
                                                                [480, 2],
                                                                [768, 3],
                                                                [992, 3],
                                                                [1200, 4]
                                                            ],
                                                            navigation: false, // Show next and prev buttons
                                                            slideSpeed: 800,
                                                            stopOnHover: true,
                                                            paginationSpeed: 400,
                                                            autoPlay: true,
                                                            pagination: false,
                                                        });

                                                        $(".prev-carousel3").show();
                                                        $(".next-carousel3").show();

                                                        $(".prev-carousel3").click(function() {
                                                            owl_cat_30.trigger('owl.next');
                                                        });
                                                        $(".next-carousel3").click(function() {
                                                            owl_cat_30.trigger('owl.prev');
                                                        });
                                                    }
                                                    else {
                                                        $(".prev-carousel3").hide();
                                                        $(".next-carousel3").hide();
                                                    }
                                                });
                                            });
                                        </script>
                                    </div>

                                </div>
                            </div>
                            
                            <div id="sm_listing_tabs_167860261714624220764" class="super-category-block first-load">

                                <div class="block-title-default">
                                    <h2>
                                        <a title="South Indian" href="products/vegetables"><span>South Indian</span></a>
                                    </h2> 
                                </div> 

                                <div class="supercat-des">
                                </div>

                                <div class="super-cat-wrapper">
                                    <div class="customNavigation custom-nav-default">
                                        <a title="Previous" class="button-default prev-cat prev-super-cat-30 prev-carousel4 icon-angle-left"></a>
                                        <a title="Next" class="button-default next-cat next-super-cat-30 next-carousel4 icon-angle-right"></a>
                                    </div>

                                    <div class="overflow-owl-slider">
                                        <div class="border-cat">
                                            <div class="rw-margin">
                                                <div class="ltabs-items-container slider-cat-30 carousel4">
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            $(document).ready(function ($) {
                                                getcarouselcat_30products('South Indian');
                                                $.when(getcarouselcat_30products('South Indian')).done(function (data) {
                                                    if (data.length > 0) { 
                                                        getHomepagecat_30productsAndGenerateHtml(data, "div.ltabs-items-container.slider-cat-30.carousel4");
                                                        var owl_cat_30 = $(".carousel4");
                                                        owl_cat_30.owlCarousel({
                                                            itemsCustom: [
                                                                [0, 1],
                                                                [480, 2],
                                                                [768, 3],
                                                                [992, 3],
                                                                [1200, 4]
                                                            ],
                                                            navigation: false, // Show next and prev buttons
                                                            slideSpeed: 800,
                                                            stopOnHover: true,
                                                            paginationSpeed: 400,
                                                            autoPlay: true,
                                                            pagination: false,
                                                        });

                                                        $(".prev-carousel4").show();
                                                        $(".next-carousel4").show();

                                                        $(".prev-carousel4").click(function() {
                                                            owl_cat_30.trigger('owl.next');
                                                        });
                                                        $(".next-carousel4").click(function() {
                                                            owl_cat_30.trigger('owl.prev');
                                                        });
                                                    }
                                                    else {
                                                        $(".prev-carousel4").hide();
                                                        $(".next-carousel4").hide();
                                                    }
                                                });
                                            });
                                        </script>
                                    </div>

                                </div>
                            </div>
                            
                            <div id="sm_listing_tabs_167860261714624220765" class="super-category-block first-load">

                                <div class="block-title-default">
                                    <h2>
                                        <a title="Desserts" href="products/vegetables"><span>Desserts</span></a>
                                    </h2> 
                                </div> 

                                <div class="supercat-des">
                                </div>

                                <div class="super-cat-wrapper">
                                    <div class="customNavigation custom-nav-default">
                                        <a title="Previous" class="button-default prev-cat prev-super-cat-30 prev-carousel5 icon-angle-left"></a>
                                        <a title="Next" class="button-default next-cat next-super-cat-30 next-carousel5 icon-angle-right"></a>
                                    </div>

                                    <div class="overflow-owl-slider">
                                        <div class="border-cat">
                                            <div class="rw-margin">
                                                <div class="ltabs-items-container slider-cat-30 carousel5">
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            $(document).ready(function ($) {
                                                getcarouselcat_30products('Desserts');
                                                $.when(getcarouselcat_30products('Desserts')).done(function (data) {
                                                    if (data.length > 0) { 
                                                        getHomepagecat_30productsAndGenerateHtml(data, "div.ltabs-items-container.slider-cat-30.carousel5");
                                                        var owl_cat_30 = $(".carousel5");
                                                        owl_cat_30.owlCarousel({
                                                            itemsCustom: [
                                                                [0, 1],
                                                                [480, 2],
                                                                [768, 3],
                                                                [992, 3],
                                                                [1200, 4]
                                                            ],
                                                            navigation: false, // Show next and prev buttons
                                                            slideSpeed: 800,
                                                            stopOnHover: true,
                                                            paginationSpeed: 400,
                                                            autoPlay: true,
                                                            pagination: false,
                                                        });

                                                        $(".prev-carousel5").show();
                                                        $(".next-carousel5").show();

                                                        $(".prev-carousel5").click(function() {
                                                            owl_cat_30.trigger('owl.next');
                                                        });
                                                        $(".next-carousel5").click(function() {
                                                            owl_cat_30.trigger('owl.prev');
                                                        });
                                                    }
                                                    else {
                                                        $(".prev-carousel5").hide();
                                                        $(".next-carousel5").hide();
                                                    }
                                                });
                                            });
                                        </script>
                                    </div>

                                </div>
                            </div>

                            <div id="sm_listing_tabs_21028495471462422076" class="super-category-block first-load">
                                <div class="block-title-default">
                                    <h2>
                                        <a title="Fruits" href="products/fruits"><span>Fruits</span></a>
                                    </h2>
                                    <div style="display: none;" class="category-wrap-cat">
                                        <ul class="cat-list">
                                            <li class="item">
                                                <a href="fruits-vegetables/fruits/seasonal-fruits.html">Seasonal Fruits									</a>
                                            </li>
                                            <li class="item">
                                                <a href="fruits-vegetables/fruits/imported-fruits.html">Imported Fruits									</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="supercat-des">
                                </div>

                                <div class="super-cat-wrapper">
                                    <div class="customNavigation custom-nav-default">
                                        <a title="Previous" class="button-default prev-cat prev-super-cat-8 icon-angle-left"></a>
                                        <a title="Next" class="button-default next-cat next-super-cat-8 icon-angle-right"></a>
                                    </div>

                                    <div class="overflow-owl-slider">
                                        <div class="border-cat">
                                            <div class="rw-margin">
                                                <div class="ltabs-items-container slider-cat-8">
                                                </div>
                                            </div>

                                            <script>
                                                $(document).ready(function ($) {
                                                    getcarouselcat_8products();
                                                    $.when(getcarouselcat_8products()).done(function (data) {
                                                        getHomepagecat_8productsAndGenerateHtml(data);
                                                        var owl_cat_8 = $(".slider-cat-8");
                                                        owl_cat_8.owlCarousel({
                                                            itemsCustom: [
                                                            [0, 1],
                                                            [480, 2],
                                                            [768, 3],
                                                            [992, 3],
                                                            [1200, 4]
                                                            ],
                                                            navigation: false, // Show next and prev buttons
                                                            slideSpeed: 800,
                                                            stopOnHover: true,
                                                            paginationSpeed: 400,
                                                            autoPlay: true,
                                                            pagination: false,
                                                        });

                                                        $(".next-super-cat-8").click(function () {
                                                            owl_cat_8.trigger('owl.next');
                                                        });
                                                        $(".prev-super-cat-8").click(function () {
                                                            owl_cat_8.trigger('owl.prev');
                                                        });
                                                    });
                                                });
                                            </script>
                                        </div>
                                    </div> 
                                </div>
                            </div>  
                        </div>
                    </div>

                    <div style="clear: both;"></div>


                    <ul class="list-services">
                        <li class="item-service col-lg-4 col-md-4 col-sm-4"><a title="Free Shipping" href="#">
                            <img title="Same Day Delivery" alt="Same Day Delivery" src="media/wysiwyg/same-day-delivery.jpg"></a></li>
                        <li class="item-service col-lg-4 col-md-4 col-sm-4"><a title="Guaranteed" href="#">
                            <img title="We Deliver to your doorstep" alt="We Deliver to your doorstep" src="media/wysiwyg/we-pick.jpg"></a></li>
                        <li class="item-service col-lg-4 col-md-4 col-sm-4"><a title="Deal" href="#">
                            <img title="Get 5% Discount " alt="Deal Get 5% Discount " src="media/wysiwyg/get-5-percent-off.jpg"></a></li>
                    </ul>
                </div>
            </div>
        </div> 
    </div> 
</asp:Content>


