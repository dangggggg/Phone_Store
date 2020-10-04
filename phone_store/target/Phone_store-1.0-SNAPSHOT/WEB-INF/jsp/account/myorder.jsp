<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <!-- head -->
    <head>
        <title>My order</title>
        <jsp:include page="../include/css_page_index.jsp"/>
        <style>
                .img-thumbnail-list{
                    width: 50px;
                    height: 67px;
                    margin-right: 10px;
                }
            </style>
        </head>
        <body>
            <!-- Mobile Menu -->
        <jsp:include page="../include/mobile-menu.jsp"/>

        <div class="super_container">

            <!-- Header -->
            <jsp:include page="../include/header.jsp"/>

            <div class="super_container_inner">
                <div class="super_overlay"></div>		
                <div class="container">
                    <div class="row" style="margin-top: 100px">
                        <div class="col-lg-6 offset-lg-3">
                            <div class="section_title text-center">My Order</div>
                        </div>
                    </div>
                    <div class="row page_nav_row">
                        <div class="col">
                            <div class="page_nav">
                                <ul class="d-flex flex-row align-items-start justify-content-center">
                                    <jsp:include page="../include/account-menu.jsp"/>                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 3em">
                        <div class="col-xs-6 col-sm-6">
                            <a href="<c:url value="/downloadOrderExcel"/>"><i class="fa fa-download" aria-hidden="true"></i> Export to Excel</a>
                        </div>
                        <div class="col-xs-6 col-sm-6">
                            <form action="${pageContext.request.getContextPath()}/search" class="form-inline" style="float: right">
                                <div class="form-group">
                                    <input type="hidden" name="action" value="searchOrder" />
                                    <input type="text" name="searchText" class="form-control" />
                                    <button type="submit" class="btn btn-primary" style="margin-left: 5px">Search</button>  
                                </div>                                    
                            </form> 
                        </div>
                    </div>            
                    <div class="row mainmain">
                        <div class="col-xs-12 col-sm-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Date</th>
                                        <th>Product</th>
                                        <th>Color</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Total Price</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    <c:forEach var="o" items="${orders}">
                                        <c:forEach var="od" items="${o.orderDetails}" varStatus="status">
                                            <tr>
                                                <c:if test="${status.index == 0}">
                                                    <td class="align-middle" rowspan="${o.orderDetails.size()}">${o.id}</td>
                                                    <td class="align-middle" rowspan="${o.orderDetails.size()}">${o.orderDate}</td>
                                                </c:if>
                                                <td class="align-middle"><a href="<c:url value="/product?id=${od.product.id}"/>"><img src="./resources/images/${od.product.images[0].name}" class="img-thumbnail-list"/>${od.product.name}</a></td>
                                                <td class="align-middle">${od.color.color}</td>
                                                <td class="align-middle">${od.quantity}</td>
                                                <td class="align-middle">${od.product.price}</td>
                                                <c:if test="${status.index == 0}">
                                                    <td class="align-middle" rowspan="${o.orderDetails.size()}">${o.totalPrice}</td>
                                                    <td class="align-middle" rowspan="${o.orderDetails.size()}">${o.status}</td>
                                                    <td class="align-middle" rowspan="${o.orderDetails.size()}">
                                                        <c:if test="${o.status == 'PENDING'}">
                                                            <button onclick="cancelOrder(${o.id})" class="btn"><i class="fa fa-trash"></i></button>
                                                            </c:if>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>                                        
                                    </c:forEach>                                    
                                        <c:if test="${fn:length(orders)==0}">
                                            <tr>
                                                <td colspan="9" style="text-align: center">No Order</td>
                                            </tr>
                                        </c:if>
                                </table>
                            </div>
                        </div>
                    </div>
                                <div class="row page_nav_row">
                        <div class="col">
                            <div class="page_nav">
                                <ul class="d-flex flex-row align-items-start justify-content-center">
                                    <c:forEach begin="1" end="${page}" varStatus="status">
                                        <c:choose>
                                            <c:when test="${param.page==null && status.index==1}">
                                                <li class="active"><a href="<c:url value="/account?action=myorder&page=${status.index}"/>">${status.index}</a></li>
                                                </c:when>
                                                <c:when test="${param.page==null && status.index!=1}">
                                                <li><a href="<c:url value="/account?action=myorder&page=${status.index}"/>">${status.index}</a></li>
                                                </c:when>
                                                <c:when test="${param.page!=null && param.page==status.index}">
                                                <li class="active"><a href="<c:url value="/account?action=myorder&page=${status.index}"/>">${status.index}</a></li>
                                                </c:when>                                                   
                                                <c:otherwise>
                                                <li><a href="<c:url value="/account?action=myorder&page=${status.index}"/>">${status.index}</a></li>
                                                </c:otherwise>
                                            </c:choose>                                          
                                        </c:forEach>                                        
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- profile -->



            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="../include/footer.jsp"/>

        <!-- script -->
        <script>
            function cancelOrder(id) {
                var r = confirm("Do you want to cancel an order with id: " + id);
                if (r === true) {
                    window.location.href = "order/cancel/" + id;
                }
            }
        </script>
        <jsp:include page="../include/js_page_index.jsp"/>    
    </body>
</html>