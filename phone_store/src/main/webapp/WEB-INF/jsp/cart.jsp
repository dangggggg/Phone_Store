<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Cart</title>
        <jsp:include page="./include/css_page_cart.jsp"/>

        </head>       
        <body>

            <!-- Mobile Menu -->
        <jsp:include page="./include/mobile-menu.jsp"/>

            <div class="super_container">

                <!-- Header -->
            <jsp:include page="./include/header.jsp"/>

                <div class="super_container_inner">
                    <div class="super_overlay"></div>

                    <!-- Home -->

                    <div class="home">
                        <div class="home_container d-flex flex-column align-items-center justify-content-end">
                            <div class="home_content text-center">
                                <div class="home_title">Shopping Cart</div>
                                <div class="breadcrumbs d-flex flex-column align-items-center justify-content-center">                                   
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Cart -->

                    <div class="cart_section">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="cart_container">
                                        <p style="font-size: 150%;color: red;text-align: center">${messageError}</p>
                                    <p style="font-size: 150%;color: blue;text-align: center">${messageSuccess}</p>
                                    <!-- Cart Bar -->
                                    <div class="cart_bar">
                                        <ul class="cart_bar_list item_list d-flex flex-row align-items-center justify-content-end">
                                            <li class="mr-auto">Product</li>
                                            <li>Discount</li>
                                            <li>Color</li>
                                            <li>Price</li>
                                            <li>Quantity</li>
                                            <li>Total</li>
                                            <li style="width: 100px">Action</li>
                                        </ul>
                                    </div>

                                    <!-- Cart Items -->
                                    <div class="cart_items">
                                        <ul class="cart_items_list">
                                            <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                <!-- Cart Item -->
                                                <li class="cart_item item_list d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-end justify-content-start">
                                                    <div class="product d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start mr-auto">
                                                      
                                                        <div><div class="product_image"><img src="./resources/images/${orderDetail.product.images[0].name}" alt=""></div></div>
                                                        <div class="product_name_container">
                                                            <div class="product_name"><a href="<c:url value="/product?id=${orderDetail.product.id}"></c:url>">${orderDetail.product.name}</a></div>
                                                            <!--<div class="product_text">${orderDetail.product.description}</div>-->
                                                        </div>
                                                    </div>
                                                            <div class="product_text"><span>Discount: </span>${orderDetail.promotion.discount}<c:if test="${orderDetail.promotion.discount != null}">%</c:if> </div>    
                                                    <div class="product_color product_text"><span>Color: </span>${orderDetail.color.color}</div>
                                                    <div class="product_price product_text"><span>Price: </span>$${orderDetail.product.price}</div>
                                                    <div class="product_quantity_container">
                                                        <div class="product_quantity ml-lg-auto mr-lg-auto text-center">
                                                            <span class="product_text product_num">${orderDetail.quantity}</span>
                                                            <div class="qty_sub qty_button trans_200 text-center"><span>-</span></div>
                                                            <div class="qty_add qty_button trans_200 text-center"><span>+</span></div>
                                                        </div>
                                                    </div>
                                                    <div class="product_total product_text"><span>Total: </span>$${orderDetail.total}</div>
                                                    <div style="width: 100px">      
                                                        <input type="hidden" name="cart_product_id" value="${orderDetail.product.id}" />
                                                        <input type="hidden" name="cart_product_color" value="${orderDetail.color.id}" />
                                                        <button class="btn"><i class="fa fa-refresh"></i></button> 
                                                        <button class="btn"><i class="fa fa-trash"></i></button>  
                                                    </div>
                                                </li>
                                            </c:forEach>
                                            <c:if test="${order == null || fn:length(order.orderDetails) == 0}">
                                                <li style="text-align: center"><h3>Your cart is empty</h3></li>
                                                </c:if>
                                        </ul>
                                    </div>

                                    <!-- Cart Buttons -->
                                    <div class="cart_buttons d-flex flex-row align-items-start justify-content-start">
                                        <div class="cart_buttons_inner ml-sm-auto d-flex flex-row align-items-start justify-content-start flex-wrap">
                                            <c:if test="${order != null || fn:length(order.orderDetails) > 0}">
                                                <div class="button button_clear trans_200"><a href="<c:url value="/order/clear"></c:url>">clear cart</a></div>              
                                            </c:if>                                                         
                                            <div class="button button_continue trans_200"><a href="<c:url value="/home"></c:url>">continue shopping</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <c:if test="${order != null && fn:length(order.orderDetails) > 0}">          
                            <div class="row cart_extra_row">
                                <div class="col-lg-6">
                                    <div class="cart_extra cart_extra_1">
                                        <div class="cart_extra_content cart_extra_coupon">
                                            <div class="cart_extra_title">Coupon code</div>
                                            <div class="coupon_form_container">
                                                <form action="${pageContext.request.getContextPath()}/apply-promotion" method="post" id="coupon_form" class="coupon_form">
                                                    <input type="text" name="promotion_name" class="coupon_input" required="required">
                                                    <button type="submit" class="coupon_button">apply</button>
                                                </form>
                                            </div>
                                            <div class="coupon_text">List of promotional codes applied:</div>
                                            <div style="margin-top: 15px">
                                                <ul class="list-group list-group-flush">
                                                    <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                        <c:if test="${orderDetail.promotion != null}">
                                                            <li class="list-group-item">  ${orderDetail.promotion.name}</li>
                                                            </c:if>                                                        
                                                        </c:forEach>                                                    
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 cart_extra_col">
                                    <div class="cart_extra cart_extra_2">
                                        <div class="cart_extra_content cart_extra_total">
                                            <div class="cart_extra_title">Cart Total</div>
                                            <ul class="cart_extra_total_list">
                                                <li class="d-flex flex-row align-items-center justify-content-start">
                                                    <div class="cart_extra_total_title">Subtotal</div>
                                                    <div class="cart_extra_total_value ml-auto">$${order.total}</div>
                                                </li>
                                                <li class="d-flex flex-row align-items-center justify-content-start">
                                                    <div class="cart_extra_total_title">Discount</div>
                                                    <div class="cart_extra_total_value ml-auto">$${order.totalDiscount}</div>
                                                </li>
                                                <li class="d-flex flex-row align-items-center justify-content-start">
                                                    <div class="cart_extra_total_title">Shipping</div>
                                                    <div class="cart_extra_total_value ml-auto">Free</div>
                                                </li>
                                                <li class="d-flex flex-row align-items-center justify-content-start">
                                                    <div class="cart_extra_total_title">Total</div>
                                                    <div class="cart_extra_total_value ml-auto">$${order.total}</div>
                                                </li>
                                            </ul>

                                            <div class="checkout_button trans_200"><a href="<c:url value="/checkout"></c:url>">proceed to checkout</a></div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </c:if>
                    </div>
                </div>

                <!-- Footer -->
                <jsp:include page="./include/footer.jsp"/>
                </div>

            </div>

            <!-- script -->
        <jsp:include page="./include/js_page_cart.jsp"/>
    </body>
</html>