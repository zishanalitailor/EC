<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSabji.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="EcommGroceryStore.checkout" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> 
    <div class="yt-main-inner yt-content-inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="col-1-wrapper">
                        <div class="cart">
                            <div class="page-title title-buttons">
                                <h1>Shopping Cart</h1>
                            </div>
                            <ul class="messages">
                                <li class="notice-msg">
                                    <ul>
                                        <li><span>Minimum order amount is ₹200.00</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <form action="http://www.theanchorvizag.com/checkout/cart/updatePost/" method="post">
                                <input name="form_key" type="hidden" value="pQkADNkFwZmhwAqv">
                                <fieldset>
                                    <table id="shopping-cart-table" class="data-table cart-table">

                                        <thead>
                                            <tr class="first last">
                                                <th rowspan="1">&nbsp;</th>
                                                <th rowspan="1"><span class="nobr">Product Name</span></th>
                                                <th rowspan="1"></th>
                                                <th class="a-center" colspan="1"><span class="nobr">Unit Price</span></th>
                                                <th rowspan="1" class="a-center">Qty</th>
                                                <th class="a-center" colspan="1">Subtotal</th>
                                                <th rowspan="1" class="a-center">&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr class="first last">
                                                <td colspan="50" class="a-right last"> 
                                                    <button type="button" id="ContinueShopping" title="Continue Shopping" class="button btn-continue"><span><span>Continue Shopping</span></span></button>
                                                    <button type="button" name="update_cart_action" id="update_cart_action" value="update_qty" title="Update Shopping Cart" class="button btn-update"><span><span>Update Shopping Cart</span></span></button>
                                                    <button type="submit" name="update_cart_action" value="empty_cart" title="Clear Shopping Cart" class="button btn-empty" id="empty_cart_button"><span><span>Clear Shopping Cart</span></span></button>                                                   
                                                </td>
                                            </tr>
                                        </tfoot>
                                        <tbody> 
                                        </tbody>
                                    </table>
                                    <%--<script type="text/javascript">decorateTable('shopping-cart-table')</script>--%>
                                </fieldset>
                            </form>
                            <div class="cart-collaterals">
                                <div class="col2-set">
                                    <div class="row">
                                        <div class="col-1 col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        </div>
                                        <div class="col-2 col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <form id="discount-coupon-form" action="http://www.theanchorvizag.com/checkout/cart/couponPost/" method="post">
                                                <div class="discount">
                                                    <h2>Discount Codes</h2>
                                                    <div class="discount-form">
                                                        <label for="coupon_code">Enter your coupon code if you have one.</label>
                                                        <input type="hidden" name="remove" id="remove-coupone" value="0">
                                                        <div class="input-box">
                                                            <input class="input-text" id="coupon_code" name="coupon_code" value="">
                                                        </div>
                                                        <div class="buttons-set">
                                                            <button type="button" title="Apply Coupon" class="button" onclick="discountForm.submit(false)" value="Apply Coupon"><span><span>Apply Coupon</span></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <script type="text/javascript">
                                                //<![CDATA[
                                                var discountForm = new VarienForm('discount-coupon-form');
                                                discountForm.submit = function (isRemove) {
                                                    if (isRemove) {
                                                        $('coupon_code').removeClassName('required-entry');
                                                        $('remove-coupone').value = "1";
                                                    } else {
                                                        $('coupon_code').addClassName('required-entry');
                                                        $('remove-coupone').value = "0";
                                                    }
                                                    return VarienForm.prototype.submit.bind(discountForm)();
                                                }
                                                //]]>
                                            </script>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                            <div class="totals">
                                                <table id="shopping-cart-totals-table">
                                                    <colgroup>
                                                        <col>
                                                        <col width="1">
                                                    </colgroup>
                                                    <tfoot>
                                                        <tr>
                                                            <td style="" class="a-right" colspan="1">
                                                                <strong>Grand Total</strong>
                                                            </td>
                                                            <td style="" class="a-right">
                                                                <strong><span id="checkout_grandtotal" class="price"> </span></strong>
                                                            </td>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <tr>
                                                            <td style="" class="a-right" colspan="1">Subtotal    </td>
                                                            <td style="" class="a-right">
                                                                <span id="checkout_subtotal" class="price"> </span>    </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <ul class="checkout-types">
                                                    <li>
                                                        <asp:Button  OnClick="btnCheckOut_Click" runat="server" id="btncheckout" Text="Confirm Order" />
                                                        <asp:LinkButton class="button btn-proceed-checkout btn-checkout no-checkout"  OnClick="btnCheckOut_Click" ID="lnkCheckOut" runat="server" >Confirm Order</asp:LinkButton>
                                                        <%-- <button type="button" title="Proceed to Checkout" class="button btn-proceed-checkout btn-checkout no-checkout" onclick="window.location='http://www.theanchorvizag.com/checkout/onepage/';"><span><span>Confirm Order</span></span></button--%>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
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
    <script src="/../Scripts/custom/cart.js"></script>
    <script type="text/javascript">
              $("#update_cart_action").click(function () { 
                  UpdateCart();
              });         

              $("#ContinueShopping").click(function () { 
                  window.location.replace("/indexchild");
              });

              $("#empty_cart_button").click(function () {
                  EmptyCart();
              }); 
    </script>

<style type="text/css">
      .btn-checkout {
          padding:8px;
      }
  </style>     
</asp:Content>
