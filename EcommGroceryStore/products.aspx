<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSabji.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="EcommGroceryStore.products" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <style type="text/css">
        .pagination {
            padding-left: 0;
            margin: 0 0;
            display: inline;
        }
        
        .ui-widget { 
            font-family: Verdana,Arial,sans-serif;
            font-size: 1.0em;
        }
        .ui-slider .ui-slider-range {
            position: absolute;
            z-index: 1;
            font-size: .7em;
            display: block;
            border: 0;
            background-position: 0 0;
        }
         
        .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
            border: 1px solid #d3d3d3;   
            background-color:white;          
            /* background: #e6e6e6 url("images/ui-bg_glass_75_e6e6e6_1x400.png") 50% 50% repeat-x; */
            border-radius: 50%;
        }

        .ui-widget-header { 
           /* background: #fff url("images/ui-bg_highlight-soft_75_cccccc_1x100.png") 50% 50% repeat-x; */
        }
        .ui-slider .ui-slider-handle { 
            width: 1.8em;
            height: 1.8em; 
        }
        .ui-slider-horizontal {
            height: 0.1em;
        }
        .ui-slider-horizontal {
            height: 1.1em;
        }
        
    </style>
    <script src="/../Scripts/custom/listfruits.js"></script>

    <div class="container">
					<div class="row">
						<div class="col-2-wrapper">
							 <div id="yt_left" class="col-lg-3 col-md-3"> 
								<div class="yt-left-wrap">  
						             <div id="layered-navigation">
                                            <div class="block block-layered-nav">
                                                    <div class="block-title">
                                                        <strong><span>Shop by</span></strong>
                                                    </div>
                                                    <div class="block-content"> 
                                                        <!--<p class="block-subtitle">Shopping Options</p>-->
                                                            <dl id="narrow-by-list">
                        	                                     <div class="filter-wrapp Price">
                                                                         <p>
                                                                          <label for="amount">Price range:</label>
                                                                          <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
                                                                        </p>
                                                                       
								                                            <dt class="Price last odd"><span>Price</span></dt>
									                                        <dd class="scroll-1 last odd">
                                                                                <div class="wrap-price-shopby">
	                                                                                <div class="ac-shopby">
		                                                                                <div class="price-input">
			                                                                                <input class="input-text txt-price-shopby" id="price-filter-min-text" type="text" value="20">
			                                                                                <input class="input-text txt-price-shopby" id="price-filter-max-text" type="text" value="230">
		                                                                                </div>
		                                                                                <div class="btn-shopby-wrapper">
			                                                                                <button id="button-price-slider" type="button" title="Search" class="button btn-shopby" onclick="callwebservice(true, true)" value=""><span><span>Search</span></span></button>
		                                                                                </div>
	                                                                                </div> 
                                                                                    <div id="slider" style="margin-top:5px;"></div>
                                                                                </div> 
									                                        </dd>
								                                        </div>  
                                                            </dl> 
                                                             
                				 
                                                    </div>
                                          </div> 
                                     </div>
                                </div>   
							 </div>  
						</div> 
                        <div id="yt_main" class="yt-main-right yt-main col-main col-lg-9 col-md-9">
                                <div class="yt_main_inner">
                                        <noscript>
                                            <div class="global-site-notice noscript">
                                                <div class="notice-inner">
                                                    <p>
                                                        <strong>JavaScript seems to be disabled in your browser.</strong><br />
                                                        You must have JavaScript enabled in your browser to utilize the functionality of this website.
                                                    </p>
                                                </div>
                                            </div>
                                        </noscript>

                                        <div class="page-title category-title title-r title-visible">
                                            <h1><span id="CategoryTitle"></span></h1>
                                        </div> 
                                        <div id="ajax-errors" style="display: none;">
                                            <ul class="messages">
                                                <li class="error-msg">
                                                    <ul>
                                                        <li><span>An error occurred, please try again later.</span></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                        <div id="loading" style="display: none; margin-bottom: 10px; text-align: center;">
                                            <img class="v-middle" alt="" src="../skin/frontend/onlinesabjiwala/default/images/loading-qv.gif">
                                        </div>
                                        <div id="catalog-listing">
                                            <div class="category-products">
                                                <div class="toolbar">
                                                    <div class="toolbar-inner">
                                                        <div class="sorter">
                                                            <div style="display: none;" class="view-mode-wrap">
                                                                <p class="view-mode">
                                                                    <strong title="Grid" class="grid">Grid</strong>&nbsp;
                                                                                            <a href="fruitsa927.html?mode=list" title="List" class="list">List</a>&nbsp;
                                                                </p>
                                                            </div>

                                                            <div class="sort-by-wrap">
                                                                <div class="sort-by">
                                                                    <label>Sort By</label>
                                                                    <div class="select-new">
                                                                        <div id="select-inner-dropdown" class="select-inner dropdown">
                                                                            <div class="overwrite-sortby"></div>
                                                                            <span class="btn-toolbar" data-toggle="dropdown"></span>
                                                                            <ul id="sort_by" class="dropdown-menu">
                                                                                <li>
                                                                                    <a href="#">Position</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="#">Name</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="#" class="selected">Price</a>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <a class="btn-sortby set-desc arrow-down" href="fruits9945.html?dir=desc&amp;mode=grid&amp;order=price" title="Set Descending Direction">Desc</a>
                                                                </div>
                                                            </div>

                                                            <div class="limiter-wrap">
                                                                <div class="limiter1">
                                                                    <label>Show</label>
                                                                    <div id="select-new-limiter1" class="select-new">
                                                                        <div class="select-inner dropdown">
                                                                            <div class="overwrite-limiter"></div>
                                                                            <span class="btn-toolbar" data-toggle="dropdown"></span>
                                                                            <ul id="limiter1" class="dropdown-menu">
                                                                                <li><a href="#">8</a></li>
                                                                                <li><a href="#">16</a></li>
                                                                                <li><a href="#">32</a></li>
                                                                                <li><a href="#" class="selected">All</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                            <div id="show_paginator"></div> 
                               
                                                        </div>
                                                    </div>
                                                    <script>
                                                        $(document).ready(function ($) {   
                                                            $(".sort-by-wrap .overwrite-sortby").html($('#sort_by li a.selected').html());
                                                            $('.category-products #limiter li:first-child a').removeClass('selected');
                                                            $(".limiter-wrap .overwrite-limiter").html($('#limiter li a.selected').html());

                                                            $("ul#limiter.dropdown-menu li").change(function () {
                                                                //alert($(this).val());
                                                                //console.log($(this).val());
                                                            });
                                                        });
                                                    </script>
                                                </div>
                                                <div class="products-grid row">

                      
                                                </div>
                    
                                                <div class="toolbar-bottom">
                                                    <div class="toolbar">
                                                        <div class="toolbar-inner">
                                                            <div class="sorter">
                                                                <div style="display: none;" class="view-mode-wrap">
                                                                    <p class="view-mode">
                                                                        <strong title="Grid" class="grid">Grid</strong>&nbsp;
                                                                        <a href="fruitsa927.html?mode=list" title="List" class="list">List</a>&nbsp;
                                                                    </p>
                                                                </div>

                                                                <div class="sort-by-wrap">
                                                                    <div class="sort-by">
                                                                        <label>Sort By</label>
                                                                        <div class="select-new">
                                                                                <div id="select-inner-dropdown1" class="select-inner dropdown">
                                                                                <div class="overwrite-sortby"></div>
                                                                                <span class="btn-toolbar" data-toggle="dropdown"></span>
                                                                                <ul id="sort_by1" class="dropdown-menu">
                                                                                    <li>
                                                                                        <a href="#">Position</a>
                                                                                    </li>
                                                                                    <li>
                                                                                        <a href="#">Name</a>
                                                                                    </li>
                                                                                    <li>
                                                                                        <a href="#" class="selected">Price</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        <a class="btn-sortby set-desc arrow-down" href="fruits9945.html?dir=desc&amp;mode=grid&amp;order=price" title="Set Descending Direction">Desc</a>
                                                                    </div>
                                                                </div>
                                                                <div class="limiter-wrap">
                                                                    <div class="limiter">
                                                                        <label>Show</label>
                                                                        <div id="select-new-limiter" class="select-new">
                                                                            <div id="targetdiv" class="select-inner dropdown">
                                                                                <div class="overwrite-limiter"></div>
                                                                                <span class="btn-toolbar" data-toggle="dropdown"></span>
                                                                                <ul id="limiter" class="dropdown-menu">
                                                                                    <li><a href="#">8</a></li>
                                                                                    <li><a href="#">16</a></li>
                                                                                    <li><a href="#">32</a></li>
                                                                                    <li><a href="#" class="selected">All</a></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="show_paginator1" id="show_paginator1"></div> 
                                                            </div>
                                                            <input type="hidden" name="fruitcount" id="fruitcount" value="" />
                                                            <input type="hidden" name="page" id="page" value="1" />
                                                        </div>
                                                        <script>
                                                            $('div#select-new-limiter')
                                                                .mouseover(function () {
                                                                    $('ul#limiter').css('display', 'block');
                                                                })
                                                                .mouseout(function () {
                                                                    $('ul#limiter').css('display', 'none');
                                                                }
                                                                );

                                                            $('div#select-new-limiter1')
                                                                .mouseover(function () {
                                                                    $('ul#limiter1').css('display', 'block');
                                                                })
                                                                .mouseout(function () {
                                                                    $('ul#limiter1').css('display', 'none');
                                                                }
                                                                );


                                                            $('div#select-inner-dropdown')
                                                                .mouseover(function () {
                                                                    $('ul#sort_by').css('display', 'block');
                                                                })
                                                                .mouseout(function () {
                                                                    $('ul#sort_by').css('display', 'none');
                                                                }
                                                            );

                                                            $('div#select-inner-dropdown1')
                                                                .mouseover(function () {
                                                                    $('ul#sort_by1').css('display', 'block');
                                                                })
                                                                .mouseout(function () {
                                                                    $('ul#sort_by1').css('display', 'none');
                                                                }
                                                                );

                                                            $('ul#limiter > li').click(function () {
                                                                $('div.overwrite-limiter').text($(this.childNodes).text());
                                                                $('ul#limiter').css('display', 'none');
                                                                $('ul.pagination.bootpag:eq(0) > li').removeClass("active");
                                                                $('ul.pagination.bootpag:eq(0) > li:eq(2)').addClass("active");
                                                                $('ul.pagination.bootpag:eq(1) > li').removeClass("active");
                                                                $('ul.pagination.bootpag:eq(1) > li:eq(2)').addClass("active");
                                                                //return jQuery("#show_paginator,.show_paginator1").bootpag({
                                                                //    page: 2
                                                                //});
                                                                callwebservice(false, true);
                                                            });

                                                            $('ul#limiter1 > li').click(function () {
                                                                $('div.overwrite-limiter').text($(this.childNodes).text());
                                                                $('ul#limiter1').css('display', 'none');
                                                                $('ul.pagination.bootpag:eq(0) > li').removeClass("active");
                                                                $('ul.pagination.bootpag:eq(0) > li:eq(2)').addClass("active");
                                                                $('ul.pagination.bootpag:eq(1) > li').removeClass("active");
                                                                $('ul.pagination.bootpag:eq(1) > li:eq(2)').addClass("active");
                                                                 
                                                                callwebservice(false, true);
                                                            });


                                                            $('ul#sort_by > li').click(function () {
                                                                $('div.overwrite-sortby').text($(this.childNodes).text());
                                                                $('ul#sort_by').css('display', 'none');
                                                                callwebservice(false, false);
                                                            });

                                                            $('ul#sort_by1 > li').click(function () {
                                                                $('div.overwrite-sortby').text($(this.childNodes).text());
                                                                $('ul#sort_by1').css('display', 'none');
                                                                callwebservice(false, false);
                                                            });

                                                            function callwebservice(resettotal, setpage) {
                                                                var querystring = (window.location.href).substring((window.location.href).lastIndexOf('/') + 1, (window.location.href).length);
                                                                var sort = $('div.overwrite-sortby:first').html();
                                                                var pagesize = $('div.overwrite-limiter:first').html();
                                                                var index = $('ul.pagination.bootpag > li.active > a').html();
                                                                var all;
                                                                if (pagesize == 'All') {
                                                                    all = true;
                                                                    pagesize = -1;
                                                                }
                                                                else {
                                                                    all = false;
                                                                }

                                                                var min = $("#price-filter-min-text").val();
                                                                var max = $("#price-filter-max-text").val();

                                                                //alert('min :' + min);
                                                                //alert('max :' + max);
                                                                console.log('sort ' + sort);
                                                                console.log('pagesize ' + pagesize);
                                                                console.log('index ' + index);
                                                                console.log('all ' + all);
                                                               
                                                                getFruits(sort, pagesize, index, all, min, max, querystring);
                                                                $.when(getFruits(sort, pagesize, index, all, min, max, querystring)).done(function (data) {
                                                                   // alert(data.vmProductDetailsSummary.TotalRecords);
                                                                    if (resettotal == true) {
                                                                        $("#fruitcount").val(data.vmProductDetailsSummary.TotalRecords);
                                                                    }
                                                                    //if (data.vmProductDetailsSummary.TotalRecords == 0) {
                                                                    //    console.log('sort ' + sort);
                                                                    //    console.log('pagesize ' + pagesize);
                                                                    //    console.log('index ' + index);
                                                                    //    console.log('all ' + all);
                                                                    //}  
                                                                    LoopAndGenerate(data.vmProductDetails, querystring);
                                                                   
                                                                    return jQuery("#show_paginator,.show_paginator1").bootpag({
                                                                            page:(setpage) ? 1 : $("#page").val(),
                                                                            total: (parseInt($("#fruitcount").val()) / pagesize) + ((parseInt($("#fruitcount").val()) % parseInt(pagesize)) != 0 ? 1 : 0)
                                                                        });
                                                                    
                                                                });
                                                            }
                                                        </script>
                                                        <script>
                                                            $(document).ready(function ($) {

                                                                var querystring = (window.location.href).substring((window.location.href).lastIndexOf('/') + 1, (window.location.href).length);

                                                                var min =-1;
                                                                var max = -1;
                                                                $(document).ajaxStart(function () {
                                                                    //$('body').css('opacity', '0.2');
                                                                    $("#pageloaddiv").css('display', 'block');
                                                                });

                                                                $(document).ajaxStop(function () {
                                                                    //$('body').css('opacity', '1');
                                                                    $("#pageloaddiv").css('display', 'none');
                                                                });

                                                                $(document).ajaxError(function (event, xhr, options, exc) {
                                                                    console.log("An error occurred!");
                                                                });


                                                                //console.log('dom loaded');
                                                                $(".sort-by-wrap .overwrite-sortby").html($('#sort_by li a.selected').html());
                                                                $('.category-products #limiter li:first-child a').removeClass('selected');
                                                                $(".limiter-wrap .overwrite-limiter").html($('#limiter li a.selected').html());
                                                                getFruits('Price', -1, 1, true, min, max, querystring);
                                                                $.when(getFruits('Price', -1, 1, true, min, max, querystring)).done(function (data) {
                                                                    $("#fruitcount").val(data.vmProductDetailsSummary.TotalRecords);
                                                                    $("#CategoryTitle").text(querystring);
                                                                    LoopAndGenerate(data.vmProductDetails, querystring);
                                                                    jQuery('#show_paginator,.show_paginator1').bootpag({
                                                                        total: 1,
                                                                        page: 1,
                                                                        maxVisible: 5,
                                                                        leaps: true,
                                                                        firstLastUse: true,
                                                                        first: '←',
                                                                        last: '→',
                                                                        wrapClass: 'pagination',
                                                                        activeClass: 'active',
                                                                        disabledClass: 'disabled',
                                                                        nextClass: 'next',
                                                                        prevClass: 'prev',
                                                                        lastClass: 'last',
                                                                        firstClass: 'first'
                                                                    }).on('page', function (event, num) {
                                                                        //alert('paging function triggered value of num ' + num);
                                                                        console.log('paging triggers from here in doc ready num is ' + num);
                                                                        $("#page").val(num);


                                                                        callwebservice(false, false);
                                                                    });

                                                                    min = data.vmProductDetailsSummary.MinimumPrice;
                                                                    max = data.vmProductDetailsSummary.MaximumPrice;

                                                                    $("#price-filter-min-text").val(min);
                                                                    $("#price-filter-max-text").val(max);
                                                                     

                                                                    $("#slider").slider({
                                                                        range: true,
                                                                        min: min,
                                                                        max: max,
                                                                        values: [min, max],
                                                                        slide: function (event, ui) {
                                                                            $("#price-filter-min-text").val(ui.values[0]);
                                                                            $("#price-filter-max-text").val(ui.values[1]);
                                                                            $("#amount").val("Rs" + ui.values[0] + " - Rs" + ui.values[1]);
                                                                        }
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
                  </div>
   </div>
</asp:Content>
