<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Checkout</title>
        <jsp:include page="./include/css_page_checkout.jsp"/>
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
                            <div class="home_title">Checkout</div>
                            <div class="breadcrumbs d-flex flex-column align-items-center justify-content-center">
                                <ul class="d-flex flex-row align-items-start justify-content-start text-center">
                                    <li><a href="#">Home</a></li>
                                    <li>Checkout</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Checkout -->
                <f:form action="${pageContext.request.getContextPath()}/checkout-process" method="post" modelAttribute="shipping" id="checkout_form" class="checkout_form">
                    <div class="checkout">
                        <div class="container">
                            <div class="row">

                                <!-- Billing -->
                                <div class="col-lg-6">
                                    <div class="billing">
                                        <div class="checkout_title">Customer Information</div>
                                        <div class="checkout_form_container">

                                            <div>
                                                <input type="text" id="checkout_name" name="fullName" class="checkout_input" value="${account.fullName}" placeholder="Full Name" pattern="[A-Za-z ]{3,50}" title="Only letters and space are allowed, length 3-50" required>
                                            </div>								

                                            <div>
                                                <!-- Address -->
                                                <input type="text" id="checkout_address" name="address" class="checkout_input" value="${account.address}" placeholder="Address Line" required>

                                            </div>									

                                            <div>
                                                <!-- Phone no -->
                                                <input type="text" id="checkout_phone" name="phone" class="checkout_input" value="${account.phone}" placeholder="Phone No." pattern="[0-9]{10,11}" title="Only numbers are allowed, length 10-11" required>
                                            </div>
                                            <div>
                                                <!-- Email -->
                                                <input type="email" id="checkout_email" name="email" class="checkout_input" value="${account.email}" placeholder="Email" required>
                                            </div>                                           

                                        </div>
                                    </div>
                                </div>

                                <!-- Cart Total -->
                                <div class="col-lg-6 cart_col">
                                    <div class="cart_total">
                                        <div class="cart_extra_content cart_extra_total">
                                            <div class="checkout_title">Cart Total</div>
                                            <ul class="cart_extra_total_list">
                                                <li class="d-flex flex-row align-items-center justify-content-start">
                                                    <div class="cart_extra_total_title">Subtotal</div>
                                                    <div class="cart_extra_total_value ml-auto">$${order.total}</div>
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

                                            
                                            <button class="checkout_button trans_200" type="submit"><span>place order</span></button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </f:form>
                <!-- Footer -->
                <jsp:include page="./include/footer.jsp"/>

            </div>

        </div>
        <script>
            function placeOrder() {
                $('#checkout_form').submit();
            }

        </script>
        <jsp:include page="./include/js_page_checkout.jsp"/>
    </body>
</html>
