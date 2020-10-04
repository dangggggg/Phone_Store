<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <!-- head -->
    <head>
        <title>Order status</title>
        <jsp:include page="./include/css_page_oder_detail.jsp"/>
            <style>
                .table-footer{
                    font-weight: bold;
                }
                .order-info p{
                    color: #000;
                    font-weight: bold;
                    margin-bottom: 1em;
                }
                .mainmain>div>div:first-child{
                    float: left;
                }
                .mainmain>div>div:nth-of-type(2){
                    float: right;
                    margin-bottom: 2em;
                }
            </style>
        </head>
        <body>
            <!-- Mobile Menu -->
        <jsp:include page="./include/mobile-menu.jsp"/>

            <div class="super_container">

                <!-- Header -->
            <jsp:include page="./include/header.jsp"/>

                <div class="super_container_inner">
                    <div class="super_overlay"></div>		
                    <div class="container">
                        <div class="row" style="margin-top: 100px">
                            <div class="col-lg-6 offset-lg-3">
                                <div class="section_title text-center">Order detail</div>
                            </div>
                        </div>                        
                        <div class="row mainmain">
                            <div class="col-xs-12 col-sm-12">
                                <div class="col-xs-6 col-sm-6">
                                    <div class="order-info">
                                        <p>Order Information</p>
                                        <span>Order Id: #${vieworder.id}</span><br>
                                    <span>Order Date: ${vieworder.orderDate}</span><br>
                                    <span>Order Status: ${vieworder.status} <c:if test="${vieworder.status!= 'CANCELLED'}"><a href="<c:url value="/order/cancel?id=${vieworder.id}&email=${vieworder.shipping.email}"/>">Cancel?</a></c:if></span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6">
                                <div class="order-info">
                                    <p>Shipping Information</p>
                                    <span>Full name: ${vieworder.shipping.fullName}</span><br>
                                    <span>Email: ${vieworder.shipping.email}</span><br>
                                    <span>Phone: ${vieworder.shipping.phone}</span><br>
                                    <span>Address: ${vieworder.shipping.address}</span>
                                </div>
                            </div>


                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Color</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="od" items="${vieworder.orderDetails}">
                                        <tr>
                                            <td><a href="<c:url value="/product?id=${od.product.id}"></c:url>">${od.product.name}</a></td>
                                            <td>${od.color.color}</td>
                                            <td>${od.product.price}</td>
                                            <td>${od.quantity}</td>
                                            <td>$ ${od.total}</td>
                                        </tr>
                                    </c:forEach>   
                                    <tr class="table-footer">
                                        <td colspan="4">Total</td>
                                        <td>$ ${vieworder.total}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="./include/footer.jsp"/>

            <!-- script -->
         <jsp:include page="./include/js_page_oder_detail.jsp"/>   
    </body>
</html>